import UIKit

protocol EasyRectable {
    var er: EasyRect { get }
}

extension EasyRectable where Self: UIView {
    
    var er: EasyRect {
        return EasyRect(self)
    }
}

struct EasyRect {
    
    var base: UIView
    init(_ base: UIView) {
        self.base = base
    }
    
    func setFrame(_ info: [CGFloat]) {
        if info.count == 4 {
            base.frame = CGRect(x: info[0], y: info[1], width: info[2], height: info[3])
        }
    }
    
    func setSize(_ s: CGFloat) {
        base.frame.size = CGSize(width: s, height: s)
    }
    
    func setCenter(of: UIView) {
        
        let parent = of
        var origin = parent.center
        origin.x -= base.frame.width / 2
        origin.y -= base.frame.height / 2
        base.frame.origin = origin
    }
    
    var width: CGFloat {
        return base.frame.width
    }
    
    func setWidth(_ width: CGFloat) {
        base.frame.size.width = width
    }
    
    var x: CGFloat {
        get {
            return base.frame.origin.x
        }
    }
    
    func setX(_ x: CGFloat) {
        base.frame.origin.x = x
    }
    
    var y: CGFloat {
        get {
            return base.frame.origin.x
        }
    }
    
    func setY(_ y: CGFloat) {
        base.frame.origin.y = y
    }
    
    func makeRightEqualTo(_ v: UIView, offSet: CGFloat) {
        base.frame.origin.x = v.frame.maxX
    }
    
    func setRect(_ maker: (EasyMaker)->()) {
        
        let maker = EasyMaker(base)
    }
}

extension EasyRect {
    
    static func set(_ info: [CGFloat]) -> CGRect {
        if info.count == 4 {
            return CGRect(x: info[0], y: info[1], width: info[2], height: info[3])
        } else {
            return CGRect.zero
        }
    }
}

class EasyMaker {
    
    var base: UIView
    init(_ base: UIView) {
        self.base = base
    }
    
    var x: EasyMakable {
        return EasyMakable(base, .x)
    }
    var y: EasyMakable {
        return EasyMakable(base, .y)
    }

    var width: EasyMakable {
        return EasyMakable(base, .width)
    }
    var height: EasyMakable {
        return EasyMakable(base, .height)
    }
    var size: EasyMakable {
        return EasyMakable(base, .size)
    }
    var center: EasyMakable {
        return EasyMakable(base, .center)
    }
}

enum EasyMakableType {
    
    case x
    case y
    case origin
    case center
    case size
    case width
    case height
    case right
    case left
    case top
    case bottom
    case centerY
    case centerX
}

class EasyMakable {
    
    var base: UIView
    var type: EasyMakableType
    
    init(_ base: UIView, _ type: EasyMakableType) {
        self.type = type
        self.base = base
    }
    
    func equalTo(_ v: CGFloat) {
     
        switch type {
        case .x: base.er.setX(v)
        case .y: base.er.setY(v)
        case .size: base.er.setSize(v)
        case .width: base.er.setWidth(v)
        default:
            return
        }
    }
}


extension UIView: EasyRectable {}

