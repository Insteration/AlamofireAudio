//
//  RadioViewController.swift
//  AlamofireAudio
//
//  Created by Артём Кармазь on 7/16/19.
//  Copyright © 2019 Артём Кармазь. All rights reserved.
//

import UIKit
import Alamofire
import AVKit

class RadioViewController: UIViewController {
    
    let myButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .red
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        button.addTarget(self, action: #selector(createRadio), for: .touchUpInside)
        button.setTitle("Play", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myButton)
    }
    
    @objc func createRadio() {
        
        var player = AVAudioPlayer()
        
        request(URL(string: "http://main.inf.fm:9103")!).stream { (data) in
            do {
                player = try AVAudioPlayer(data: data, fileTypeHint: AVFileType.mp3.rawValue)
                sleep(3)
                player.prepareToPlay()
                player.play()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
