//
//  NotesViewController.swift
//  NoteTakingApp
//
//  Created by Fariha Binte Mahmud on 3/22/17.
//  Copyright © 2017 bcc. All rights reserved.
//

import UIKit

class NotesViewController: UITableViewController {

    var notesArray:[NoteModel] =  []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//      Creating datasource
        
        let note1 = NoteModel(title: "Structture", message: "Structtures are like classes in swift")
        
        let note2 = NoteModel(title: "Class", message: "One more type in swift where we can use object oriented principles")
        
        let note3 = NoteModel(title: "Protocol", message: "One more very important type in swift")
        
        
        notesArray.append(note1)
        notesArray.append(note2)
        notesArray.append(note3)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        //cell object created
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NoteTableViewCell

        
        //label object searched in view hierarchy
     //  let titleLabel = cell.viewWithTag(111) as! UILabel// here we are downcasting the UILAbel because view with tag gives us UIView, but we need the UILabel
        
      //  let messageLabel = cell.viewWithTag(222) as! UILabel
       
        
        //set the data for both labels
        //get the model object for this row
        
        let noteModel = notesArray[indexPath.row]
        
        cell.title.text = noteModel.title
        cell.messageCell.text = noteModel.message
        
        
        configureCheckmark(for: cell, withModel: noteModel)

        return cell
    }
 
    func configureCheckmark(for cell:UITableViewCell, withModel model:NoteModel) {
        
        if model.isDone {
            cell.accessoryType = .checkmark
        }
        else{
            cell.accessoryType = .none
        }
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            self.notesArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "gotoAdd" {
            // add something
        } else if segue.identifier == "gotoDetails" {
            //showing the details view
            
            //get the cell object first
            // sender is cell object in this case
            let cell = sender as! UITableViewCell
            
            //get the indexpath for the cell selected
            let indexPath = tableView.indexPath(for: cell)
            
            //get position for the row selected
            let rowSelected = indexPath?.row
            print("row selected --> ", rowSelected!)
            
            let rowModelSelected = self.notesArray[rowSelected!]
            
            let detailsController = segue.destination as! DetailsTableViewController
            
            
            detailsController.notePassing = rowModelSelected
            
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
