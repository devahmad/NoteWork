//
//  VcListNote.swift
//  NoteWork
//
//  Created by DEVaHmad on 3/24/18.
//  Copyright © 2018 DEVaHmad. All rights reserved.
//

import UIKit
import CoreData

class VcListNote: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var ListNoteData = [NotesApp]()
    private let idfier = "CellNotes"
    @IBOutlet weak var tbNotesList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNotes()
        tbNotesList.delegate   = self
        tbNotesList.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListNoteData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TVCNotes = tableView.dequeueReusableCell(withIdentifier: idfier, for:indexPath) as! TVCNotes
        cell.SetNotes(note: ListNoteData[indexPath.row])
        cell.buDelete.tag = indexPath.row
        cell.buDelete.addTarget(self, action: #selector(buDeletePress(_:)) , for: .touchUpInside)
        cell.buEdit.tag = indexPath.row
        cell.buEdit.addTarget(self, action: #selector(buEditPress(_:)) , for: .touchUpInside)
        return cell
    }
    
    @objc func buDeletePress (_ sender:UIButton) {
        print("index \(sender.tag)")
        context.delete(ListNoteData[sender.tag])
        loadNotes()
    }
    
    @objc func buEditPress (_ sender:UIButton) {
        performSegue(withIdentifier: "EditorAddSegway", sender: ListNoteData[sender.tag])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditorAddSegway" {
            if let AddOREdit = segue.destination as? ViewController {
                if let mynote = sender as? NotesApp {
                    AddOREdit.EditNote = mynote
                }
            }
        }
        dismiss(animated: true, completion: nil)
    }
 
    @IBAction func buAdd(_ sender: Any) {
        performSegue(withIdentifier: "EditorAddSegway", sender: nil)
    }
    
    func loadNotes() {
        let fetchRequset = NSFetchRequest<NSFetchRequestResult>(entityName: "NotesApp")
        do{
            ListNoteData = try context.fetch(fetchRequset) as! [NotesApp]
            tbNotesList.reloadData()
        } catch {
            print("cannot read database")
        }
        
    }
    
    
}
