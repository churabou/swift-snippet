import UIKit

enum AnimationTarget: String {
    case bounds = "bounds"
    case backgroundColor = "backgroundColor"
    case cornerRadius = "cornerRadius"
    case positionX = "position.x"
    case rotateZ = "transform.rotation.z"
}

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
    
    func add(key: String? = nil, _ target: AnimationTarget, _ basicAnimation: ((CABasicAnimation) -> (CABasicAnimation))) {
        
        let anim = CABasicAnimation(keyPath: target.rawValue)
        base.add(basicAnimation(anim), forKey: key)
    }
}


extension CABasicAnimation {
    
    func from(_ value: Any) -> CABasicAnimation {
        fromValue = value
        return self
    }
    
    func to(_ value: Any) -> CABasicAnimation {
        toValue = value
        return self
    }
    
    func duration(_ value: CFTimeInterval) -> CABasicAnimation {
        duration = value
        return self
    }
    
    func repeatCount(_ value: Float) -> CABasicAnimation {
        repeatCount = value
        return self
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

