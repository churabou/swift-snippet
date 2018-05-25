通常のSnapKit
        
``` .swift
        
        red.snp.makeConstraints { (make) in
            make.size.equalTo(200)
            make.center.equalToSuperview()
        }

        blue.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(100)
            make.left.equalTo(red.snp.right).offset(30)
            make.bottom.equalTo(red.snp.bottom)
        }

        green.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(red.snp.top)
        }
```
        
これを拡張して
        
``` .swift
        red.layout
        .constrainX(centerX: .equalToSuperView, width: 200)
        .constrainY(centerY: .equalToSuperView, height: 200)
        
        blue.layout
        .constrainX(left: red.snp.right + 30, width: 100)
        .constrainY(bottom: red.snp.bottom, height: 100)
        
        green.layout
        .constrainX(centerX: .equalToSuperView, width: 100)
        .constrainY(bottom: red.snp.top, height: 100)
        
```
