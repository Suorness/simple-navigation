//
//  FilmTableViewCell.swift
//  Lab_1_1
//
//  Created by Admin on 11.02.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class FilmTableViewCell: UITableViewCell {
    
    //MARK:Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var descriptionTextL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
