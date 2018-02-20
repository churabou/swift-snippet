//
//  AudioPacer.swift
//  example
//
//  Created by ちゅーたつ on 2018/02/20.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import Foundation
import Speech


class AudioPacer: NSObject {
    
    // Specific language
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ja_JP"))
    private var recognitionRequest: SFSpeechRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    
    func requestAuthorization() {
        
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
    
    func startRecognition() {
        
        guard let path = Bundle.main.path(forResource: "voice_02", ofType: "aiff") else {
            fatalError("voice_02.aac not found")
        }
        
        guard let url = URL(string: path) else {
            fatalError("failed to init URL from path")
        }
        
        print("A地点")
        
        recognitionRequest = SFSpeechURLRecognitionRequest(url: url)
        recognitionRequest?.shouldReportPartialResults = true
        
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest!) {
            result, error in
            var isFinal = false
            
            if let result = result {
                print(result.bestTranscription.formattedString)
                isFinal = result.isFinal
            }
            
                print("B地点")
            
            if error != nil || isFinal {
                // 60 sec limit reached
            }
        }
    }
}
