//
//  RepositoryRepository.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/10/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation
import Apollo

class RepositoryRepository {
  
  func get(count: Int, completion: @escaping ([Edge]?) -> ()) {
    
    let queryString = "GraphQL"
    
    Network.shared.apollo.fetch(query: SearchRepositoriesQuery(query: queryString, count: count)) { result in
      guard let data = try? result.get().data else { return }
      
      let json = data.search.edges?.first
      let serialized = try! JSONSerialization.data(withJSONObject: json, options: [])
            
      let deserialized = try! JSONSerialization.jsonObject(with: serialized, options: []) as! JSONObject
      let repositories = try! SearchRepositoriesQuery.Data(jsonObject: deserialized)
      
      let encoder = try? JSONEncoder().encode(json.description)
      
      let myJson = String(data: encoder!, encoding: .utf8)
      
      print(json)
      
      repositories.resultMap.first?.value
      
      do {
        let response = try JSONDecoder().decode(Edge.self, from: encoder!)
        if let response = response as Edge? {
          DispatchQueue.main.async {
            print(response)
//            completion(response)
          }
        }
      } catch {
        print(error)
      }
      
    }
  }
  
}
