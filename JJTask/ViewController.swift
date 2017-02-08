//
//  ViewController.swift
//  JJTask
//
//  Created by Yukui Ye on 1/21/17.
//  Copyright © 2017 J&J. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var jj_devices = [Device]()
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManger.sharedInstance.fetchDevices { (deviceArray) in
            self.jj_devices = deviceArray
            print(self.jj_devices)
            
            self.tableView.reloadData()
        }
    }
    
    @IBAction func addDevice(_ sender: UIBarButtonItem) {
        let myStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addDeviceVC = myStoryboard.instantiateViewController(withIdentifier: "AddDeviceVC")
        
        self.present(addDeviceVC, animated: true, completion: nil)
    }

    //UITableView Delegate and DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.jj_devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "inforCell", for: indexPath)
        cell.textLabel?.text = "\(self.jj_devices[indexPath.row].device!)-\(self.jj_devices[indexPath.row].os!)"
    
        if self.jj_devices[indexPath.row].isCheckedOut == "\(true)" {
            cell.detailTextLabel?.text = "\(self.jj_devices[indexPath.row].lastCheckedOutBy!)"
        } else {
            cell.detailTextLabel?.text = "Available"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            self.jj_devices.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.right)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pushDetail" {
            let indexPath = self.tableView.indexPathForSelectedRow
            let destinationVC: DeviceDetailViewController = segue.destination as! DeviceDetailViewController
            destinationVC.device = self.jj_devices[(indexPath?.row)!]
        }
    }
}

