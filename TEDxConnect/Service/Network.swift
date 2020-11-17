//
//  Network.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/8/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    
    private(set) lazy var apollo: ApolloClient = {
        
        let url = URL(string: Constants.baseUrl)!
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask,
            true).first!
        let documentsURL = URL(fileURLWithPath: documentsPath)
        let sqliteFileURL = documentsURL.appendingPathComponent("tedx_apollo_db.sqlite")
        
        let sqliteCache = try! SQLiteNormalizedCache(fileURL: sqliteFileURL)
        
        let store = ApolloStore(cache: sqliteCache)
        
        let configuration = URLSessionConfiguration.default
       
        configuration.httpAdditionalHeaders = ["Application-Token": TimeZone.current.token]
        
        return ApolloClient(
            networkTransport: HTTPNetworkTransport(url: url, client: URLSessionClient(sessionConfiguration: configuration, callbackQueue: nil)),
            store: store
        )
    }()
    
    
}

extension TimeZone {
    var token : String {
        if self.identifier.lowercased() == "asia/tehran" {
            return "7b9c5f16-0882-4334-a828-e67ce8ccf201"
        }
        return "6f279260-680d-40bd-af33-da3084b43af0"
    }
}


