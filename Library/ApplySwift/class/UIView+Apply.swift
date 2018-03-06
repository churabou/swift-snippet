import UIKit

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
}
