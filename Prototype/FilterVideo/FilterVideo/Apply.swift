import UIKit

protocol ApplySwift {}

extension ApplySwift {
    
    func apply(_ closure: (Applicable<Self>)->Applicable<Self>) {
        closure(Applicable(self)).escape()
    }
}

struct Applicable<T> {
    
    public var base: T
    
    init(_ base: T) {
        self.base = base
    }
    
    fileprivate func escape() {}
}


extension Applicable where T: UIButton {
    
    func title(_ title: String, state: UIControlState = .normal) -> Applicable<T> {
        base.setTitle(title, for: state)
        return self
    }
    
    func titleColor(_ color: UIColor, state: UIControlState = .normal) -> Applicable<T> {
        base.setTitleColor(color, for: state)
        return self
    }
}



extension Applicable where T: UILabel {
    
    func text(_ text: String) -> Applicable<T> {
        base.text = text
        return self
    }
    
    func textColor(_ color: UIColor) -> Applicable<T> {
        base.textColor = color
        return self
    }
    
    func alignment(_ alignment: NSTextAlignment) -> Applicable<T> {
        base.textAlignment = alignment
        return self
    }
}

extension UIView: ApplySwift {}

extension Applicable where T: UIView {
    
    
    func backgroudColor(_ color: UIColor) -> Applicable<T> {
        base.backgroundColor = color
        return self
    }
    
    func origin(x: CGFloat, y: CGFloat) -> Applicable<T> {
        base.frame.origin = CGPoint(x: x, y: y)
        return self
    }
    
    func size(width: CGFloat, height: CGFloat) -> Applicable<T> {
        base.frame.size = CGSize(width: width, height: height)
        return self
    }
    
    
    func clipsToBounds() -> Applicable<T> {
        base.clipsToBounds = true
        return self
    }
    
    func cornerRadius(_ radius: CGFloat) -> Applicable<T> {
        base.layer.cornerRadius = radius
        return self
    }
    
    func addParentView(_ parent: UIView) -> Applicable<T> {
        parent.addSubview(base)
        return self
    }
}


extension Applicable where T: UIScrollView {
    
    
    func contentSize(width: CGFloat, height: CGFloat) -> Applicable<T> {
        base.contentSize = CGSize(width: width, height: height)
        return self
    }
}
