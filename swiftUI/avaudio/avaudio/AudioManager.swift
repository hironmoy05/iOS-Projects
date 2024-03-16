//
//  AudioManager.swift
//  avaudio
//
//  Created by Gaurav Sara on 10/03/24.
//

import AVFoundation
import Combine

final class AudioManager {
    static let shared = AudioManager()
    
    private var player: AVPlayer?
    private var session = AVAudioSession.sharedInstance()
    private var cancellable: AnyCancellable?
    
    private init() {}
    
    deinit {
        cancellable?.cancel()
    }
    
    private func activateSession() {
        do {
            try session.setCategory(
                .playback,
                mode: .default,
                options: []
            )
        } catch {}
        
        do {
            try session.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {}
        
        do {
            try session.overrideOutputAudioPort(.speaker)
        } catch {}
    }
    
    func playAudio(url: URL) {
        activateSession()
        
        let playerItem = AVPlayerItem(url: url)
        
        if let player {
            player.replaceCurrentItem(with: playerItem)
        } else {
            player = AVPlayer(playerItem: playerItem)
        }
        
        cancellable = NotificationCenter.default.publisher(for: .AVPlayerItemDidPlayToEndTime)
            .sink { [weak self] _ in
                guard let me = self else { return }
                
                me.deactivateSession()
            }
        
        if let player {
            player.play()
        }
    }
    
    func deactivateSession() {
        do {
            try session.setActive(false, options: .notifyOthersOnDeactivation)
        } catch let error as NSError {
            print("Failed to deactivate audio session: \(error.localizedDescription)")
        }
    }
    
    func play() {
        if let player = player {
            player.play()
        }
    }

    func pause() {
        if let player = player {
            player.pause()
        }
    }
}
