//
//  String+Extension.swift
//  TEDxConnect
//
//  Created by Farshid on 11/22/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import UIKit

extension String {
    func localized(bundle:Bundle = .main, tableName:String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "\(self)", comment: "")
    }
    
    func localize(with arguments: CVarArg...) -> String {
        let args = arguments.map {
            if let arg = $0 as? Int { return String(arg) }
            if let arg = $0 as? Float { return String(arg) }
            if let arg = $0 as? Double { return String(arg) }
            if let arg = $0 as? Int64 { return String(arg) }
            if let arg = $0 as? String { return String(arg) }
            return "(null)"
        } as [CVarArg]
        return String.init(format: self.localized(), arguments: args)
    }
}
