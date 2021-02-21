import Foundation

typealias Parameters = [String: Any]?
typealias Headers = [String: String]?

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol NetworkRouter {
    var baseURL: String { get }
    var path: String { get }
    var headers: [String: String] { get }
    var parameters: [String: Any] { get }
    var body: [String: Any?] { get }
    var method: HTTPMethod { get }
    
    func request() throws -> URLRequest
}

extension NetworkRouter {
    func request() throws -> URLRequest {
        try HTTPNetworkRequest.configureHTTPRequest(from: self)
    }
}
