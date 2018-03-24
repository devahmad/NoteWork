//
//  ViewController.swift
//  NoteWork
//
//  Created by DEVaHmad on 3/21/18.
//  Copyright © 2018 DEVaHmad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txTitle: UITextField!
    @IBOutlet weak var txDes: UITextView!
    var EditNote:NotesApp?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let note = EditNote {
            txTitle.text = note.title
            txDes.text = note.desc
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func butSave(_ sender: Any) {
        var newNote: NotesApp?
        if let notess = EditNote {
            newNote = notess
        }else {
            newNote = NotesApp(context: context)
        }
        newNote?.title = txTitle.text
        newNote?.desc  = txDes.text
        newNote?.date_save = NSDate() as Date
        do{
            add.saveContext()
            txTitle.text = ""
            txDes.text = ""
            print("add to database")
        } catch {
            print("can not save")
        }
    }
    @IBAction func buBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

