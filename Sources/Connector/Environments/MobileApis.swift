//
//  File.swift
//  
//
//  Created by Renato Cardial on 08/03/21.
//

import PNetwork

class MobileApis: PEnvironment {
    
    var baseUrl: String
    var defaultHeaders: [String : String]
    
    init() {
        self.baseUrl = "http://127.0.0.1:8000"
        self.defaultHeaders = [
            "content-type": "application/json"
        ]
    }
    
}

extension PEnvironment {
    
    mutating func connect(credential: Credential) -> PEnvironment {
        defaultHeaders.updateValue(credential.secretKey, forKey: "secretKey")
        defaultHeaders.updateValue(credential.bundleId, forKey: "bundleId")
        return self
    }
}
