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
    
    
    func toggleDone() {
        
        self.isDone = !isDone
    
    }
    

}
