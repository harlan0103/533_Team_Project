//
//  App.swift
//  sqliteTest
//
//  Created by Haoran Liang on 4/26/19.
//  Copyright © 2019 Bohemian Rhapsody. All rights reserved.
//

import Foundation

class App {
    // Information
    var appName: String
    
    var appGenre: String
    //var type: Bool
    //var price: String
    
    // Review
    
    // Score
    //var numOfReview: Int
    var installs: String
    var rating: String
    //var contentRating: String
    
    // Version
    //var lastUpdate: String
    //var currentVersion: String
    
    init(appName: String, installs: String, rating: String, appGenre: String){
        self.appName = appName
        self.installs = installs
        self.rating = rating
        self.appGenre = appGenre
    }
    
}
