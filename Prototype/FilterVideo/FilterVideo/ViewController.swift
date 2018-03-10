//
//  ViewController.swift
//  FilterVideo
//
//  Created by ちゅーたつ on 2018/03/06.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit
import AVFoundation


// レイヤーをAVPlayerLayerにする為のラッパークラス.

class AVPlayerView : UIView{
    
    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
}

class ViewController: UIViewController {
    
    var path: String = ""
    var asset: AVAsset!
    var playerItem: AVPlayerItem!
    var videoPlayer : AVPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let path = Bundle.main.path(forResource: "video", ofType: "mp4") else {
            fatalError("not found video.mp4")
        }
        self.path = path
        loadVideo(path: path)
        initializeView()
        playVideo()
    }
    
    func loadVideo(path: String) {
        
        asset = AVAsset(url: URL(fileURLWithPath: path))
        playerItem = AVPlayerItem(asset: asset)
        videoPlayer = AVPlayer(playerItem: playerItem)
        
       
        // UIViewのレイヤーをAVPlayerLayerにする.
        let videoPlayerView = AVPlayerView(frame: view.bounds)
        let layer = videoPlayerView.layer as! AVPlayerLayer
        layer.videoGravity = AVLayerVideoGravity.resizeAspect
        layer.player = videoPlayer
        view.layer.addSublayer(layer)
    }
    
    func playVideo() {
        videoPlayer.seek(to: kCMTimeZero)
        videoPlayer.play()
    }

    func fileterVideo(_ filetType: CIFilter.FilterName, acvName: String? = nil) {

        var composition: AVVideoComposition!
        
        if let acv = acvName {
            
            let filter = CIFilter(name: "CIColorCubeWithColorSpace")!
            
            let size = 32
            let lutName = acv + "+LUT.png"
            let lut = UIImage(named: lutName)!
            let cubeData = createCubeData(lut)
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            
            filter.setValue(size, forKey: "inputCubeDimension")
            filter.setValue(cubeData, forKey: "inputCubeData")
            filter.setValue(colorSpace, forKey: "inputColorSpace")
            
            composition = AVVideoComposition(asset: asset, applyingCIFiltersWithHandler: { request in
                
                print("applying \(acv)")
                let source = request.sourceImage.clampedToExtent()
                filter.setValue(source, forKey: "inputImage")
                let output = filter.outputImage!.cropped(to: request.sourceImage.extent)
                request.finish(with: output, context: nil)
            })
        } else {
            
    
        let filter = CIFilter.named(filetType)

            
            switch filetType {
            case .pixellate:
                filter.setValue(40, forKey: "inputScale")
                composition = AVVideoComposition(asset: asset, applyingCIFiltersWithHandler: { request in
                    
                    print("never called")
                    // Clamp to avoid blurring transparent pixels at the image edges
                    let source = request.sourceImage.clampedToExtent()
                    filter.setValue(source, forKey: "inputImage")
                    
                    // Vary filter parameters based on video timing
                    
                    // Crop the blurred output to the bounds of the original image
                    let output = filter.outputImage!.cropped(to: request.sourceImage.extent)
                    
                    //            UIImageWriteToSavedPhotosAlbum(output.createUIImage(), nil, nil, nil)
                    // Provide the filter output to the composition
                    request.finish(with: output, context: nil)
                })
            default:
                return
            }
        }

        if let c = composition {
            playerItem.videoComposition = c
        }
    }
    
    
    
    
    func exportFilteredVideo(_ composition: AVVideoComposition) {

        let export = AVAssetExportSession(asset: asset, presetName: AVAssetExportPreset1280x720)!
        export.outputFileType = .mp4
        export.outputURL = URL(fileURLWithPath: NSHomeDirectory() + "/Documents/aaa.mp4")
        export.videoComposition = composition
        
        export.exportAsynchronously {
    
            
            switch export.status {
                
            case .completed:
                print("Complete")
                
            case .cancelled:
                print("Cancelled")
                
            case .exporting:
                print("Exporting")
                
            case .failed:
                print("Failed: \(export.error!))")
                
            case .waiting:
                print("Waiting")
                
            case .unknown:
                print("Unknown")
                
            }
        
        }
    }
    
    
    fileprivate let acvs = [
        "aged", "clear", "cold",
        "country","cream", "crossprocess",
        "deep", "fresh_blue", "hot",
        "oldie", "rainy", "retro",
        "retro2", "storm","teacup",
        "tendar", "vintage","warm_kiss"
    ]

    fileprivate var scrollView = UIScrollView()
    
    func initializeView() {
        
        scrollView.apply { $0
            .origin(x: 0, y: view.frame.height-100)
            .size(width: view.frame.width, height: 100)
            .contentSize(width: CGFloat(100*acvs.count), height: 100)
            .backgroudColor(.red)
            .addParentView(view)
        }
        
        for i in 0..<acvs.count {
            
            let button = UIButton()
            button.apply { $0
                .origin(x: 100*CGFloat(i), y: 0)
                .size(width: 100, height: 100)
                .backgroudColor(.orange)
                .title(acvs[i])
                .addParentView(scrollView)
            }
            button.tag = i
            button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        }
    }
    
    @objc fileprivate func actionButton(_ sender: UIButton) {
        fileterVideo(.pixellate, acvName: acvs[sender.tag])
    }
}


//Extension

extension CIImage {
    
    func createUIImage() -> UIImage {
        let context = CIContext()
        guard let cgImage = context.createCGImage(self, from: extent) else {
            fatalError("failed to create cgImage from ciImage")
        }
        return UIImage(cgImage: cgImage)
    }
}


extension CIFilter {
    
    public enum FilterName: String {
        case pixellate = "CIPixellate"
        case lineOverlay = "CILineOverlay"
    }
    
    static func named(_ name: FilterName) -> CIFilter {
        guard let filter = CIFilter(name: name.rawValue) else {
            fatalError("invalid filter name")
        }
        return filter
    }
}


extension UIImage {
    
    func getByteArrayFromImage() -> [UInt8] {
        
        guard let imageRef = self.cgImage else {
            fatalError("self.cgImage is nil")
        }
        let data = imageRef.dataProvider?.data
        let length = CFDataGetLength(data!)
        var rawData = [UInt8](repeating: 0, count: length)
        CFDataGetBytes(data, CFRange(location: 0, length: length), &rawData)
        
        return rawData
    }
}


func createCubeData(_ lut: UIImage) -> NSData {
    
    let imageRef = lut.cgImage!
    let width = imageRef.width
    let height = imageRef.height
    let bytesPerRow = 4 * width
    var bytes = lut.getByteArrayFromImage()
    let size = height
    
    var cubeData: [Float] = []
    let div_255: Float = 1.0 / 255.0
    
    for k in 0..<size {
        for j in 0..<size {
            //g
            let inputY: Int = j
            for i in 0..<size {
                //r
                let inputX = size * k + i
                let index = bytesPerRow * inputY + inputX * 4
                
                let r = Float(bytes[index]) * div_255
                let g = Float(bytes[index+1]) * div_255
                let b = Float(bytes[index+2]) * div_255
                
                cubeData.append(r)
                cubeData.append(g)
                cubeData.append(b)
                cubeData.append(1.0)
            }
        }
    }
    
    return NSData(bytes: cubeData, length: cubeData.count*MemoryLayout<Float>.size)
}

