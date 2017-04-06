//
//  NoteModel.swift
//  NoteTakingApp
//
//  Created by Fariha Binte Mahmud on 3/22/17.
//  Copyright © 2017 bcc. All rights reserved.
//

import UIKit

class NoteModel {

    var title:String
    var message:String
    var isDone:Bool = false
    
    init(title:String,message:String) {
        self.title = title
        self.message = message
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.title = aDecoder.decodeObject(forKey: "Title") as! String
        self.message = aDecoder.decodeObject(forKey: "Message") as! String
        self.isDone = aDecoder.decodeBool(forKey: "Done")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "Title")
        aCoder.encode(message, forKey: "Message")
        aCoder.encode(isDone, forKey: "Done")
    }
    
    
    func toggleDone() {
        
        self.isDone = !isDone
    
    }
    

}
