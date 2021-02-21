import Foundation

struct HTTPNetworkResponse {
    // Properly checks and handles the status code of the response
    static func handleNetworkResponse(for response: HTTPURLResponse?) -> Result<String, NetworkError> {
        
        guard let res = response else { return Result.failure(.UnwrappingError)}
        
        switch res.statusCode {
        case 200...299: return Result.success(NetworkError.success.rawValue)
        case 401: return Result.failure(.authenticationError)
        case 400...499: return Result.failure(.badRequest)
        case 500...599: return Result.failure(.serverSideError)
        default: return Result.failure(.failed)
        }
    }
}
