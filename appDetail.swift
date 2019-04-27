//
//  appDetail.swift
//  sqliteTest
//
//  Created by Haoran Liang on 4/26/19.
//  Copyright © 2019 Bohemian Rhapsody. All rights reserved.
//

import UIKit
import SQLite

class appDetail: UIViewController {

    @IBOutlet weak var appName: UILabel!
    // App category
    @IBOutlet weak var appCategory: UILabel!
    @IBOutlet weak var contentRating: UILabel!
    
    @IBOutlet weak var appRating: UILabel!
    @IBOutlet weak var numOfReview: UILabel!
    @IBOutlet weak var totalInstalls: UILabel!
    
    // App version
    @IBOutlet weak var currentVersion: UILabel!
    @IBOutlet weak var lastUpdate: UILabel!
    @IBOutlet weak var androidVersion: UILabel!
    
    
    var category = String()
    var name = String()
    
    
    let db = try! Connection("/Users/harlan/Desktop/533_project/appStore.db")

    override func viewDidLoad() {
        super.viewDidLoad()
        appCategory.text = category
        appName.text = name
        appScoreQuery()
        appVersionQuery()
    }
    
    
    
    @IBAction func detail2review(_ sender: UIButton) {
        performSegue(withIdentifier: "detail2review", sender: self)
    }
    
    func appScoreQuery() {
        let appName = Expression<String>("name")
        let appInstall = Expression<String>("installs")
        let appScore = Expression<String>("rating")
        let scoreAppName = Expression<String>("appName")
        //let appCate = Expression<String>("category")
        let appNumReviews = Expression<String>("numOfReviews")
        let appContentRating = Expression<String>("contentRating")
        

        // Define query table
        let appTable = Table("app")
        let scoreTable = Table("score")
        
        let scoreQuery = appTable.select(appTable[appName], scoreTable[appScore], scoreTable[appInstall], scoreTable[appNumReviews], scoreTable[appContentRating]).join(scoreTable, on: appTable[appName] == scoreTable[scoreAppName]).filter(appName == name)
        
        for app in try! db.prepare(scoreQuery){
            // Set up label value
            print(app[appScore])
            print(app[appInstall])
            print(app[appNumReviews])
            print(app[appContentRating])
            
            appRating.text = app[appScore]
            totalInstalls.text = app[appInstall]
            numOfReview.text = app[appNumReviews]
            contentRating.text = app[appContentRating]
        }
        
    }
    
    func appVersionQuery() {
        // Table information
        let versionTable = Table("version")
        
        // Attribute field
        let appName = Expression<String>("appName")
        let appLastUpdate = Expression<String>("lastUpdate")
        let appCurrentVersion = Expression<String>("currentVersion")
        let appAndroidVersion = Expression<String>("androidVersion")
        
        let versionQuery = versionTable.select(appLastUpdate, appCurrentVersion, appAndroidVersion).filter(appName == name)
        
        for app in try! db.prepare(versionQuery){
            print(appLastUpdate)
            print(appCurrentVersion)
            print(appAndroidVersion)
            
            lastUpdate.text = app[appLastUpdate]
            currentVersion.text = app[appCurrentVersion]
            androidVersion.text = app[appAndroidVersion]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Save GameRankPageViewController to segue
        let AppReview = segue.destination as! AppReview
        AppReview.appName = name
    }
    

}
