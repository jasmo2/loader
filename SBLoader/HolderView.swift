//
//  HolderView.swift
//  SBLoader
//
//  Created by Satraj Bambra on 2015-03-17.
//  Copyright (c) 2015 Satraj Bambra. All rights reserved.
//

import UIKit

protocol HolderViewDelegate:class {
  func animateLabel()
}

class HolderView: UIView {
    let ovalLayer = OvalLayer()
    let triangleLayer = TriangleLayer()
    var parentFrame :CGRect = CGRect.zero
    weak var delegate:HolderViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//
//    required init(coder: NSCoder) {
//        super.init(coder: coder)!
//    }
    
    func addLabel() {
        delegate?.animateLabel()
    }
    
    func addOval() {
        layer.addSublayer(ovalLayer)
        ovalLayer.expand()
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(HolderView.wooble), userInfo: nil, repeats: false)
    }
    
    
    func drawAnimatedTriagle() {
        triangleLayer.animate()
        Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(HolderView.spinAndTransform), userInfo: nil, repeats: false)
    }
    
    func expandView() {
        self.backgroundColor = Colors.red
        //    public init(origin: CGPoint, size: CGSize)

        frame = CGRect(
            origin: CGPoint(x: frame.origin.x, y: frame.origin.y),
            size: CGSize(width: frame.width , height: frame.height)
        )
        layer.sublayers = nil
        
        UIView.animate(
            withDuration: 0.3, delay: 0.0,
            options: UIViewAnimationOptions.curveEaseInOut,
            animations: {
                self.frame = self.parentFrame
            },
            completion: { finished in
                self.addLabel()
            }
        )
    }
    
    func spinAndTransform()  {
        layer.anchorPoint = CGPoint(x: 0.5 , y: 0.6)
        
        let rotationAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = M_PI * 2.0
        rotationAnimation.duration = 0.5
        rotationAnimation.isRemovedOnCompletion = false
        layer.add(rotationAnimation, forKey: nil)
        
        ovalLayer.contract()
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(HolderView.expandView), userInfo: nil, repeats: false)
        
    }
    
    func wooble()  {
        layer.addSublayer(triangleLayer)
        ovalLayer.wobble()
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(HolderView.drawAnimatedTriagle), userInfo: nil, repeats: false)
    }
}
