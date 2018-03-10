import UIKit

typealias TapClosure = ()->Swift.Void

class Tapable {
    
    static var key = "ON_TAP_KEY"
    private var base: UIButton
    
    init(_ base: UIButton) {
        self.base = base
    }
    
    var onTouchUpInside: TapClosure? {
        didSet {
            base.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        }
    }
    
    @objc private func touchUpInside(sender: AnyObject) {
        onTouchUpInside?()
    }
}


extension UIButton {
    
    func onTap(_ closure:  @escaping ()->Swift.Void) {
        tapable.onTouchUpInside = closure
    }
    
    private var tapable: Tapable {
        get {
            if let handler = objc_getAssociatedObject(self,  &Tapable.key) as? Tapable {
                return handler
            } else {
                self.tapable = Tapable(self)
                return self.tapable
            }
        }
        set {
            objc_setAssociatedObject(self, &Tapable.key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
