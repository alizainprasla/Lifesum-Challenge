//
//  HTTPClient.swift
//  Lifesum-Challenge
//
//  Created by Alizain on 19/11/2022.
//

import Foundation

public protocol HTTPClientTask {
    func cancel()
}

public protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>

    @discardableResult
    func load(_ request: URLRequest, completion: @escaping (Result) -> Void) -> HTTPClientTask
}
