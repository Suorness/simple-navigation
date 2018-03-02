//
//  FilmTableViewController.swift
//  Lab_1_1
//
//  Created by Admin on 11.02.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import os.log
import Foundation

class FilmTableViewController: UITableViewController {

    //MARK: Properties
    
    var films = [Film]()
    var posters = [UIImage?]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleFilms()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "FilmTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FilmTableViewCell else {
            fatalError("The dequeued cell is not an instance of FilmTableViewCell")
        }

        let film = films[indexPath.row]
        
        cell.nameLabel.text = film.name
        cell.photoImageView.image = posters[indexPath.row]//film.phote
        cell.ratingLabel.text = String(film.rating)
        cell.descriptionTextL.text = film.description
        
        cell.descriptionTextL.lineBreakMode = .byTruncatingTail
        cell.descriptionTextL.numberOfLines = 4
        cell.descriptionTextL.sizeToFit()
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        super.prepare(for: segue, sender: sender)
        switch (segue.identifier ?? "") {
        case "ShowDetail":
            guard let filmDetailViewController = segue.destination as? FilmViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            guard let selectedFilmCell = sender as? FilmTableViewCell else {
                fatalError("Unexpected sender \(String(describing: sender))")
            }
            guard let indexPath = tableView.indexPath(for: selectedFilmCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedFilm = films[indexPath.row]
            filmDetailViewController.film = selectedFilm
            filmDetailViewController.poster = posters[indexPath.row]
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    

    private func loadSampleFilms(){
        /*
        let photo1 = UIImage(named: "film1")
        let photo2 = UIImage(named: "film2")
        
        guard let film_1  = Film(name: "film1",/* photo:photo1,*/ rating: 8, description: "With more than five million copies sold, Flowers for Algernon is the beloved, classic story of a mentally disabled man whose experimental quest for intelligence mirrors that of Algernon, an extraordinary lab mouse. In poignant diary entries, Charlie tells how a brain operation increases his IQ and changes his life. As the experimental procedure takes effect, Charlie's intelligence expands until it surpasses that of the doctors who engineered his metamorphosis. The experiment seems to be a scientific breakthrough of paramount importance--until Algernon begins his sudden, unexpected deterioration. Will the same happen to Charlie?",link: "https://www.kinopoisk.ru/film/mekhanik-2010-195615/") else{
            fatalError("Unable to instantiate film1")
            
        }
        
        guard let film_2  = Film(name: "film2", /*photo:photo2,*/ rating: 2, description: "With more than five million copies sold, Flowers for Algernon is the beloved, classic story of a mentally disabled man whose experimental quest for intelligence mirrors that of Algernon, an extraordinary lab mouse. In poignant diary entries, Charlie tells how a brain operation increases his IQ and changes his life. As the experimental procedure takes effect, Charlie's intelligence expands until it surpasses that of the doctors who engineered his metamorphosis. The experiment seems to be a scientific breakthrough of paramount importance--until Algernon begins his sudden, unexpected deterioration. Will the same happen to Charlie?", link: "https://www.kinopoisk.ru/film/nachalo-2010-447301/") else{
            fatalError("Unable to instantiate film2")
            
        }
        films += [film_1,film_2]
        //readData()
        */
        parseJSON(fileName: "data")
        //posters += [photo1,photo2]
        //print("test")
        //print((filmsData[0])!["name"] as? String ?? "test2")
        //print((filmsData[1])!["name"] as? String ?? "test2")
        
        filmsData.forEach{film in
            var filmTemp = Film()
            
            filmTemp.name = film!["name"] as? String ?? "def"
            filmTemp.description = film!["description"] as? String ?? "def"
            filmTemp.link = film!["link"] as? String ?? "def"
            filmTemp.photo = film!["photo"] as? String ?? "def"
            filmTemp.rating = Int(film!["rating"] as? String ?? "5")!
            filmTemp.date = film!["date"] as? String ?? "def"
            filmTemp.director = film!["director"] as? String ?? "def"
            //print(filmTemp.rating)
            films.append(filmTemp)
            posters.append(UIImage(named: filmTemp.photo))
        }
    }
    
    

    
    var filmsData: [AnyObject?] = []
    
    func parseJSON(fileName: String) {
        let file = Bundle.main.url(forResource: fileName, withExtension: "json")
        let allContactsData = try? Data(contentsOf: file!)
        let allContacts = try? JSONSerialization.jsonObject(with: allContactsData!, options: JSONSerialization.ReadingOptions.allowFragments) as AnyObject
        if let face = allContacts?["films"] as AnyObject?{
            for i in 0...face.count-1{
                let obj = face[i] as AnyObject?
                filmsData.append(obj)
            }
        }
    }
    

 
}
