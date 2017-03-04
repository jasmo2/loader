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
    
    func addOval() {
        layer.addSublayer(ovalLayer)
        ovalLayer.expand()
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(HolderView.wooble), userInfo: nil, repeats: false)
    }
    
    func wooble()  {
        ovalLayer.wobble()
    }
}
