//
//  ContentView.swift
//  SliderSwiftUI
//
//  Created by Никита Пережогин on 03.09.2020.
//  Copyright © 2020 Nikita Perezhogin. All rights reserved.
//

import SwiftUI
import AVFoundation

class PlayerViewModel: ObservableObject {
    @Published public var maxDurattion = 0.0
    private var player: AVAudioPlayer?
    
    public func play() {
        playSound(name: "test")
        player?.play()
    }
    
    public func stop() {
        player?.stop()
    }
    
    public func setTime(time: Float) {
        guard let time = TimeInterval(exactly: time) else { return }
        player?.currentTime = time
        player?.play()
    }
    
    private func playSound(name: String){
        guard let audioPath = Bundle.main.path(forResource: name, ofType: "mp3") else { return }
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            maxDurattion = player?.duration ?? 0.0
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

struct ContentView: View {
    @State private var progress: Float = 0
    @ObservedObject var viewModel = PlayerViewModel()
    
    var body: some View {
        VStack{
            Slider(
                value: Binding(
                    get: { Double(self.progress) },
                    set: { newValue in
                        self.progress = Float(newValue)
                        self.viewModel.setTime(time: Float(newValue))
                }),
                in: 0...viewModel.maxDurattion)
                .padding()
            
            HStack{
                Button(
                    action: {
                        self.viewModel.play()
                },
                    label: {
                        Text("Start")
                })
                    .padding()
                    .frame(width: 100, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
                
                Button(
                    action: {
                        self.viewModel.stop()
                },
                    label: {
                        Text("Stop")
                })
                    .padding()
                    .frame(width: 100, height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
