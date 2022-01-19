//
//  VideoView.swift
//  VideoEdit
//
//  Created by Dervis YILMAZ on 16.01.2022.
//

import UIKit
import AVKit
import AVFoundation
import SwiftUI

/*
 
 VideoPlayer view add view AVPlayer
 
 */

class VideoPlayer: UIView {
    
    var playerLayer = AVPlayerLayer()
    var player = AVPlayer()
    var isLoop: Bool = false
    
    

    init(player: AVPlayer) {
        super.init(frame: .zero)
        playerLayer.player = player
        playerLayer.videoGravity = AVLayerVideoGravity.resize
        playerLayer.frame = bounds
        layer.addSublayer(playerLayer)
        player.play()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
  
}

