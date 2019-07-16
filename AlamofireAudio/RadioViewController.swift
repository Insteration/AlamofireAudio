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

    override func viewDidLoad() {
        super.viewDidLoad()
        createRadio()
    }
    

    func createRadio() {
        var player = AVAudioPlayer()
        request(URL(string: "http://main.inf.fm:9103")!)
            .stream { (data) in
                do {
                    player = try AVAudioPlayer(data: data, fileTypeHint: AVFileType.mp3.rawValue)
                    player.prepareToPlay()
                    player.play()
                } catch {
                    print(error.localizedDescription)
                }
        }
    }
}
