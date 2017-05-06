//
//  ViewController.swift
//  MessageApp
//
//  Created by Ayush Verma on 10/04/17.
//  Copyright © 2017 ayush. All rights reserved.
//

import UIKit
import FirebaseDatabase

class TableViewController: UITableViewController {
    
    var postData = [String]()
    
    var ref: FIRDatabaseReference?
    var databaseHandle: FIRDatabaseHandle?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // create a firebase refrence to retrieve the data
        ref = FIRDatabase.database().reference()
        
        // retrieve the post and listen for the changes
       databaseHandle = ref?.child("posts").observe(.childAdded, with: { (snapshot) in
            
            //code to execute when a child is added under "posts"
            // take the value from the snapshot and add it to the PostData Array
        
        // tries to convert the data of the post into a string
        let post = snapshot.value  as? String
        
        if let actualPost = post{
        
            // append the data to our postData Array
            self.postData.append(actualPost)
            
            //reload the tableView
            self.tableView.reloadData()
        }
            
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = postData[indexPath.row]
        return cell
    }


}

