//
//  ViewController.swift
//  sqliteTest
//
//  Created by Haoran Liang on 4/23/19.
//  Copyright © 2019 Bohemian Rhapsody. All rights reserved.
//

import UIKit
import SQLite

class ViewController: UIViewController {
    
    // This typeOfApp string stores pressed button type
    var typeOfApp = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sqlTouch(_ sender: Any) {
        print("touched")
        // Ignore the error
        let db = try! Connection("/Users/harlan/Desktop/533_project/google_play_app.db")
        let table = Table("App_Info")
        let count = try! db.scalar(table.count)
        print(count)
        
        // Define app name
        let appname = Expression<String>("App")
        
        // Define a query
        let query = table.select(appname).limit(5).order(appname.asc)
        
        // Query a app name
        for app in try! db.prepare(query){
            print("app_name: \(app[appname])")
        }
        
    }
    
    // BUSINESS Button
    @IBAction func businessType(_ sender: Any) {
        typeOfApp = "BUSINESS"
        performSegue(withIdentifier: "BUSINESS", sender: self)
    }

    // EDUCATION Button
    @IBAction func eduType(_ sender: Any) {
        typeOfApp = "EDUCATION"
        performSegue(withIdentifier: "EDUCATION", sender: self)
    }
    
    // ENTETAINMENT Button
    @IBAction func entertainmentType(_ sender: Any) {
        typeOfApp = "ENTERTAINMENT"
        performSegue(withIdentifier: "ENTERTAINMENT", sender: self)
    }
    
    // FINANCE Button
    @IBAction func financType(_ sender: Any) {
        typeOfApp = "FINANCE"
        performSegue(withIdentifier: "FINANCE", sender: self)
    }
    
    // FOOD&DRINK Button
    @IBAction func foodType(_ sender: Any) {
        typeOfApp = "FOOD_AND_DRINK"
        performSegue(withIdentifier: "FOOD", sender: self)
    }
    
    // GAME Button
    @IBAction func gameType(_ sender: Any) {
        typeOfApp = "GAME"
        performSegue(withIdentifier: "GAME", sender: self)
    }
    
    
    @IBAction func bookType(_ sender: Any) {
        typeOfApp = "BOOKS_AND_REFERENCE"
        performSegue(withIdentifier: "BOOKS_AND_REFERENCE", sender: self)
    }
    
    @IBAction func artType(_ sender: Any) {
        typeOfApp = "ART_AND_DESIGN"
        performSegue(withIdentifier: "ART_AND_DESIGN", sender: self)
    }
    
    
    @IBAction func travelType(_ sender: Any) {
        typeOfApp = "TRAVEL_AND_LOCAL"
        performSegue(withIdentifier: "TRAVEL_AND_LOCAL", sender: self)
    }
    
    // Perform data trans
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Save GameRankPageViewController to segue
        let appRank = segue.destination as! AppRank
        appRank.appType = typeOfApp
    }
    

}

