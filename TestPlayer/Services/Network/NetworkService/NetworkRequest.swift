import Foundation

struct HTTPNetworkRequest {
    /// Set the body, method, headers, and paramaters of the request
    static func configureHTTPRequest(from route: NetworkRouter) throws -> URLRequest {
        let urlString = route.baseURL + route.path
        guard let url = URL(string: urlString) else { throw NetworkError.missingURL}
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
        
        request.httpMethod = route.method.rawValue
        let httpBody = try? JSONSerialization.data(withJSONObject: route.body, options: [])
        request.httpBody = httpBody
        try configureParametersAndHeaders(parameters: route.parameters, headers: route.headers, request: &request)
        
        return request
    }
    
    /// Configure the request parameters and headers before the API Call
    static func configureParametersAndHeaders(parameters: Parameters?,
                                              headers: Headers?,
                                              request: inout URLRequest) throws {
        do {
            if let headers = headers, let parameters = parameters {
                try URLEncoder.encodeParameters(for: &request, with: parameters)
                try URLEncoder.setHeaders(for: &request, with: headers)
            }
        } catch {
            throw NetworkError.encodingFailed
        }
    }
}
