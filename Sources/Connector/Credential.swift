//
//  File.swift
//  
//
//  Created by Renato Cardial on 08/03/21.
//

import PNetwork

public struct Credential {
    let secretKey: String
    let bundleId: String
    
    public init(secretKey: String, bundleId: String) {
        self.secretKey = secretKey
        self.bundleId = bundleId
    }
    
}
