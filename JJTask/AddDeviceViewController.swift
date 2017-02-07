//
//  AddDeviceViewController.swift
//  JJTask
//
//  Created by Yukui Ye on 1/21/17.
//  Copyright © 2017 J&J. All rights reserved.
//

import UIKit

class AddDeviceViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var deviceTF: UITextField!
    @IBOutlet var osTF: UITextField!
    @IBOutlet var manufacturerTF: UITextField!
    
    var newDeviceInfo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func clickSaveBtn(_ sender: UIButton) {
        //save data for POST mothd
        guard let device = deviceTF.text else {
            print("device input nil")
            return
        }
        guard let os = osTF.text  else {
            print("os input nil")
            return
        }
        guard let manufacturer = manufacturerTF.text else {
            print("mamufacturer input nil")
            return
        }
        
        self.newDeviceInfo = "device:\(device), os:\(os), manufacturer: \(manufacturer)."
        print("\(newDeviceInfo)")
        
        self.dismiss(animated: true, completion: nil)
    }


    @IBAction func clickCancelBtn(_ sender: UIButton) {
        print("Cancel button clicked")
    }
}

