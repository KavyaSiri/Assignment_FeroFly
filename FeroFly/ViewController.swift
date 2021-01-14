//
//  ViewController.swift
//  FeroFly
//
//  Created by Goutham Devaraju on 10/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    let array = [["title" : "Order ID" , "value" : "ORDERNUMBER123456789" ] ,
                 ["title" : "OrderDate" , "value" : "03March@019 09:09PM" ],
                 ["title" : "PaymentMode" , "value" : "PhonePay" ]]
    

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Register the table view cell class and its reuse id
                self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellReuseIdentifier")
        tableView.rowHeight = UITableView.automaticDimension

         tableView.estimatedRowHeight = 180
        tableView.reloadData()
        
        
    }
    


}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let data = tableView.dequeueReusableCell(withIdentifier: "TableViewCellID", for: indexPath) as! TableViewCell
            
            return data
        }
        else if indexPath.row == 1  || indexPath .row == 2 || indexPath.row == 3 {
            
            let order = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCellID", for: indexPath) as! OrderTableViewCell
            
            let datafromarray = array[indexPath.row - 1]
            let orderid = datafromarray["title"]
            let value = datafromarray["value"]
            order.labelOrder.text = orderid
            order.labelOrderNumber.text = value
            return order
            
        }
       
        else if indexPath.row == 4 {
            
            let address = tableView.dequeueReusableCell(withIdentifier: "AddressCellID", for: indexPath) as! AddressCell
            return address
        }
        
        else if indexPath.row == 5{
            
            let mapStatus = tableView.dequeueReusableCell(withIdentifier: "StatusCellID", for: indexPath) as! StatusCell
            
            return mapStatus
        }
        else {
            
           
            let cell:UITableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as UITableViewCell?)!
            
            // set the text from the data model
           
            
            return cell
            
            
            
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        }
        else if indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 {
            return 70
        }
        else if indexPath.row == 6 {
            return 100
        }
        else{
           
            return    self.tableView.estimatedRowHeight
            
        }
        
    }
    
    
}
