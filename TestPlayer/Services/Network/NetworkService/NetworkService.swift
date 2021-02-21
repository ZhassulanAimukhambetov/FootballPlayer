import Foundation

struct NetworkService {
    
    private init() {}
    
    static let shared = NetworkService()
    let session = URLSession(configuration: .default)
    
    func call<T: Decodable>(_ router: NetworkRouter, _ completion: @escaping (Result<T, NetworkError>) -> ()) {
        
        do {
            let request = try router.request()
            
            session.dataTask(with: request) { (data, res, err) in
                
                if let response = res as? HTTPURLResponse, let unwrappedData = data {
                    
                    let result = HTTPNetworkResponse.handleNetworkResponse(for: response)
                    switch result {
                    case .success:
                        guard let result = try? JSONDecoder().decode(T.self, from: unwrappedData) else {
                            DispatchQueue.onMain { completion(.failure(.decodingFailed)) }
                            return
                        }
                        DispatchQueue.onMain { completion(.success(result)) }
                    case .failure(let err):
                        print("NETWORK ERROR: - ", err)
                        DispatchQueue.onMain { completion(.failure(.failed)) }
                    }
                }
            }.resume()
        } catch {
            DispatchQueue.onMain { completion(.failure(NetworkError.badRequest)) }
        }
    }
}
