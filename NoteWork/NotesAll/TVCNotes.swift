//
//  TVCNotes.swift
//  NoteWork
//
//  Created by DEVaHmad on 3/24/18.
//  Copyright © 2018 DEVaHmad. All rights reserved.
//

import UIKit

class TVCNotes: UITableViewCell {

    @IBOutlet weak var buDelete: UIButton!
    @IBOutlet weak var buEdit: UIButton!
    @IBOutlet weak var LiTitle: UILabel!
    @IBOutlet weak var LiDesc: UITextView!
    @IBOutlet weak var LiDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func SetNotes(note:NotesApp) {
        LiTitle.text = note.title
        LiDesc.text  = note.desc
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "تاریخ: MM/dd/yyyy h:mm a"
        let nowDate = dateFormat.string(from: note.date_save as! Date)
        LiDate.text = nowDate
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
