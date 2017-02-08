//
//  Device.swift
//  JJTask
//
//  Created by Yukui Ye on 2/8/17.
//  Copyright © 2017 J&J. All rights reserved.
//

import Foundation

struct Device {
    var id: String!
    var device: String!
    var os: String!
    var manufacturer: String!
    var lastCheckedOutDate: String!
    var lastCheckedOutBy: String!
    var isCheckedOut: String!
    
    init(dictionary: NSDictionary) {
        if let id_number = dictionary["id"] as? NSNumber {
            self.id = "\(id_number)"
        }
        self.device = dictionary["device"] as! String
        self.os = dictionary["os"] as! String
        self.manufacturer = dictionary["manufacturer"] as! String
        if let isCheckedOut_Bool = dictionary["isCheckedOut"] as? Bool {
            self.isCheckedOut = "\(isCheckedOut_Bool)"
        }
        
        
        //value might be nil
        if let valDate = dictionary["lastCheckedOutDate"] {
            self.lastCheckedOutDate = valDate as! String
        }
        if let valBy = dictionary["lastCheckedOutBy"] {
            self.lastCheckedOutBy = valBy as! String
        }
    }
}
