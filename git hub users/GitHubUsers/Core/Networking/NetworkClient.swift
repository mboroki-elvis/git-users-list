import Foundation

protocol NetworkClient {
    /**
     * Handles the `GET` HTTP requests of an URL.
     *
     *  - Parameters:
     *      - endpoint: the request endpoint String to be sent.
     *      - headers: a list of key-value pairs representing each HTTP header to be passed.
     *      - type: the `Codable` expected type to be returned from the request.
     *
     *  - Returns:
     *      A `Result` with either a successfully decoded `T` object or a `NetworkError`.
     */
    func get<T: Decodable>(
        endpoint: String,
        headers: HTTPHeaders,
        queryParams: [String: Any]?,
        expecting type: T.Type
    ) async -> Result<T, NetworkError>

    /**
     * Handles the `POST` HTTP requests of an URL.
     *
     *  - Parameters:
     *      - endpoint: the request endpoint String to be sent.
     *      - headers: a list of key-value pairs representing each HTTP header to be passed.
     *      - body: optional `Data` to be passed as the HTTP body for the request.
     *      - type: the `Codable` expected type to be returned from the request.
     *
     *  - Returns:
     *      A `Result` with either a successfully decoded `T` object or a `NetworkError`.
     */
    func post<T: Decodable>(
        endpoint: String,
        headers: HTTPHeaders,
        body: Data?,
        expecting type: T.Type
    ) async -> Result<T, NetworkError>

    /**
     * Handles HTTP requests of an URL.
     *
     *  - Parameters:
     *      - endpoint: the request endpoint String to be sent.
     *      - method: the HTTP method to use.
     *      - headers: a list of key-value pairs representing each HTTP header to be passed.
     *      - body: optional `Data` to be passed as the HTTP body for the request.
     *      - type: the `Codable` expected type to be returned from the request.
     *
     *  - Returns:
     *      A `Result` with either a successfully decoded `T` object or a `NetworkError`.
     */
    func request<T: Decodable>(
        endpoint: String,
        method: HTTPMethod,
        headers: HTTPHeaders,
        body: Data?,
        queryParams: [String: Any]?,
        expecting type: T.Type
    ) async -> Result<T, NetworkError>

    /**
     Creates a URLRequest for a given API endpoint with specified parameters.

     - Parameters:
        - endpoint: The API endpoint to which the URLRequest is targeted.
        - method: The HTTP method (GET, POST, PUT, DELETE, etc.) for the URLRequest.
        - headers: The HTTP headers to be included in the URLRequest.
        - body: The data to be included in the HTTP body of the URLRequest.
        - queryParams: Additional query parameters to be appended to the URL.

     - Returns: A URLRequest configured with the provided parameters.

     - Throws: An error of type `Error` if there is an issue creating the URLRequest.

     - Note: This function is designed to handle common use cases when working with network requests. It allows the construction of a URLRequest with a specified endpoint, HTTP method, headers, request body, and query parameters. The function throws an error if there are any issues during the creation of the URLRequest.
     */
    func urlRequest(
        endpoint: String,
        method: HTTPMethod,
        headers: HTTPHeaders,
        body: Data?,
        queryParams: [String: Any]?
    ) throws -> URLRequest
}
