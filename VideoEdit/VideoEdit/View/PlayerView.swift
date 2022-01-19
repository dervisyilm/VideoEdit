//
//  PlayerUIView.swift
//  VideoEdit
//
//  Created by Dervis YILMAZ on 16.01.2022.
//

import SwiftUI
import AVKit
import AVFoundation

/*
 
 PlayerView add player and play pause video and display video description
 */

struct PlayerView: View {
    
    // Selected video item
    var video: Video
    
    // player
    var player: AVPlayer
    
    // isLoop
    var isLoop: Bool = false
    
    // Play and Pause button
    @State var playerPaused = true
    
    // Seek Video
    @State var seekPos = 0.0
    
    init(video:Video){
        self.video = video
        player = AVPlayer(url: URL(string: video.sources[0])!)
        player.play()

//        player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.5, preferredTimescale: 600), queue: DispatchQueue.main) {
//            [weak self] time in
//
//            guard let item = player.currentItem else {
//              return
//            }
//
//            self.seekPos = time.seconds / item.duration.seconds
//
//        }
        
    }
    
    var body: some View {
        
        VStack{
            VideoPlayerView(player: self.player)
                .padding()
                
            Spacer()
            
            HStack{
                
                Button(action: {
                    self.playerPaused.toggle()
                    if self.playerPaused {
                      self.player.pause()
                    }
                    else {
                      self.player.play()
                    }
                    
                }){
                    HStack {
                        Image(systemName: playerPaused ? "play" : "pause")
                            .foregroundColor(Color.white)
                        Text(playerPaused ? "Play" : "Pause")
                    }
                    .padding()
                    .background(Color.gray)
                    .clipShape(Capsule())
                    .foregroundColor(Color.white)
                }
                
                
                Slider(value: $seekPos, onEditingChanged: { _ in
                  guard let item = self.player.currentItem else {
                    return
                  }
                  let targetTime = self.seekPos * item.duration.seconds
                  self.player.seek(to: CMTime(seconds: targetTime, preferredTimescale: 600))
                })
                
                
                Button(action: {}) {
                    HStack {
                        Image(systemName: "return")
                            .foregroundColor(Color.white)
                        Text("Loop")
                    }
                    .padding()
                    .background(Color.gray)
                    .clipShape(Capsule())
                    .foregroundColor(Color.white)
                }
            }
            
            Text(video.description)
                .padding()
            
        }
    
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        let video = Video(description: "testDescription", sources: [], subtitle: "testSubTitle", thumb: "testThumb", title: "testTitle")
        PlayerView(video: video)
    }
}

struct VideoPlayerView: UIViewRepresentable {
    let player: AVPlayer

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<VideoPlayerView>) {
    }

    func makeUIView(context: Context) -> UIView {
        return VideoPlayer(player: player)
    }

}

//func play() {
//    if player.timeControlStatus != AVPlayer.TimeControlStatus.playing {
//        player.play()
//    }
//}
//
//func pause() {
//    player.pause()
//}
//
//func stop() {
//    player.pause()
//    player.seek(to: CMTime.zero)
//}
//
//func reachTheEndOfTheVideo(_ notification: Notification) {
//    if isLoop {
//        self.player.pause()
//        self.player.seek(to: CMTime.zero)
//        self.player.play()
//    }
//}
