//
//  Model+Extension.swift
//  TEDxConnect
//
//  Created by Farshid on 11/22/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation


extension Event {
    var liveUrl : String {
        return self.links?.first { $0.role.uppercased() == "LIVE" }?.url ?? ""
    }
    
    var ticketUrl : String {
        return self.links?.first { $0.role.uppercased() == "TICKET" }?.url ?? ""
    }
    
    var registerationUrl : String {
        return self.links?.first { $0.role.uppercased() == "REGISTRATION" }?.url ?? ""
    }
}
