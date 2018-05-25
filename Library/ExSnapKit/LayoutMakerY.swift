
class LayoutMakerY {
    
    var base: UIView
    init (_ base: UIView) {
        self.base = base
    }
}



extension LayoutMakerY {
    
    func constrainY(top: ConstraintRelatableTarget, bottom: ConstraintRelatableTarget) {
     
        base.snp.makeConstraints { (make) in
            
            if let top = top as? ConstraintRelatableTargetWrapper {
                make.top.equalTo(top.item).offset(top.amount)
            } else {
                make.top.equalTo(top)
            }
            
            if let bottom = bottom as? ConstraintRelatableTargetWrapper {
                make.bottom.equalTo(bottom.item).offset(bottom.amount)
            } else {
                make.bottom.equalTo(bottom)
            }
        }
    }
    
    func constrainY(top: ConstraintRelatableTarget, height: ConstraintRelatableTarget) {
        
        base.snp.makeConstraints { (make) in
            
            if let top = top as? ConstraintRelatableTargetWrapper {
                make.top.equalTo(top.item).offset(top.amount)
            } else {
                make.top.equalTo(top)
            }
            
            if let height = height as? ConstraintRelatableTargetWrapper {
                make.height.equalTo(height.item).offset(height.amount)
            } else {
                make.height.equalTo(height)
            }
        }
    }
    
    func constrainY(bottom: ConstraintRelatableTarget, height: ConstraintRelatableTarget) {
        
        base.snp.makeConstraints { (make) in
            
            if let bottom = bottom as? ConstraintRelatableTargetWrapper {
                make.bottom.equalTo(bottom.item).offset(bottom.amount)
            } else {
                make.bottom.equalTo(bottom)
            }
            
            if let height = height as? ConstraintRelatableTargetWrapper {
                make.height.equalTo(height.item).offset(height.amount)
            } else {
                make.height.equalTo(height)
            }
        }
    }
    
    func constrainY(centerY: ConstraintRelatableTarget, height: ConstraintRelatableTarget) {
        
        base.snp.makeConstraints { (make) in
            
            if let centerY = centerY as? ConstraintRelatableTargetWrapper {
                make.centerY.equalTo(centerY.item).offset(centerY.amount)
            } else {
                make.centerY.equalTo(centerY)
            }
            
            if let height = height as? ConstraintRelatableTargetWrapper {
                make.height.equalTo(height.item).offset(height.amount)
            } else {
                make.height.equalTo(height)
            }
        }
    }
}



