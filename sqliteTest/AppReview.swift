//
//  AppReview.swift
//  sqliteTest
//
//  Created by Haoran Liang on 4/27/19.
//  Copyright © 2019 Bohemian Rhapsody. All rights reserved.
//

import UIKit
import SQLite

class AppReview: UIViewController {

    var appName = String()
    
    @IBOutlet weak var nameOfApp: UILabel!
    @IBOutlet weak var review1: UILabel!
    @IBOutlet weak var review2: UILabel!
    @IBOutlet weak var review3: UILabel!
    @IBOutlet weak var review4: UILabel!
    @IBOutlet weak var review5: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(appName)
        nameOfApp.text = appName
        reviewQuery()
        // Do any additional setup after loading the view.
    }
    
    func reviewQuery() {
        let content = Expression<String>("content")
        let sentiment = Expression<String>("sentiment")
        let name = Expression<String>("appName")
        
        let db = try! Connection("/Users/harlan/Desktop/533_project/appStore.db")
        
        let reviewTable = Table("review")
        
        let reviewQuery = reviewTable.select(content).filter(name == appName && sentiment == "Positive").limit(5)
        
        var reviewList = [String]()
        
        for app in try! db.prepare(reviewQuery){
            reviewList.append(app[content])
        }
        print(reviewList.count)
        if reviewList.count == 5 {
            review1.text = reviewList[0]
            review2.text = reviewList[1]
            review3.text = reviewList[2]
            review4.text = reviewList[3]
            review5.text = reviewList[4]
        }
    }
    

}
