//
//  ViewController.swift
//  play
//
//  Created by ちゅーたつ on 2018/03/02.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let c = LoginViewController()
        let n = UINavigationController(rootViewController: c)
//        n.transition(from: self,
//                     to: c,
//                     duration: 1,
//                     options: [],
//                     animations: animations,
//                     completion: nil)
        present(n, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


class LoginViewController: UIViewController {
    
    fileprivate var navigator: LoginNavigator?
    
    override func viewDidLoad() {
        navigator = LoginNavigator(navigationController: navigationController!)
        navigator?.navigate(to: .signup)
        
        let c = Closurable()
        c.on(.touchUpInside) {
            
        }
    }
}


class SampleController: UIViewController {
    
    override func viewDidLoad() {
        
        let l = UILabel()
        l.text = String(describing: type(of: self))
        l.textColor = .red
        l.frame = view.frame
        view.addSubview(l)
    }
}

final class Closurable {
   
    
    private var actionClosure = {}
    
    @objc private func action() {
        actionClosure()
    }
    
    func on(_ event: UIControlEvents, _ colosure: ()->()) {
        //b.addTarget(self, action: #selector(action), for: event)
    }
    
}

//MNPの予約番号
//1138-3670-05-
//有効期限
//2018/3/17


class WelcomeViewController: SampleController {}
class PasswordResetViewController: SampleController {}
class SignUpViewController: SampleController {}


protocol Navigator {
    associatedtype Destination
    
    func navigate(to destination: Destination)
}



class LoginNavigator: Navigator {
    // Here we define a set of supported destinations using an
    // enum, and we can also use associated values to add support
    // for passing arguments from one screen to another.
    enum Destination {
        case loginCompleted
        case forgotPassword
        case signup
    }
    
    // In most cases it's totally safe to make this a strong
    // reference, but in some situations it could end up
    // causing a retain cycle, so better be safe than sorry :)
    private weak var navigationController: UINavigationController?
    
    // MARK: - Initializer
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Navigator
    
    func navigate(to destination: Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Private
    
    private func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .loginCompleted:
            return WelcomeViewController()
        case .forgotPassword:
            return PasswordResetViewController()
        case .signup:
            return SignUpViewController()
        }
    }
}
