//
//  GameSettings.swift
//  WordWolf
//
//  Created by popota on 2016/03/06.
//  Copyright © 2016年 popota. All rights reserved.
//

import UIKit

class GameSettings: NSObject {
    
    // プレイヤー人数の初期値
    static let defaultPlayerNumber:Int = 3
    // ウルフ数の初期値
    static let defaultWolfNumber:Int = 1
    
    // プレイヤー人数
    static var playerNumber:Int = defaultPlayerNumber
    
    // ウルフ人数
    static var wolfNumber:Int = defaultWolfNumber
    
    // ウルフindex
    static var wolfPlayer:[Int] = []
    
    // テーマ
    static var playersThema:[String] = []
    
    
    /**
     ゲーム設定の初期化を行う
     
     - returns: <#return value description#>
     */
    static func initGameSettings() {
        playerNumber = defaultPlayerNumber
        wolfNumber = defaultWolfNumber
        wolfPlayer.removeAll()
        playersThema.removeAll()
    }
    
}
