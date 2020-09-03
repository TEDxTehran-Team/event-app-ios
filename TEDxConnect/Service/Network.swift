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
    //    let token = "ed021b80f7890b8ad017e896617703caae3a3458"
    let url = URL(string: "https://tedxtehran.idearun.co/graphql/")!
    
    let configuration = URLSessionConfiguration.default
    
    //    configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(token)"]
    
    return ApolloClient(
      networkTransport: HTTPNetworkTransport(url: url, client: URLSessionClient(sessionConfiguration: configuration, callbackQueue: nil))
    )
  }()
}
