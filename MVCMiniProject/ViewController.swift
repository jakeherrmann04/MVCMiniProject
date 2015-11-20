//
//  ViewController.swift
//  MVCMiniProject
//
//  Created by Jake Herrmann on 10/22/15.
//  Copyright © 2015 Jake Herrmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var deleteStudentIndexPath : NSIndexPath? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    //Called when the press button is clicked. 
    //Alerts pop up when pressed
    @IBAction func addButtonPressed(sender: AnyObject) {
        
        let addNameAlert = UIAlertController(title: "Enter Name", message: "Please enter name below", preferredStyle: UIAlertControllerStyle.Alert)
       
        addNameAlert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
       
        addNameAlert.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            textField.placeholder = "Name"
            
        })
        addNameAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (alertAction : UIAlertAction) -> Void in
            let textField = addNameAlert.textFields?.first
            
            if let text = textField?.text {
                let student = Student(name: text)
                StudentController.sharedInstance.addStudent(student)
                self.tableView.reloadData()

            }
        }))
        
        presentViewController(addNameAlert, animated: true, completion: nil)
        
        }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            
            //beign listen to changes in tableView data
            tableView.beginUpdates()
            
            //call remove method in studentController
            StudentController.sharedInstance.removeStudent(indexPath)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
            tableView.endUpdates()
            
        }

    }
    
    //use studentarray to populate the tableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentController.sharedInstance.studentArray.count
        
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cellID", forIndexPath: indexPath)
        
        let student = StudentController.sharedInstance.studentArray[indexPath.row]
        
        cell.textLabel?.text = student.name
        
        return cell
    }




}