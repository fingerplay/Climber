//
//  AniTextField.swift
//  Climber
//
//  Created by 罗谨 on 2020/4/11.
//  Copyright © 2020 finger. All rights reserved.
//

import Foundation
import UIKit

class AniTextField: UIView {
    private var title: String = ""
    
    private var isShowTitle = false;
    
    lazy var titleLabel : UILabel = {
        let label = UILabel.init(frame: .zero)
        label.text = title
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor =  UIColor.init(HexString: "#7b7b7b")
        
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField.init()
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.textColor = UIColor.init(HexString: "#e5e5e5")
//        textField.delegate = self
        textField.addTarget(self, action: #selector(onTextChanged), for: UIControl.Event.editingChanged)
        return textField
    }()
    
    lazy var line : UIView = {
        let line = UIView.init()
        line.backgroundColor =  UIColor.init(HexString: "#7b7b7b")
        return line
    }()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
     
    }
    
    convenience init(title:String) {
        
        self.init(frame: .zero)
        self.title = title;
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func moveTitleToTop (){
   
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.duration = 0.3;
        scaleAnimation.toValue = 0.85;
        scaleAnimation.autoreverses = false
      

        let moveAnimation = CABasicAnimation(keyPath: "position")
        moveAnimation.duration = 0.3;
        moveAnimation.toValue = CGPoint(x: 85, y: 0);
        moveAnimation.autoreverses = false
      

        let group = CAAnimationGroup.init()
        group.animations = [moveAnimation, scaleAnimation]
        group.duration = 0.3
        group.isRemovedOnCompletion = false
        group.fillMode = CAMediaTimingFillMode.forwards
        self.titleLabel.layer.add(group, forKey: "aniMove_aniScale_groupAnimation")
        

    }
    
    func moveTitleToBottom (){
        self.titleLabel.layer.removeAllAnimations()
//        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
//        scaleAnimation.duration = 0.3;
//        scaleAnimation.toValue = 1;
//
//        let moveAnimation = CABasicAnimation(keyPath: "position")
//        moveAnimation.duration = 0.3;
//        moveAnimation.toValue = CGPoint(x: 85, y: 14);
//
//        let group = CAAnimationGroup.init()
//        group.animations = [moveAnimation, scaleAnimation]
//        group.duration = 0.3
//        group.isRemovedOnCompletion = false
//        group.fillMode = CAMediaTimingFillMode.forwards
//        self.titleLabel.layer.add(group, forKey: "aniMove_aniScale_groupAnimation")
      
    }
    
    func setupUI () {
        self.addSubview(titleLabel)
        self.addSubview(textField)
        self.addSubview(line)
        
        self.titleLabel.frame = CGRect(x:0,y:14,width: 200, height: 14)
        
        textField.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(26)
            make.bottom.equalTo(line.snp.top)
        }
        
        line.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.left.equalTo(self).offset(-1)
            make.right.equalTo(self).offset(1)
            make.height.equalTo(1)
        }
        
    }
    
    
    @objc func onTextChanged (_ textField: UITextField) {
        if let text = textField.text, text.count>0 {
            line.backgroundColor = UIColor.init(Hex: 0xe5e5e5)
  
            if (!isShowTitle) {
                moveTitleToTop()
                isShowTitle = true
            }
           
        }else {
            line.backgroundColor = UIColor.init(Hex: 0x7b7b7b)
            if(isShowTitle) {
                isShowTitle = false
                moveTitleToBottom()
            }
            
        }
    }
}
