import SnapKit

extension ConstraintItem {

    static func +(lhd: ConstraintItem, rhd: CGFloat) -> ConstraintRelatableTargetWrapper {
        return ConstraintRelatableTargetWrapper(lhd, amount: rhd)
    }
    
    static func -(lhd: ConstraintItem, rhd: CGFloat) -> ConstraintRelatableTargetWrapper {
        return ConstraintRelatableTargetWrapper(lhd, amount: -rhd)
    }
}

class ConstraintRelatableTargetWrapper:  SnapKit.ConstraintRelatableTarget {
    
    var amount: CGFloat
    var item: ConstraintItem
    
    init(_ item: ConstraintItem, amount: CGFloat) {
        self.item = item
        self.amount = amount
    }
}


extension SnapKit.ConstraintRelatableTarget {
    static var equalToSuperView: ConstraintRelatableTarget {
        return 9999
    }
}



extension UIView {
    
    var layout: LayoutMakerX {
        return LayoutMakerX(self)
    }
}

