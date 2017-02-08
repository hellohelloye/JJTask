//
//  DeviceDetailViewController.swift
//  JJTask
//
//  Created by Yukui Ye on 1/21/17.
//  Copyright © 2017 J&J. All rights reserved.
//

import UIKit

class DeviceDetailViewController: UIViewController {
    @IBOutlet var deviceInfo: UILabel!
    var device: Device!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(device!)
        if self.device.isCheckedOut == "\(true)" {
            self.deviceInfo.text = "Device: \(device.device!)\n\nOS: \(device.os!)\n\nManufacturer: \(device.manufacturer!)\n\nLast Checked Out: \(device.lastCheckedOutBy!) on \(device.lastCheckedOutDate!)"
        } else {
            self.deviceInfo.text = "Device: \(device.device!)\n\nOS: \(device.os!)\n\nManufacturer: \(device.manufacturer!)\n\n Available"
        }
    }
    
    @IBAction func clickCheckinBtn(_ sender: UIButton) {
        //need requirements
    }
}
