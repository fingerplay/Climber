//
//  DataGraphView.swift
//  Climber
//
//  Created by 罗谨 on 2020/4/12.
//  Copyright © 2020 finger. All rights reserved.
//

import Foundation
import UIKit

class DataGraphView: UIView {
    
    lazy var titleLabel : UILabel = {
        let label = UILabel.init(frame: CGRect(x: 0, y: 0, width: 100, height: 42))
        label.center = CGPoint(x: self.bounds.width/2 , y: self.bounds.height/2 - 42/2 - 8 )
        label.font = UIFont.systemFont(ofSize: 35)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "Steps"
        return label
    }()
    
    lazy var countLabel : UILabel = {
        let label = UILabel.init(frame: CGRect(x: 0, y: 0, width: 150, height: 60))
        label.center = CGPoint(x: self.bounds.width/2 , y: self.bounds.height/2)
        label.font = UIFont.systemFont(ofSize: 50)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "12000"
        return label
    }()
    
    lazy var dateLabel : UILabel = {
        let label = UILabel.init(frame: CGRect(x: 0, y: 0, width: 150, height: 19))
        label.center = CGPoint(x: self.bounds.width/2 , y: self.bounds.height/2 + 8 + 19/2)
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "Today"
        return label
    }()
    
    lazy var circlePath : UIBezierPath = {
        let circlePath: UIBezierPath = UIBezierPath(arcCenter: CGPoint(x: self.bounds.width/2, y: self.bounds.height/2), radius: self.frame.width/2 -  36/375 * UIScreen.main.bounds.width , startAngle: CGFloat(-Double.pi), endAngle: CGFloat(Double.pi), clockwise: true)
        //设置颜色
        UIColor.white.set()
        circlePath.lineWidth = 30;
        //开始绘图
        return circlePath
    }()
    
    lazy var bgLayer : CAShapeLayer = {
        let bgLayer = CAShapeLayer.init()
        bgLayer.frame = self.bounds;
        //填充色 透明
        bgLayer.fillColor = UIColor.clear.cgColor;
        bgLayer.lineWidth = 30;
        //线条颜色
        bgLayer.strokeColor = UIColor(Hex:0xd8d8d8).cgColor;
        //起始点
        bgLayer.strokeStart = 0;
        //终点
        bgLayer.strokeEnd = 1;
        //让线两端是圆滑的状态
        bgLayer.lineCap = CAShapeLayerLineCap.round;
        //把背景的路径设为贝塞尔曲线路径
        bgLayer.path = circlePath.cgPath;
        return bgLayer
    }()
    
    lazy var progressLayer : CAShapeLayer = {
        let _progressLayer = CAShapeLayer.init()
        _progressLayer.frame = self.bounds;
        _progressLayer.fillColor = UIColor.clear.cgColor;
        _progressLayer.lineWidth = 30;
        _progressLayer.lineCap = CAShapeLayerLineCap.round;
        _progressLayer.strokeColor = UIColor.red.cgColor;
        _progressLayer.strokeStart = 0;
        _progressLayer.strokeEnd = 0.25;
        _progressLayer.path = circlePath.cgPath;
        return _progressLayer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        self.addSubview(countLabel)
        self.addSubview(titleLabel)
        self.addSubview(dateLabel)
        
        countLabel.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.height.equalTo(60)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.bottom.equalTo(self.countLabel.snp.top).offset(-8)
            make.height.equalTo(42)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self.countLabel.snp.bottom).offset(8)
            make.height.equalTo(19)
        }
        
        drawRoundRing()
    }
    
    func drawRoundRing (){
        //贝塞尔曲线画圆弧
        circlePath.stroke()
        self.layer.addSublayer(bgLayer);
        self.layer.addSublayer(progressLayer)
    }
    
    func startAnimation (){
        UIView.animate(withDuration: 0.3) {
            self.progressLayer.strokeEnd = 0.37
            self.countLabel.text = "14000"
        }
    }
}
