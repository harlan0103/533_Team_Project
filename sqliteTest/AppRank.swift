//
//  AppRank.swift
//  sqliteTest
//
//  Created by Haoran Liang on 4/24/19.
//  Copyright © 2019 Bohemian Rhapsody. All rights reserved.
//

import UIKit
import SQLite

class AppRank: UIViewController {

    // Add table view to the view controller
    @IBOutlet weak var tableView: UITableView!
    
    var appType = String()
    // This is the array for app object
    var apps: [App] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Load data from data array
        apps = createArray()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // This function retrieve top 10 rating app in the specified category
    func createArray() -> [App] {
        //print("function called")
        // Define database attributes
        let appName = Expression<String>("name")
        let appInstalls = Expression<String>("installs")
        let appScore = Expression<String>("rating")
        let scoreAppName = Expression<String>("appName")
        let appCate = Expression<String>("category")
        
        var tempApps: [App] = []
        
        // Connect to the database
        let db = try! Connection("/Users/harlan/Desktop/533_project/appStore.db")
        // Define query table
        let appTable = Table("app")
        let scoreTable = Table("score")
        
        let appQuery = appTable.select(appTable[appName], scoreTable[appInstalls], scoreTable[appScore]).join(scoreTable, on: appTable[appName] == scoreTable[scoreAppName]).filter(appCate == appType).limit(10).order(appInstalls.desc, appScore.desc)
        
        // Query a app name
        for app in try! db.prepare(appQuery){
            print("app_name: \(app[appName]), app_score: \(app[appScore]), app_Install: \(app[appInstalls])")
            
            // Create a new app object
            let newApp = App(appName: app[appName], installs: app[appInstalls], rating: app[appScore], appGenre: appType)
            
            tempApps.append(newApp)
        }
        
        
        return tempApps
    }
    
    // When a cell is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get the passing app name and category values
        var appName = String()
        var category = String()
        
        // After return, no row selected
        tableView.deselectRow(at: indexPath, animated: true)
        
        let name = apps[indexPath.row]
        appName = name.appName
        category = appType
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let appDetailVC = storyboard.instantiateViewController(withIdentifier: "appDetail") as! appDetail
        
        appDetailVC.name = appName
        appDetailVC.category = appType
        self.present(appDetailVC, animated:true, completion: nil)
        
    }

}


extension AppRank: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // The number of apps showed
        print(apps.count)
        return apps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Each of cells of everytime calls

        let app = apps[indexPath.row]
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "appCell") as! appCell
        
        // Set up cell itme
        cell.setApp(app: app)
        
        return cell
    }
}
