//
//  Json+Extension.swift
//  TEDxConnect
//
//  Created by Farshid on 9/2/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation
import Apollo

extension JSONDecoder {
    func decodeModel<T : Decodable>(type:T.Type,str:String?) -> T? {
        
        if str == nil {
            return nil
        }
        
        do {
            return try JSONDecoder().decode(type, from: str!.data(using: .utf8)!)
        }catch {
            print("decode json catch : \(error)")
        }
        return nil
    }
}

extension GraphQLSelectionSet {
    func decodeModel<T : Decodable>(type:T.Type) -> T?{
        let json = self.jsonObject
        let serialized = try! JSONSerialization.data(withJSONObject: json, options: [])
        
        let jsonStr =  String(data: serialized, encoding: .utf8)
        return JSONDecoder().decodeModel(type: type, str: jsonStr)
    }
}
