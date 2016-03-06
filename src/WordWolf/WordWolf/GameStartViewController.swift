//
//  GameStartViewController.swift
//  WordWolf
//
//  Created by popota on 2016/03/06.
//  Copyright © 2016年 popota. All rights reserved.
//

import UIKit

class GameStartViewController: UIViewController {
    
    @IBOutlet weak var playerName: UILabel!

    @IBOutlet weak var thema: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func nextButtonPushed(sender: UIButton) {
    }
    

}
