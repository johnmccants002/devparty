//
//  ViewController.swift
//  DevParty
//
//  Created by John McCants on 11/18/21.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false
    
    
    override func viewDidLoad() {

        guard let theURL = Bundle.main.url(forResource:"dev", withExtension: "mov") else { return }

        
        avPlayer = AVPlayer(url: theURL)
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        avPlayerLayer.videoGravity = .resizeAspectFill
        avPlayer.volume = 0
        avPlayer.actionAtItemEnd = .none

        avPlayerLayer.frame = view.layer.bounds
        view.backgroundColor = .clear
        view.layer.insertSublayer(avPlayerLayer, at: 0)

        NotificationCenter.default.addObserver(self,
                                           selector: #selector(playerItemDidReachEnd(notification:)),
                                           name: .AVPlayerItemDidPlayToEndTime,
                                           object: avPlayer.currentItem)
    }

    @objc func playerItemDidReachEnd(notification: Notification) {
        let p: AVPlayerItem = notification.object as! AVPlayerItem
        p.seek(to: .zero)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        avPlayer.play()
        paused = false
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        avPlayer.pause()
        paused = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateViews()
    }
    
    // MARK: - Helper Functions
    
    func updateViews() {
        
        // Create Account Button
        createAccountButton.backgroundColor = .twitterBlue
        createAccountButton.layer.cornerRadius = createAccountButton.bounds.height / 2
        createAccountButton.setTitleColor(UIColor.white, for: .normal)
//
//
//        // Sign In Button
//        signInButton.setTitleColor(UIColor.white, for: .normal)
        
    
      
    }
    
}

