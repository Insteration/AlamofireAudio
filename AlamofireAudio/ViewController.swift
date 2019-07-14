//
//  ViewController.swift
//  AlamofireAudio
//
//  Created by Артём Кармазь on 7/14/19.
//  Copyright © 2019 Артём Кармазь. All rights reserved.
//

import UIKit
import AVKit
import Alamofire

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    let informator = "http://main.inf.fm:9103"
    
    let myButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 30, y: 30, width: 40, height: 40)
        button.setTitle("Play", for: .normal)
        button.titleLabel?.textColor = .red
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(playRadio), for: .touchDown)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myButton)
    }
    
    @objc func playRadio() {
        request(informator).stream { (data) in
            do {
                sleep(3)
                self.player = try AVAudioPlayer(data: data, fileTypeHint: AVFileType.mp3.rawValue)
                self.player.prepareToPlay()
                self.player.play()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
