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
    
    @IBOutlet weak var throughView: UIView!
    
    private var userCount:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.playerName.text = "「プレイヤー" + (self.userCount).description + "」さん"
        
        self.thema.text = GameSettings.playersThema[self.userCount - 1]
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //    override func viewDidDisappear(animated: Bool) {
    //        self.userCount = 0
    //    }
    
    
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    
    /**
    <#Description#>
    
    - parameter sender: <#sender description#>
    */
    @IBAction func nextButtonPushed(sender: UIButton) {
        
        if !self.throughView.hidden {
            self.throughView.hidden = true
            return
        }
        
        
        if self.userCount != GameSettings.playerNumber {
            
            self.throughView.hidden = false
            self.userCount++
            // アラート表示、ラベルの張替えを行う
            playerName.text = "「プレイヤー" + (self.userCount).description + "」さん"
            self.thema.text = GameSettings.playersThema[self.userCount - 1]
            
        } else {
            self.userCount = 1
            let nextVc = self.storyboard?.instantiateViewControllerWithIdentifier("GamePlaying")
            nextVc!.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
            self.presentViewController(nextVc!, animated: true, completion: nil)
            
        }
        
        
    }
    
    
}
