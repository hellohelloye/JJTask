//
//  ViewController.swift
//  JJTask
//
//  Created by Yukui Ye on 1/21/17.
//  Copyright © 2017 J&J. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var numbers  = ["one", "two happy life always live love laugh", "three", "four", "five", "six"]
    var jj_devices = [Device]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManger.sharedInstance.fetchDevices { (deviceArray) in
            self.jj_devices = deviceArray
            print(self.jj_devices)
        }
    }
    
    @IBAction func addDevice(_ sender: UIBarButtonItem) {
        let myStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addDeviceVC = myStoryboard.instantiateViewController(withIdentifier: "AddDeviceVC")
        
        self.present(addDeviceVC, animated: true, completion: nil)
    }

    //UITableView Delegate and DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "inforCell", for: indexPath)
        cell.textLabel?.text = numbers[indexPath.row]
        cell.detailTextLabel?.text = "checked by David"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            numbers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.right)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "pushDetail" {
//            if let cell = sender as? inforCell {
//                let indexPath = self.iTableView.indexPath(for:  cell)
//                let destinationVC: iStockDetailViewController = segue.destination as! iStockDetailViewController
//                destinationVC.iStockSymbol = self.searchResults[(indexPath?.row)!].symbol!
//            }
//        }
    }
}

