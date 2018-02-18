import UIKit

enum AnimationTarget: String {
    case bounds = "bounds"
    case backgroundColor = "backgroundColor"
    case cornerRadius = "cornerRadius"
    case positionX = "position.x"
    case rotateZ = "transform.rotation.z"
    case opacity = "opacity"
}

//add basicAnimation

extension CALayer {

    func basic(key: String? = nil, _ target: AnimationTarget, _ basicAnimation: ((AnimationMaker<CABasicAnimation>) -> (AnimationMaker<CABasicAnimation>)))  {
        
        let anim = CABasicAnimation(keyPath: target.rawValue)
        add(basicAnimation(anim.maker).Animation(), forKey: key)
    }
    
    func keyframe(key: String? = nil, _ target: AnimationTarget, _ basicAnimation: ((AnimationMaker<CAKeyframeAnimation>) -> (AnimationMaker<CAKeyframeAnimation>)))  {
        
        let anim = CAKeyframeAnimation(keyPath: target.rawValue)
        add(basicAnimation(anim.maker).Animation(), forKey: key)
    }
}

extension CAAnimation: AnimationMakable {}

protocol AnimationMakable {}

extension AnimationMakable where Self: CAAnimation {
    var maker: AnimationMaker<Self> {
        return AnimationMaker(self)
    }
}

class AnimationMaker<T: CAAnimation> {
    
    private var base: T
    init(_ base: T) {
        self.base = base
    }
    
    func Animation() -> CAAnimation {
        return base
    }
}


extension AnimationMaker {
    
    func duration(_ value: CFTimeInterval) -> AnimationMaker<T> {
        base.duration = value
        return self
    }
    
    func repeatCount(_ value: Float) -> AnimationMaker<T> {
        base.repeatCount = value
        return self
    }
}

extension AnimationMaker where T: CABasicAnimation {
    
    
    func from(_ value: Any) -> AnimationMaker<T> {
        base.fromValue = value
        return self
    }
    
    func to(_ value: Any) ->  AnimationMaker<T> {
        base.toValue = value
        return self
    }
}


extension AnimationMaker where T: CAKeyframeAnimation {
    
    func values(_ values: [Any]) -> AnimationMaker<T> {
        base.values = values
        return self
    }
    
    func times(_ values: [NSNumber]) -> AnimationMaker<T> {
        base.keyTimes = values
        return self
    }
}
