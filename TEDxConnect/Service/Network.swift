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
