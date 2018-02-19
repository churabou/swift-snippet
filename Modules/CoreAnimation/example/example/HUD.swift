import UIKit
//カラーアニメーションを繋げたい。 keyframeとかの方が良さそう。
class HUD: UIViewController {

    
    override func viewDidAppear(_ animated: Bool) {
        setUp()
    }
    
    
    let normalColor = UIColor.cyan
    let highlightColor = UIColor.green
    
    let circleNum = 10
    let circleRadius: CGFloat = 8
    let hudRadius: Double = 30
    
    func setUp() {

        let wrapperLayer = CALayer()
        wrapperLayer.frame.size = CGSize(width: 200, height: 200)
        wrapperLayer.backgroundColor = UIColor(white: 0.2, alpha: 0.5).cgColor
        wrapperLayer.frame.origin = CGPoint(x: view.frame.width/2-100, y: view.frame.height/2-100)
        view.layer.addSublayer(wrapperLayer)
        
        for i in 0..<circleNum {
            
            let radius: CGFloat = circleRadius
            let layer = CALayer()
            layer.frame.origin = CGPoint(x: (200-radius)/2, y: (200-radius)/2)
            layer.frame.size = CGSize(width: radius, height: radius)
            layer.cornerRadius = radius/2
            layer.backgroundColor = normalColor.cgColor
            
            let r: Double = hudRadius
            let deg = Double(360/circleNum*i)
            layer.transform = CATransform3DMakeTranslation(CGFloat(r*Math.cos(deg)), CGFloat(r*Math.sin(deg)), 0)
            wrapperLayer.addSublayer(layer)
            

            let anim = CAKeyframeAnimation(keyPath: "backgroundColor").maker
                .values([normalColor.cgColor, highlightColor.cgColor, normalColor.cgColor])
                .times([0, 0.4, 0.8])
                .begin(0.1*Double(i))
                .duration(1.2)
                .repeatCount(Float.infinity)
                .Animation()

            let group = CAAnimationGroup().maker
                .anims([anim])
                .duration(100)
                .Animation()

            layer.add(group, forKey: nil)
        }
    }
}


