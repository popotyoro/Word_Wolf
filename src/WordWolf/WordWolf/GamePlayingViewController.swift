//
//  GamePlayingViewController.swift
//  WordWolf
//
//  Created by popota on 2016/03/09.
//  Copyright © 2016年 popota. All rights reserved.
//

import UIKit

class GamePlayingViewController: UIViewController {
    
    @IBOutlet weak var timer: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    var resultTime:Int = GameSettings.playingTime
    @IBOutlet weak var progress: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.timer.text = convertIntToTime(self.resultTime)
        
        _ = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("timerAction:"), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func timerAction(timer:NSTimer) {
        
        if self.resultTime > 0 {
            self.resultTime--
            self.timer.text = convertIntToTime(self.resultTime)
            self.progressView.progress = self.progressView.progress - (1.0 / Float(GameSettings.playingTime))
        } else {
            
        }
        
    }
    
    /**
     Int型で受け取った時間をString型で返す
     ex. 180 -> 03:00
     
     - parameter timer: 秒数
     
     - returns: タイマー形式 (mm:ss)
     */
    private func convertIntToTime(timer:Int) -> String {
        let mm:String = String(format: "%02d", (timer / 60))
        let ss:String = String(format: "%02d", (timer % 60))
        
        return "\(mm):\(ss)"
    }
    
    /**
     1分増やすボタンを押下した時のアクション
     
     - parameter sender: <#sender description#>
     */
    @IBAction func didPushIncreaseTime(sender: UIButton) {
        self.resultTime += 60
    }
    
    /**
     1分減らすボタンを押下した時のアクション
     
     - parameter sender: <#sender description#>
     */
    @IBAction func didPushDecreaseTime(sender: UIButton) {
        if (self.resultTime > 60){
            self.resultTime -= 60
        } else {
            // 残り時間が1分を切っている場合は強制的に1秒前とする
            self.resultTime = 1
        }
        
    }
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
