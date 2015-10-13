
import UIKit

var taskMGr: TaskManager = TaskManager()

struct task{
    var name = "Un-Named"
    var desc = "Un-Described"
}

class TaskManager: NSObject {
    
    var tasks = [task]()
    
    var deletedTasks = [task]()
    
    var completedTasks = [task]()
    
    func addTask(name: String, desc: String){
        tasks.append(task(name: name, desc: desc))
        
    }
    
    func addDelTask(name: String, desc: String){
        deletedTasks.append(task(name: name, desc: desc))
    }
    
    func addCompTask(name: String, desc: String){
        completedTasks.append(task(name:name, desc: desc))
    }
}
