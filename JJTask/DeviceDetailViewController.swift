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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.deviceInfo.text = "Device: iPhone 4\n\nOS: ios 8.3\n\nManufacturer: Apple\n\nLast Checked Out: Matt Smith on 3/26/2017 1:52 PM"
    }
    
    @IBAction func clickCheckinBtn(_ sender: UIButton) {
        
    }
}
