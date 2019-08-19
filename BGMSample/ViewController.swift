//
//  ViewController.swift
//  BGMSample
//
//  Created by yonekan on 2019/08/19.
//  Copyright © 2019 yonekan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    // カセットデッキ的なやつ
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 再生する音楽ファイルのパス作成
        // forResource: ファイルの名前
        // ofType: ファイルの形式
        let audioPath = Bundle.main.path(forResource: "bgm2", ofType: "mp3")!
        
        let audioUrl = URL(fileURLWithPath: audioPath)
        
        // 音楽ファイルを元に、プレイヤー作成
        do {
            player = try AVAudioPlayer(contentsOf: audioUrl)
            
            // 無限ループ
            player.numberOfLoops = -1
        } catch let error {
            print(error.localizedDescription)
        }
        
        // 再生
        player.delegate = self  // おまじない
        player.prepareToPlay()  // 再生の準備
        player.play()   // 再生
        
    }
    
    @IBAction func didClickButton(_ sender: UIButton) {
        
        if player.isPlaying {
            player.pause()
        } else {
            player.play()
        }
        
    }
    
}

