//
//  viewC.swift
//  Ames
//
//  Created by Ciana on 12/05/23.
//

/*import SwiftUI
import AVKit
struct viewC: View {
    var body: some View {
        
        ciana()
            .preferredColorScheme(.light)
    }
}

struct viewC_Previews: PreviewProvider {
    static var previews: some View {
        viewC()
    }
}

struct ciana : View {
    @State var record = false
    @State var session : AVAudioSession!
    @State var recorder : AVAudioRecorder!
    @State var error = false
    @State var audios : [URL]=[]
    var body: some View{
        NavigationView{
            VStack{
                
                List(self.audios, id:\.self){
                    i in
                    Text(i.relativeString)
                }
                Button(action:{
                    
                    do{
                        
                        if self.record{
                            self.recorder.stop()
                            self.record.toggle()
                            self.getAudios()
                            
                            return
                        }
                        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                        let fileName = url.appendingPathComponent("Ciana")
                        let settings = [
                            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                            AVSampleRateKey : 1200,
                            AVNumberOfChannelsKey : 1,
                            AVEncoderAudioQualityKey:  AVAudioQuality.high.rawValue
                        ]
                        self.recorder = try  AVAudioRecorder(url : fileName, settings: settings)
                        
                        self.recorder.record()
                        self.record.toggle()
                    }
                    catch{
                        print(error.localizedDescription)
                    }
                    
                    
                }) {
                    ZStack{
                        Circle()
                            .fill(Color("blue"))
                            .frame(width: 70, height: 70)
                        if self.record{
                            Circle()
                                .stroke(Color.black, lineWidth: 6)
                                .frame(width: 85, height: 85)
                        }
                    }
                    
                }
                .padding(.vertical, 25)
            }
            .navigationBarTitle("Record Audio")
        }
        .alert(isPresented: self.$error, content: {
            Alert(title: Text("Error"), message: Text("Enable Acess"))
            
            
        })
        .onAppear {
            do{
                self.session = AVAudioSession.sharedInstance()
                try self.session.setCategory(.playAndRecord)
                self.session.requestRecordPermission{
                    (status) in
                    
                    if !status{
                        self.error.toggle()
                    }
                    else {
                        self.getAudios()
                    }
                }
            }
            catch{
                print(error .localizedDescription)
            }
            //  }
            // }
           
            
        }
    }
    
    func getAudios(){
        do{
            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            
            let result =
            
           try  FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .producesRelativePathURLs)
           // FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .producesRelativePathURLs)
            
            self.audios.removeAll()
            
            
            for i in result{
                self.audios.append(i)
            }
        }
        catch{
            print(error.localizedDescription)
        }
    }
}*/
/*import SwiftUI
import AVKit

struct ViewC: View {
    var body: some View {
        Ciana()
            .preferredColorScheme(.light)
    }
}

struct ViewC_Previews: PreviewProvider {
    static var previews: some View {
        ViewC()
    }
}

struct Ciana: View {
    @State private var isRecording = false
    @State private var session: AVAudioSession!
    @State private var recorder: AVAudioRecorder!
    @State private var error = false
    @State private var audios: [URL] = []
    
    var body: some View {
        NavigationView {
            VStack {
                List(audios, id: \.self) { audioURL in
                    Button(action: {
                        playAudio(url: audioURL)
                    }) {
                        Text(audioURL.lastPathComponent)
                    }
                }
                
                Button(action: {
                    toggleRecording()
                }) {
                    ZStack {
                        Circle()
                            .fill(Color("blue"))
                            .frame(width: 70, height: 70)
                        if isRecording {
                            Circle()
                                .stroke(Color.black, lineWidth: 6)
                                .frame(width: 85, height: 85)
                        }
                    }
                }
                .padding(.vertical, 25)
            }
            .navigationBarTitle("Record Audio")
        }
        .alert(isPresented: $error) {
            Alert(title: Text("Error"), message: Text("Enable Access"))
        }
        .onAppear {
            setupAudioSession()
        }
    }
    
    func toggleRecording() {
        if isRecording {
            stopRecording()
        } else {
            startRecording()
        }
    }
    
    func startRecording() {
        do {
            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileName = url.appendingPathComponent("Ciana.m4a")
            let settings: [String: Any] = [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 1200,
                AVNumberOfChannelsKey: 1,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]
            recorder = try AVAudioRecorder(url: fileName, settings: settings)
            recorder.record()
            isRecording = true
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func stopRecording() {
        recorder.stop()
        recorder = nil
        isRecording = false
        getAudios()
    }
    
    func setupAudioSession() {
        do {
            session = AVAudioSession.sharedInstance()
            try session.setCategory(.playAndRecord)
            session.requestRecordPermission { status in
                if !status {
                    error = true
                } else {
                    getAudios()
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getAudios() {
        do {
            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let result = try FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            audios = result.filter { $0.pathExtension == "m4a" }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func playAudio(url: URL) {
        let player = AVPlayer(url: url)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        UIApplication.shared.windows.first?.rootViewController?.present(playerViewController, animated: true) {
            player.play()
        }
    }
}*/

import SwiftUI
import AVKit

struct ViewC: View {
    var body: some View {
        Ciana()
            .preferredColorScheme(.light)
    }
}

struct ViewC_Previews: PreviewProvider {
    static var previews: some View {
        ViewC()
    }
}

struct Ciana: View {
    @State private var isRecording = false
    @State private var session: AVAudioSession!
    @State private var recorder: AVAudioRecorder!
    @State private var error = false
    @State private var audios: [URL] = []
    
    var body: some View {
        NavigationView {
            VStack {
                List(audios, id: \.self) { audioURL in
                    Button(action: {
                        playAudio(url: audioURL)
                    }) {
                        Text(audioURL.lastPathComponent)
                    }
                }
                
                Button(action: {
                    toggleRecording()
                }) {
                    ZStack {
                        Circle()
                            .fill(Color("blue"))
                            .frame(width: 70, height: 70)
                        if isRecording {
                            Circle()
                                .stroke(Color.black, lineWidth: 6)
                                .frame(width: 85, height: 85)
                        }
                    }
                }
                .padding(.vertical, 25)
            }
            .navigationBarTitle("Record Audio")
        }
        .alert(isPresented: $error) {
            Alert(title: Text("Error"), message: Text("Enable Access"))
        }
        .onAppear {
            setupAudioSession()
            getAudios()
        }
    }
    
    func toggleRecording() {
        if isRecording {
            stopRecording()
        } else {
            startRecording()
        }
    }
    
    func startRecording() {
        do {
            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileName = url.appendingPathComponent("\(Date().timeIntervalSince1970).m4a")
            let settings: [String: Any] = [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 1200,
                AVNumberOfChannelsKey: 1,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]
            recorder = try AVAudioRecorder(url: fileName, settings: settings)
            recorder.record()
            isRecording = true
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func stopRecording() {
        recorder.stop()
        recorder = nil
        isRecording = false
        getAudios()
    }
    
    func setupAudioSession() {
        do {
            session = AVAudioSession.sharedInstance()
            try session.setCategory(.playAndRecord)
            session.requestRecordPermission { status in
                if !status {
                    error = true
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getAudios() {
        do {
            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let result = try FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            audios = result.filter { $0.pathExtension == "m4a" }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func playAudio(url: URL) {
        let player = AVPlayer(url: url)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        UIApplication.shared.windows.first?.rootViewController?.present(playerViewController, animated: true) {
            player.play()
        }
    }
}
