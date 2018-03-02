//
//  ViewController.swift
//  Lab_1_1
//
//  Created by Admin on 11.02.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import os.log

class FilmViewController: UIViewController {//,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    //MARK:Properties
    /*
    @IBOutlet weak var nameFilmLable: UILabel!
    @IBOutlet weak var ratingFilmLabel: UILabel!
    @IBOutlet weak var photoFilm: UIImageView!
    @IBOutlet weak var decriptionFilm: UITextView!
    //@IBOutlet weak var linkFilm: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var labelDecreption: UILabel!
    */
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    var film: Film?
    var poster: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let film = film {
            
            navigationItem.title = film.name
            titleLabel.text = film.name
            ratingLabel.text = String(film.rating)
            photo.image = poster
            directorLabel.text = film.director
            dateLabel.text = film.date
            descriptionText.text = film.description

        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         super.prepare(for: segue, sender: sender)
        switch (segue.identifier ?? "") {
        case "OpenLink":
            print("Open link")
            guard let webViewController = segue.destination as? webViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            webViewController.link = film?.link
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    
    }
}
