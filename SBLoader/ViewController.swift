//
//  ViewController.swift
//  SBLoader
//
//  Created by Satraj Bambra on 2015-03-16.
//  Copyright (c) 2015 Satraj Bambra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HolderViewDelegate {
  
  var holderView = HolderView(frame: CGRect.zero)
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    addHolderView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func addHolderView() {
    let boxSize: CGFloat = 100.0
    holderView.frame = CGRect(x: view.bounds.width / 2 - boxSize / 2,
                              y: view.bounds.height / 2 - boxSize / 2,
                              width: boxSize,
                              height: boxSize)
    holderView.parentFrame = view.frame
    holderView.delegate = self
//    holderView.backgroundColor = UIColor(red: 0.0, green: 255.0, blue: 0.0, alpha: 1.0)
    view.addSubview(holderView)
    holderView.addOval()
  }
  
  func animateLabel() {
    holderView.removeFromSuperview()
    view.backgroundColor = Colors.red
    
    // 2
    let label: UILabel = UILabel(frame: view.frame)
    label.textColor = Colors.black
    label.font = UIFont(name: "HelveticaNeue-Thin", size: 170.0)
    label.textAlignment = NSTextAlignment.center
    label.text = "S"
    label.transform = label.transform.scaledBy(x: 0.25, y: 0.25)
    view.addSubview(label)
    
    // 3
    UIView.animate(
        withDuration: 0.4, delay: 0.0,
        usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1,
        options: UIViewAnimationOptions.curveEaseInOut,
        animations: ({
            label.transform = label.transform.scaledBy(x: 4.0, y: 4.0)
        }),
        completion: nil
    )
  }
  
}

