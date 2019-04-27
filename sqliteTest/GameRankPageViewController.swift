//
//  GameRankPageViewController.swift
//  sqliteTest
//
//  Created by Haoran Liang on 4/23/19.
//  Copyright © 2019 Bohemian Rhapsody. All rights reserved.
//

import UIKit

class GameRankPageViewController: UIViewController {

    // Create a variable to get appType
    var appType = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(appType)
        test()
    }
    
    func test(){
        print("Load time")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
