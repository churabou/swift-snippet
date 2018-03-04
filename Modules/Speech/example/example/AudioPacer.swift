//
//  AudioPacer.swift
//  example
//
//  Created by ちゅーたつ on 2018/02/20.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import Foundation
import Speech


class AudioRecognizer: NSObject {
    
    static func requestAuthorization() {
        
        SFSpeechRecognizer.requestAuthorization { authStatus in
            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized: break // 許可された
                case .denied: break // 拒否された
                case .restricted:
                    print("restricted")
                case .notDetermined:
                    print("notDetermined")
                }
            }
        }
    }
    // Specific language
    private var speechRecognizer: SFSpeechRecognizer?
    private var recognitionRequest: SFSpeechRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?

    func startRecognition(url: URL, completion: @escaping (String) -> Swift.Void) {
    
        speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ja_JP"))
        recognitionRequest = SFSpeechURLRecognitionRequest(url: url)
        recognitionRequest?.shouldReportPartialResults = true
        
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest!) { result, error in
            var isFinal = false
            var text = ""
            if let result = result {
                text = result.bestTranscription.formattedString
                print(text)
                isFinal = result.isFinal
            }
            
            if error != nil || isFinal {
                print("60秒の制限に達したか認識が終わった")
                completion(text)
            }
        }
    }
}
