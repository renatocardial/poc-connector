//
//  File.swift
//  
//
//  Created by Renato Cardial on 08/03/21.
//

import PNetwork

public protocol EndpointPath: RawRepresentable {
    func value(method: HTTPMethod, params: [String: String], headers: [String: String], postType: PostType) -> PEndpoint
}

public extension EndpointPath {
    func value(method: HTTPMethod, params: [String: String] = [:], headers: [String: String] = [:], postType: PostType = .json) -> PEndpoint {
        
        return PEndpoint(
            path: rawValue as? String ?? "",
            method: method,
            headers: headers,
            params: params,
            postType: postType
        )
    }
}
