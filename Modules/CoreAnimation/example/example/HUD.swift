
import UIKit

class HUD: UIView {
    
    func setUp() {
        let wrapperLayer = CALayer()
        wrapperLayer.frame.size = CGSize(width: 200, height: 200)
        wrapperLayer.backgroundColor = UIColor(white: 0.2, alpha: 0.5).cgColor
        wrapperLayer.frame.origin = CGPoint(x: view.frame.width/2-100, y: view.frame.height/2-100)
        view.layer.addSublayer(wrapperLayer)
        
        
        for i in 0..<8 {
            
            let radius: CGFloat = 15
            let layer = CALayer()
            layer.frame.origin = CGPoint(x: (200-radius)/2, y: (200-radius)/2)
            layer.frame.size = CGSize(width: radius, height: radius)
            layer.cornerRadius = radius/2
            layer.backgroundColor = UIColor.gray.cgColor
            
            
            let r: Double = 40 //の大きさ
            let deg = Double(45*i)
            layer.transform = CATransform3DMakeTranslation(CGFloat(r*Math.cos(deg)), CGFloat(r*Math.sin(deg)), 0)
            wrapperLayer.addSublayer(layer)
            
            let anim1 = CABasicAnimation(.scale).maker
                .from(1)
                .to(1.5)
                .begin(0.2*Double(i))
                .duration(0.2)
                .autoreverses(true)
                .Animation()
            
            let anim2 = CABasicAnimation(.backgroundColor).maker
                .from(UIColor.gray.cgColor)
                .to(UIColor.cyan.cgColor)
                .begin(0.2*Double(i))
                .duration(0.6)
                .autoreverses(true)
                .Animation()
            
            let group = CAAnimationGroup().maker
                .anims([anim1, anim2])
                .duration(1.6)
                .repeatCount(Float.infinity)
                .Animation()
            
            layer.add(group, forKey: nil)
        }
    }
}
