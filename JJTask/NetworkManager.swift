//
//  NetworkManager.swift
//  JJTask
//
//  Created by Yukui Ye on 2/8/17.
//  Copyright © 2017 J&J. All rights reserved.
//

import UIKit
import Alamofire

class NetworkManger: NSObject {
    public static  let sharedInstance = NetworkManger()
    
    func fetchDevices(completion:@escaping (_ deviceArray: [Device]) -> ()) {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            let url = "http://private-1cc0f-devicecheckout.apiary-mock.com/devices"
            Alamofire.request(url).responseJSON { response in
                if let result = response.result.value as? NSArray {
                    print(result)
                    
                    var devices = [Device]()
                    for dict in result {
                        devices.append(Device.init(dictionary: dict as! NSDictionary))
                    }
                    
                    DispatchQueue.main.async {
                        completion(devices)
                    }
                }
            }
        }
    }
}

