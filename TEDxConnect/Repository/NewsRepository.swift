//
//  NewsRepository.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation
import Apollo

class NewsRepository {
    
    func get(completion: @escaping ([News]?) -> ()) {
        
        Network.shared.apollo.fetch(query: GetAllNewsQuery()) { result in
            guard let response = try? result.get().data else { return }
            
            let model = response.decodeModel(type: NewsResponse.self)
            completion(model?.allNews ?? [])
            
        }
        
    }
    
}

