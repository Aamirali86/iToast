//
//  ViewController.swift
//  Toast
//
//  Created by Amir on 12/04/2018.
//  Copyright © 2018 Muhammad Aamir. All rights reserved.
//
  
import UIKit
import SmartToast

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  
  @IBAction func shortLenghtBottomToast(_ sender: UIButton) {
    ToastManager.shared.showToast((sender.titleLabel?.text)!)
  }
  
  @IBAction func shortLenghtCenterToast(_ sender: UIButton) {
    ToastManager.shared.showToast((sender.titleLabel?.text)!, position: .center)
  }
  
  @IBAction func longLenghtTopToast(_ sender: UIButton) {
    ToastManager.shared.showToast("Hello world", duration: ToastManager.LENGHT_LONG, position: .top)
  }
  
  @IBAction func customStyleToast(_ sender: UIButton) {
    ToastManager.shared.showToast((sender.titleLabel?.text)!, style:customizeAppearance())
  }
  
  private func customizeAppearance() -> ToastStyle {
    var style = ToastStyle()
    style.backgroundColor = UIColor.red.withAlphaComponent(0.8)
    return style
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}

