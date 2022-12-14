//
//  URLSessionHTTPClient.swift
//  Lifesum-Challenge
//
//  Created by Alizain on 19/11/2022.
//

import Foundation

public final class URLSessionHTTPClient: HTTPClient {
    private let session: URLSession

    public init(session: URLSession) {
        self.session = session
    }

    private struct UnexpectedValuesRepresentation: Error { }

    public func load(_ request: URLRequest, completion: @escaping (HTTPClient.Result) -> Void) -> HTTPClientTask {
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            completion(Result {
                if let error = error {
                    throw error
                } else if let data = data, let response = response as? HTTPURLResponse {
                    return (data, response)
                } else {
                    throw UnexpectedValuesRepresentation()
                }
            })
        })
        
        task.resume()
        return URLSessionTaskWrapper(wrapped: task)
    }
}

extension URLSessionHTTPClient {
    private struct URLSessionTaskWrapper: HTTPClientTask {
        let wrapped: URLSessionTask

        func cancel() {
            wrapped.cancel()
        }
    }
}
