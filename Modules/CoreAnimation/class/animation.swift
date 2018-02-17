import UIKit

//add basicAnimation

extension CALayer {
    var basic: BasicAnimationMaker {
        return BasicAnimationMaker(self)
    }
}

struct BasicAnimationMaker {
    
    private var base: CALayer
    init(_ base: CALayer) {
        self.base = base
    }
    
    func backgroundColor(key: String, animation: ((CABasicAnimation) -> (CABasicAnimation))) {
        let colorAnimation = CABasicAnimation(keyPath: "backgroundColor")
        base.add(animation(colorAnimation), forKey: key)
    }
    
    func cornerRadius(key: String, animation: ((CABasicAnimation) -> (CABasicAnimation))) {
        let colorAnimation = CABasicAnimation(keyPath: "cornerRadius")
        base.add(animation(colorAnimation), forKey: key)
    }
    
    func rotationZ(key: String, animation: ((CABasicAnimation) -> (CABasicAnimation))) {
        let colorAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        base.add(animation(colorAnimation), forKey: key)
    }
    
    func position(key: String, animation: ((CABasicAnimation) -> (CABasicAnimation))) {
        let colorAnimation = CABasicAnimation(keyPath: "position")
        base.add(animation(colorAnimation), forKey: key)
    }
    
    func positionX(key: String, animation: ((CABasicAnimation) -> (CABasicAnimation))) {
        let colorAnimation = CABasicAnimation(keyPath: "position.x")
        base.add(animation(colorAnimation), forKey: key)
    }
    
    func positionY(key: String, animation: ((CABasicAnimation) -> (CABasicAnimation))) {
        let colorAnimation = CABasicAnimation(keyPath: "position.y")
        base.add(animation(colorAnimation), forKey: key)
    }
}

//add keyframeAnimation
extension CALayer {
    var kf: KeyFrameAnimationMaker {
        return KeyFrameAnimationMaker(self)
    }
}

struct KeyFrameAnimationMaker {
    
    private var base: CALayer
    init(_ base: CALayer) {
        self.base = base
    }
    
    func backgroundColor(key: String, animation: ((CAKeyframeAnimation) -> (CAKeyframeAnimation))) {
        let colorAnimation = CAKeyframeAnimation(keyPath: "backgroundColor")
        base.add(animation(colorAnimation), forKey: key)
    }
    
    func cornerRadius(key: String, animation: ((CAKeyframeAnimation) -> (CAKeyframeAnimation))) {
        let cornerRadiusAnimation = CAKeyframeAnimation(keyPath: "cornerRadius")
        base.add(animation(cornerRadiusAnimation), forKey: key)
    }
    
    func rotationZ(key: String, animation: ((CAKeyframeAnimation) -> (CAKeyframeAnimation))) {
        let colorAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        base.add(animation(colorAnimation), forKey: key)
    }
    
    func position(key: String, animation: ((CAKeyframeAnimation) -> (CAKeyframeAnimation))) {
        let colorAnimation = CAKeyframeAnimation(keyPath: "position")
        base.add(animation(colorAnimation), forKey: key)
    }
    
    func positionX(key: String, animation: ((CAKeyframeAnimation) -> (CAKeyframeAnimation))) {
        let colorAnimation = CAKeyframeAnimation(keyPath: "position.x")
        base.add(animation(colorAnimation), forKey: key)
    }
    
    func positionY(key: String, animation: ((CAKeyframeAnimation) -> (CAKeyframeAnimation))) {
        let colorAnimation = CAKeyframeAnimation(keyPath: "position.y")
        base.add(animation(colorAnimation), forKey: key)
    }
}

