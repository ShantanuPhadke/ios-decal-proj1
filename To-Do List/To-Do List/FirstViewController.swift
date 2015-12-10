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
    var globalCount = 0;
    //var imp_string: String = "";
    var imp_num = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var completion_reset_timer = NSTimer.scheduledTimerWithTimeInterval(86400, target: self, selector: Selector("resetCompletions"), userInfo: nil, repeats: true)
    }
    
    
    func resetCompletions(){
        tasksCompleted.text = 0.stringValue;
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
        var count = 0
        for task in taskMGr.tasks{
            if(task.name == completeTxt.text){
                //imp_string = task.name
                //print(imp_string)
                taskMGr.completedTasks.append(task);
                //globalCount = count
                //taskMGr.tasks.removeAtIndex(count);
                
                
                let count2 = taskMGr.completedTasks.count as NSNumber;
                tasksCompleted.text = count2.stringValue;
                completeTxt.text = "";
                tblTasks.reloadData();
            }
        };count++;
        var timer = NSTimer.scheduledTimerWithTimeInterval(86400, target: self, selector: Selector("removeTask"), userInfo: nil, repeats: false)
        
    }
    
    func removeTask(){
        taskMGr.tasks.removeAtIndex(imp_num)
        viewWillAppear(true)
        
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
        
        if find(taskMGr.tasks[indexPath.row], complete: taskMGr.completedTasks){
            imp_num = indexPath.row
            cell.detailTextLabel!.text = "Completed!"
        }else{
            cell.detailTextLabel!.text = taskMGr.tasks[indexPath.row].desc
        }
        
        
        
        return cell
    }
    
    func find(mytask: task, complete: [task]) -> Bool{
        for currtask in complete{
            if (currtask.name == mytask.name && currtask.desc == mytask.desc){
                return true
            }
        }
        return false
    }
    
    

}

