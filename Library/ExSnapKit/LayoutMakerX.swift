
class LayoutMakerX {
    
    var base: UIView
    init (_ base: UIView) {
        self.base = base
    }
}

extension LayoutMakerX {
    
    func constrainX(left: ConstraintRelatableTarget, right: ConstraintRelatableTarget) -> LayoutMakerY {

        base.snp.makeConstraints { (make) in
            
            if let left = left as? ConstraintRelatableTargetWrapper {
                make.left.equalTo(left.item).offset(left.amount)
            } else {
                make.left.equalTo(left)
            }
            
            if let right = right as? ConstraintRelatableTargetWrapper {
                 make.right.equalTo(right.item).offset(right.amount)
            } else {
                 make.right.equalTo(right)
            }
        }
        return LayoutMakerY(self.base)
    }
    
    func constrainX(left: ConstraintRelatableTarget, width: ConstraintRelatableTarget) -> LayoutMakerY {
        
        base.snp.makeConstraints { (make) in
            
            if let left = left as? ConstraintRelatableTargetWrapper {
                make.left.equalTo(left.item).offset(left.amount)
            } else {
                make.left.equalTo(left)
            }
            
            if let width = width as? ConstraintRelatableTargetWrapper {
                make.width.equalTo(width.item).offset(width.amount)
            } else {
                make.width.equalTo(width)
            }
        }
        return LayoutMakerY(self.base)
    }
    
    func constrainX(right: ConstraintRelatableTarget, width: ConstraintRelatableTarget) -> LayoutMakerY {
        
        base.snp.makeConstraints { (make) in
            
            if let right = right as? ConstraintRelatableTargetWrapper {
                make.right.equalTo(right.item).offset(right.amount)
            } else {
                make.right.equalTo(right)
            }
            
            if let width = width as? ConstraintRelatableTargetWrapper {
                make.width.equalTo(width.item).offset(width.amount)
            } else {
                make.width.equalTo(width)
            }
        }
        return LayoutMakerY(self.base)
    }
    
    func constrainX(centerX: ConstraintRelatableTarget, width: ConstraintRelatableTarget) -> LayoutMakerY {
        
        base.snp.makeConstraints { (make) in
            
            if let centerX = centerX as? ConstraintRelatableTargetWrapper {
                make.centerX.equalTo(centerX.item).offset(centerX.amount)
            } else {
                make.centerX.equalTo(centerX)
            }
            
            if let width = width as? ConstraintRelatableTargetWrapper {
                make.width.equalTo(width.item).offset(width.amount)
            } else {
                make.width.equalTo(width)
            }
        }
        return LayoutMakerY(self.base)
    }
}

