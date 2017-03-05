//
//  OvalLayer.swift
//  SBLoader
//
//  Created by Satraj Bambra on 2015-03-19.
//  Copyright (c) 2015 Satraj Bambra. All rights reserved.
//

import UIKit

class OvalLayer: CAShapeLayer {
    
    let animationDuration: CFTimeInterval = 0.3
    
    override init() {
        super.init()
        fillColor = Colors.red.cgColor
        path = ovalPathSmall.cgPath
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var ovalPathSmall: UIBezierPath {
        return UIBezierPath(ovalIn: CGRect(x: 50.0, y: 50.0, width: 0.0, height: 0.0))
    }
    
    var ovalPathLarge: UIBezierPath {
        return UIBezierPath(ovalIn: CGRect(x: 2.5, y: 17.5, width: 95.0, height: 95.0))
    }
    
    var ovalPathSquishVertical: UIBezierPath {
        return UIBezierPath(ovalIn: CGRect(x: 2.5, y: 20.0, width: 95.0, height: 90.0))
    }
    
    
    var ovalPathSquishHorizontal: UIBezierPath {
        return UIBezierPath(ovalIn: CGRect(x: 5.0, y: 20.0, width: 90.0, height: 90.0))
    }
    
    func expand() {
        let expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        expandAnimation.fromValue = ovalPathSmall.cgPath
        expandAnimation.toValue = ovalPathLarge.cgPath
        expandAnimation.duration = animationDuration
        expandAnimation.fillMode = kCAFillModeForwards
        expandAnimation.isRemovedOnCompletion = false
        add(expandAnimation, forKey: nil)
    }
    
    func wobble() {
        let woobleAnimation1: CABasicAnimation = CABasicAnimation(keyPath: "path")
        woobleAnimation1.fromValue = ovalPathLarge.cgPath
        woobleAnimation1.toValue = ovalPathSquishVertical.cgPath
        woobleAnimation1.beginTime = 0.0
        woobleAnimation1.duration = animationDuration
        
        let woobleAnimation2 = CABasicAnimation(keyPath: "path")
        woobleAnimation2.fromValue = ovalPathSquishVertical.cgPath
        woobleAnimation2.toValue = ovalPathSquishHorizontal.cgPath
        woobleAnimation2.beginTime = woobleAnimation1.beginTime + woobleAnimation1.duration
        woobleAnimation2.duration = animationDuration
        
        let woobleAnimation3 = CABasicAnimation(keyPath: "path")
        woobleAnimation3.fromValue = ovalPathSquishHorizontal.cgPath
        woobleAnimation3.toValue = ovalPathSquishVertical.cgPath
        woobleAnimation3.beginTime = woobleAnimation2.beginTime + woobleAnimation2.duration
        woobleAnimation3.duration = animationDuration
        
        let woobleAnimation4 = CABasicAnimation(keyPath: "path")
        woobleAnimation4.fromValue = ovalPathSquishVertical.cgPath
        woobleAnimation4.toValue = ovalPathLarge.cgPath
        woobleAnimation4.beginTime = woobleAnimation3.beginTime + woobleAnimation3.duration
        woobleAnimation4.duration = animationDuration
        
        let woobleGroup: CAAnimationGroup = CAAnimationGroup()
        woobleGroup.animations = [
            woobleAnimation1, woobleAnimation2,
            woobleAnimation3, woobleAnimation4
        ]
        woobleGroup.duration = woobleAnimation4.beginTime + woobleAnimation4.duration
        woobleGroup.repeatCount = 999_999.0
        add(woobleGroup, forKey: nil)
    }
    
    func contract() {
        let contractAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        contractAnimation.fromValue = ovalPathLarge.cgPath
        contractAnimation.toValue = ovalPathSmall.cgPath
        contractAnimation.duration = animationDuration
        contractAnimation.fillMode = kCAFillModeForwards
        contractAnimation.isRemovedOnCompletion = false
        self.add(contractAnimation, forKey: nil)
    }
}
