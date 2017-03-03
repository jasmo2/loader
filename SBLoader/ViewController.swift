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
    view.addSubview(holderView)
  }
  
  func animateLabel() {

  }
  
  func addButton() {
    let button = UIButton()
    button.frame = CGRect(x: 0.0, y: 0.0, width: view.bounds.width, height: view.bounds.height)
    button.addTarget(self, action: #selector(ViewController.buttonPressed(_:)), for: .touchUpInside)
    view.addSubview(button)
  }
  
  func buttonPressed(_ sender: UIButton!) {
    view.backgroundColor = Colors.white
    view.subviews.map({ $0.removeFromSuperview() })
    holderView = HolderView(frame: CGRect.zero)
    addHolderView()
  }
}

