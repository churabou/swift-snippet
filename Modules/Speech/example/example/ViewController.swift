//
//  ViewController.swift
//  example
//
//  Created by ちゅーたつ on 2018/02/20.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit
import Speech
import AVFoundation

class ViewController: UIViewController {

    
    fileprivate lazy var button: UIButton = {
        
        let b = UIButton()
        b.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        b.backgroundColor = .red
        b.addTarget(self, action: #selector(record), for: .touchUpInside)
        return b
    }()
    
    
    var isRecording = false
    
    @objc fileprivate func record() {
        
        isRecording = !isRecording
        
        if isRecording {
            audioPlay()
        } else {
            audioEnd()
        }
    }
    
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        let p = AudioPacer()
        p.requestAuthorization()
        p.startRecognition()
//        setUp()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func setUp() {
        
        req()
        b()
        audioInit()
        view.addSubview(button)
    }
    

    // Specific language
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ja_JP"))
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?

    func req() {
        
        SFSpeechRecognizer.requestAuthorization { authStatus in
            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized: break
                // 許可された
                case .denied: break
                // 拒否された
                case .restricted:
                    print("なんか restricted")
                return
                case .notDetermined: return
                      print("なんか notDetermined")
                }
            }
        }
    }
    
    func b() {
        
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
    }
    
    
    let audioEngine = AVAudioEngine()
    

    func audioInit() {
        
        let inputNode = audioEngine.inputNode
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { [weak self] (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            
            self?.recognitionRequest?.append(buffer)
        }
    }
    
    func audioPlay() {
        audioEngine.prepare()
        try! audioEngine.start()
    }
    
    func audioEnd() {
        audioEngine.stop()
        recognitionRequest?.endAudio()
    }
}

