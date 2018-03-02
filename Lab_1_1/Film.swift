//
//  Film.swift
//  Lab_1_1
//
//  Created by Admin on 11.02.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

struct Film: Codable {
    //MARK: Properties
    
    var name: String
    //var phote: UIImage?
    var photo: String
    var rating: Int
    var description:String
    var link:String
    var date:String
    var director: String
    //Mark: Initialization
    
    init? (name:String, /*photo:UIImage?,*/ rating:Int, description:String, link:String){
        
        if name.isEmpty || rating < 0 || description.isEmpty || link.isEmpty {
            return nil
        }
        self.photo = "test"
        self.name = name
        //self.phote  = photo
        self.rating = rating
        self.description = description
        self.link = link
        self.date = "def"
        self.director = "def"
        
    }
    init() {
        self.name = "def"
        self.rating = 5
        self.photo = "def"
        self.description = "def"
        self.link = "def"
        self.date = "def"
        self.director = "def"
    }
        
    
}
