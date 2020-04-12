//
//  DataGraphViewController.swift
//  Climber
//
//  Created by 罗谨 on 2020/4/12.
//  Copyright © 2020 finger. All rights reserved.
//

import Foundation
import UIKit
class DataGraphViewController: UIViewController {
    lazy var backgroundImageView : UIImageView = {
        let view = UIImageView.init(frame: self.view.bounds)
        view.image = UIImage.init(named: "loginbg")
        
        let effect = UIBlurEffect.init(style: UIBlurEffect.Style.light)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = view.bounds
        view.addSubview(effectView)
        return view
    }()
    
    lazy var avatarView : UIImageView  = {
        let view = UIImageView.init(frame: CGRect(x: 26, y: 42, width: 76, height: 76))
        view.layer.cornerRadius = view.bounds.width/2
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor.gray
        view.image = UIImage.init(named: "avater")
        return view
    }()
    
    lazy var nameLabel : UILabel = {
        let label = UILabel.init(frame: CGRect(x: self.avatarView.frame.origin.x + self.avatarView.frame.width + 16, y: 65, width: 200, height: 30))
        label.text = "Climber"
        label.font = UIFont.boldSystemFont(ofSize: 36)
        return label
    }()
    
    lazy var dataGraphView : DataGraphView = {
        let view = DataGraphView.init(frame: CGRect(x: 0, y: 130.5, width: self.view.bounds.width, height: self.view.bounds.height))
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dataGraphView.startAnimation()
    }
    
    func setupUI () {
        view.backgroundColor = UIColor.white
        view.addSubview(backgroundImageView)
        view.addSubview(avatarView)
        view.addSubview(nameLabel)
        view.addSubview(dataGraphView)
    }
}
