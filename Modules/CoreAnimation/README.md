```
        let colorAnimation = CABasicAnimation(keyPath: "backgroundColor")
        colorAnimation.fromValue = UIColor.red.cgColor
        colorAnimation.toValue = UIColor.blue.cgColor
        colorAnimation.duration = 2
        colorAnimation.repeatCount = 10
        view.layer.add(colorAnimation, forKey: nil)
```

```
        view.layer.basic.add(.backgroundColor, { anim in
            return anim.from(UIColor.blue.cgColor).to(UIColor.orange.cgColor).duration(2).repeatCount(10)
        })
```
