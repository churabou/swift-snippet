
import UIKit

class RadiusButton: UIButton {
    
    override var isSelected: Bool {
        didSet {
            circleLayer.borderColor = isSelected ? hilightColor.cgColor : UIColor.white.cgColor
        }
    }
    
    @objc private func touchUpInside() {
        isSelected = !isSelected
    }
    
    var hilightColor = UIColor.orange
    var circleLayer = CALayer()
    
    func setUp(size: CGFloat) {
        addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        
        circleLayer.cornerRadius = size/2
        circleLayer.backgroundColor = UIColor.editorMenuColor.cgColor
        circleLayer.borderColor = UIColor.white.cgColor
        circleLayer.borderWidth = 2

        let x = layer.frame.width / 2
        let y = layer.frame.height / 2
        circleLayer.frame.origin = CGPoint(x: x-size/2, y: y-size/2)
        circleLayer.frame.size = CGSize(width: size, height: size)
        layer.addSublayer(circleLayer)
    }
}

//Example
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        let b = RadiusButton()
        b.frame = view.frame
        b.setUp(size: 100)
        view.addSubview(b)
    }
}


//************
//中心にwidth,heightの各1/3の大きさの楕円をかく
//************


class BlurToolMenuButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        var rect = self.bounds
        rect.origin.x = rect.size.width/2 - rect.size.width/6
        rect.origin.y = rect.size.height/2 - rect.size.height/6
        rect.size.width = rect.size.width/3
        rect.size.height = rect.size.height/3
        context?.setFillColor(UIColor.white.cgColor)
        context?.fillEllipse(in: rect)
    }
}



