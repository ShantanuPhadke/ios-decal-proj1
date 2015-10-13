//
//  FirstViewController.swift
//  To-Do List
//
//  Created by Shantanu Phadke on 10/1/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tblTasks: UITableView!;
    @IBOutlet var tasksDeleted: UILabel!;
    @IBOutlet var tasksCompleted: UILabel!;
    @IBOutlet var completeTxt: UITextField!;
    @IBOutlet var completeButton: UIButton!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Returning To View
    override func viewWillAppear(animated: Bool) {
        tblTasks.reloadData()
    }
    
    @IBAction func btn_Completed (sender: UIButton){
        var count = 0;
        for task in taskMGr.tasks{
            if(task.name == completeTxt.text){
                taskMGr.completedTasks.append(task);
                taskMGr.tasks.removeAtIndex(count);
                
                let count2 = taskMGr.completedTasks.count as NSNumber;
                tasksCompleted.text = count2.stringValue;
                completeTxt.text = "";
                tblTasks.reloadData();
            };count++;
        }
    }
    
    //UITableViewDelete
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            let Deltask = taskMGr.tasks[indexPath.row];
            taskMGr.tasks.removeAtIndex(indexPath.row)
            taskMGr.addDelTask(Deltask.name, desc: Deltask.desc)
            let count = (taskMGr.deletedTasks).count as NSNumber;
            tasksDeleted.text = count.stringValue;
            tblTasks.reloadData();
        }
        
    }
    
    //UITableViewDataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return taskMGr.tasks.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Default")
        
        cell.textLabel?.text = taskMGr.tasks[indexPath.row].name
        
        cell.detailTextLabel!.text = taskMGr.tasks[indexPath.row].desc
        
        return cell
    }
    
    

}

