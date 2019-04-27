//
//  appCell.swift
//  sqliteTest
//
//  Created by Haoran Liang on 4/26/19.
//  Copyright © 2019 Bohemian Rhapsody. All rights reserved.
//

import UIKit

class appCell: UITableViewCell {

    @IBOutlet weak var appName: UILabel!
    
    @IBOutlet weak var appScore: UILabel!
    
    @IBOutlet weak var appDetail: UILabel!
    
    func setApp(app: App) {
        
        // Set cell item properties
        appName.text = app.appName
        appScore.text = app.rating
        appDetail.text = app.installs
    }
}
