//
//  ExampleController.swift
//  example
//
//  Created by ちゅーたつ on 2018/03/04.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit
import Speech
import AVFoundation

class ExampleController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // 初回起動時のみ許可が必要
        requestAuthorization()
        
        audioRequest()
        let b = Button()
        b.setUp(view)
        b.onTap {
            
            self.record()
        }
        view.addSubview(b)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Specific language
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ja_JP"))
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    
    func requestAuthorization() {
        
        SFSpeechRecognizer.requestAuthorization { authStatus in
            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized: break // 許可された
                case .denied: break // 拒否された
                case .restricted:
                    print("なんか restricted")
                    return
                case .notDetermined: return
                    print("なんか notDetermined")
                }
            }
        }
    }
    
    
    func audioRequest() {
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        recognitionRequest?.shouldReportPartialResults = true
        
        
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest!) {
            result, error in
            var isFinal = false
            
            if let result = result {
                print(result.bestTranscription.formattedString)
                isFinal = result.isFinal
            }
            
            if error != nil || isFinal {
                // 60 sec limit reached
            }
        }
        
        //audio init
        let inputNode = audioEngine.inputNode
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { [weak self] (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            self?.recognitionRequest?.append(buffer)
        }
    }
    
    
    let audioEngine = AVAudioEngine()
    
    
    func audioPlay() {
        audioEngine.prepare()
        try! audioEngine.start()
    }
    
    func audioEnd() {
        audioEngine.stop()
        recognitionRequest?.endAudio()
    }
    
    var isRecording = false
    
    @objc fileprivate func record() {
        
        isRecording = !isRecording
        
        if isRecording {
            audioPlay()
        } else {
            audioEnd()
        }
    }
}

