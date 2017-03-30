//
//  DelegateProtocolTabItem.swift
//  NoteTakingApp
//
//  Created by Sayem on 3/28/17.
//  Copyright © 2017 bcc. All rights reserved.
//

import Foundation

protocol AddNoteDelgate1 {
    func CancelTapped (_ controller: AddNoteTableViewController)
    func DoneTapped (_ controller: AddNoteTableViewController, newNote:NoteModel)
}
