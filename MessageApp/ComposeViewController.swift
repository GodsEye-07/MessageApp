//
//  ComposeViewController.swift
//  MessageApp
//
//  Created by Ayush Verma on 10/04/17.
//  Copyright © 2017 ayush. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ComposeViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    
    var ref: FIRDatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ref = FIRDatabase.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addPost(_ sender: Any) {
     
        //dismisses the popover after done
     presentingViewController?.dismiss(animated: true, completion: nil)
        
        ref?.child("posts").childByAutoId().setValue(textView.text)
        
        
    }
    
    
    @IBAction func cancelPost(_ sender: Any) {
        
        // dismisses the popover after done
        presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
