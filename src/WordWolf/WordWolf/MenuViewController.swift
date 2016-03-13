//
//  MenuViewController.swift
//  WordWolf
//
//  Created by popota on 2016/03/06.
//  Copyright © 2016年 popota. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    
    @IBOutlet weak var playerNumber: UILabel!
    
    @IBOutlet weak var wolfNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ゲーム設定の初期化を行う
        GameSettings.initGameSettings()
        
        initLabelData()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playerNumStepper(sender: UIStepper) {
        let num = Int(sender.value)
        playerNumber.text = num.description
    }
    
    @IBAction func wolfNumStepper(sender: UIStepper) {
        let num = Int(sender.value)
        wolfNumber.text = num.description
    }
    
    /**
     プレイヤー・ウルフのラベル初期設定を行う
     
     - returns: <#return value description#>
     */
    private func initLabelData() {
        
        // プレイヤー数を初期化
        playerNumber.text = GameSettings.playerNumber.description
        
        // ウルフ数を初期化
        wolfNumber.text = GameSettings.wolfNumber.description
        
    }
    
    
    /**
     ウルフを設定します
     */
    private func setWolf() {
        
        while(GameSettings.wolfPlayer.count < GameSettings.wolfNumber) {
            let wolf:Int = Int(arc4random_uniform(UInt32(GameSettings.playerNumber)))
            if (GameSettings.wolfPlayer.contains(wolf)) {
                continue
            }
            GameSettings.wolfPlayer.append(wolf)
        }
    }
    
    /**
     テーマの設定を行います
     設定したプレイヤー人数分テーマを割り振ります
     
     */
    private func setThema() {
        // テーマの大枠の決定
        let thema:[String] = ["てーま１","てーま２"]
        
        // 人間側のテーマの決定
        let humanThema:String = thema[0]
        
        // ウルフ側のテーマの決定
        let wolfThema:String = thema[1]
        
        // テーマの割り振り
        for var index = 0; index < GameSettings.playerNumber; index++ {
            
            if GameSettings.wolfPlayer.contains(index) {
                GameSettings.playersThema.append(wolfThema)
            } else {
                GameSettings.playersThema.append(humanThema)
            }
        }
        
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        GameSettings.playerNumber = Int(playerNumber.text!)!
        GameSettings.wolfNumber = Int(wolfNumber.text!)!
        
        // ウルフの決定
        setWolf()
        
        // テーマの設定
        setThema()
    }
    
    
}
