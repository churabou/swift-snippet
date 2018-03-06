import UIKit

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
