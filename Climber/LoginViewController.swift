//
//  ViewController.swift
//  Climber
//
//  Created by 罗谨 on 2020/4/11.
//  Copyright © 2020 finger. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController  {
    lazy var userNameText: AniTextField = AniTextField.init(title: "Username")

    lazy var passwordText: AniTextField = AniTextField.init(title: "Password")
    
    lazy var loginButton : UIButton = {
        let button = UIButton.init()
        button.setBackgroundImage(UIImage.init(named: "loginbtn"), for: UIControl.State.normal)
        button.setTitle("LOGIN", for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setupUI()
    }

 
    func setupUI() {
        loginButton.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)
        self.view.addSubview(userNameText)
        self.view.addSubview(passwordText)
        self.view.addSubview(loginButton)
        
        userNameText.snp.makeConstraints { (make) in
            make.left.equalTo(31)
            make.right.equalTo(-32)
            make.bottom.equalTo(-193.5)
            make.height.equalTo(40)
        }

        passwordText.snp.makeConstraints { (make) in
            make.left.equalTo(31)
            make.right.equalTo(-32)
            make.bottom.equalTo(-137.5)
            make.height.equalTo(40)
        }

        
        loginButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(-75)
            make.left.equalTo(self.view).offset(32)
            make.right.equalTo(self.view).offset(-31)
            make.height.equalTo(40)
        }
        
    }
    
    @objc func loginBtnClick () {
        let vc = DataGraphViewController.init(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }

}



