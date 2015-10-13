//
//  SecondViewController.swift
//  To-Do List
//
//  Created by Shantanu Phadke on 10/1/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var txtTask: UITextField!
    
    @IBOutlet var txtDesc: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Events
    @IBAction func btnAddTask_Click(sender: UIButton){
        taskMGr.addTask(txtTask.text!, desc: txtDesc.text!);
        print(taskMGr);
        self.view.endEditing(true);
        txtTask.text = "";
        txtDesc.text = "";
        self.tabBarController!.selectedIndex = 0;
        print("Clicked!");
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true);
    }

    //UITextField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder();
        return true
    }

}

