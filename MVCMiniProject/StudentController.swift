//
//  StudentController.swift
//  MVCMiniProject
//
//  Created by Jake Herrmann on 10/22/15.
//  Copyright © 2015 Jake Herrmann. All rights reserved.
//

import Foundation

class StudentController {
    
    static let sharedInstance = StudentController()
    var studentArray : [Student]
    
    //initalize the array empty
    init(){
        self.studentArray = []
        
    }
    
    //method takes in a student and adds it to an array
    func addStudent(student : Student){
                
        studentArray.append(student)
        
        
    }
    
    //removes the student from the array 
    func removeStudent(indexPath : NSIndexPath){
        
        studentArray.removeAtIndex(indexPath.row)
        
        
    }
    
    
}
