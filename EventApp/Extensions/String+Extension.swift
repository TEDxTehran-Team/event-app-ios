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

    var normalNumber: String {
        switch Configuration.appLanguage {
        case .fa, .faIR:
            return self.persianNumber
        case .en:
            return self.englishNumber
        }
    }
    
    private var persianNumber: String {
        var str = self
        let enNumber = ["0","1","2","3","4","5","6","7","8","9"]
        let faNumber = ["۰","۱","۲","۳","۴","۵","۶","۷","۸","۹"]
        let faNumber2 = ["٠","١","٢","٣","٤","٥","٦","٧","٨","٩"]
        for i in 0 ..< 10 {
            str = str.replace(enNumber[i], withString: faNumber[i])
        }
        for i in 0 ..< 10 {
            str = str.replace(faNumber2[i], withString: faNumber[i])
        }
        return str
    }
    
    var englishNumber: String {
        var str = self
        let enNumber = ["0","1","2","3","4","5","6","7","8","9"]
        let faNumber = ["۰","۱","۲","۳","۴","۵","۶","۷","۸","۹"]
        let faNumber2 = ["٠","١","٢","٣","٤","٥","٦","٧","٨","٩"]
        for i in 0 ..< 10 {
            str = str.replace(faNumber[i], withString: enNumber[i])
        }
        for i in 0 ..< 10 {
            str = str.replace(faNumber2[i], withString: enNumber[i])
        }
        return str.applyingTransform(StringTransform.toLatin, reverse: false) ?? self
    }
    
    func replace(_ target: String, withString: String)-> String {
        return self.replacingOccurrences(of: target, with: withString, options: String.CompareOptions.literal, range: nil)
    }
}
