//
//  Toast.swift
//  Toast
//
//  Created by Amir on 09/08/2018.
//  Copyright © 2018 Muhammad Aamir. All rights reserved.
//

import Foundation
import UIKit

public enum ToastError: Error {
  case missingParameters
  case windowNotLoaded
}

public class ToastView: UIView {
  
  let pendingQueue = PriorityQueue()
  
  //MARK: Initializing
  public override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required public convenience init?(coder aDecoder: NSCoder) {
    //fatalError("init(coder:) has not been implemented")
    self.init()
  }
  
  private func toastViewForMessage(_ message:String, style:ToastStyle) throws -> ToastView {
    
    let wrapperView = ToastView()
    wrapperView.backgroundColor = style.backgroundColor
    wrapperView.layer.cornerRadius = style.cornerRadius
    wrapperView.layer.shadowColor = style.shadowColor
    wrapperView.layer.shadowOpacity = style.shadowOpacity
    wrapperView.layer.shadowRadius = style.shadowRadius
    wrapperView.layer.shadowOffset = style.shadowOffset
    wrapperView.translatesAutoresizingMaskIntoConstraints = false

    let messageLabel = UILabel()
    messageLabel.adjustsFontSizeToFitWidth = true
    messageLabel.numberOfLines = 0
    messageLabel.textColor = .white
    messageLabel.backgroundColor = UIColor.clear
    messageLabel.textAlignment = .center
    messageLabel.text = message
    
    //throw an error in case message is emtpy
    if message.isEmpty {
      throw ToastError.missingParameters
    }
    
    wrapperView.addSubview(messageLabel)
    setupLabelLayout(messageLabel, wrapperView)

    return wrapperView
  }
  
  public func setupViewLayout(_ toast:UIView, _ superView: UIView, _ position:ToastPosition) {
    switch position {
    case .center:
      toast.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
      toast.centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
    case .bottom:
      toast.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
      toast.bottomAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.bottomAnchor, constant: -64).isActive = true
    case .top:
      toast.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
      toast.topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor, constant: 64).isActive = true
    }
    
    let trailingConstraint = toast.leftAnchor.constraint(lessThanOrEqualTo: superView.leftAnchor, constant: 16)
    trailingConstraint.priority = UILayoutPriority(250.0) //low priority
    trailingConstraint.isActive = true
    toast.rightAnchor.constraint(lessThanOrEqualTo: superView.rightAnchor, constant: -16).isActive = true
  }

  private func setupLabelLayout(_ messageLabel:UILabel, _ wrapperView: UIView) {
    messageLabel.translatesAutoresizingMaskIntoConstraints = false
    messageLabel.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor).isActive = true
    messageLabel.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor).isActive = true
    messageLabel.leftAnchor.constraint(equalTo: wrapperView.leftAnchor, constant: 8).isActive = true
    messageLabel.rightAnchor.constraint(equalTo: wrapperView.rightAnchor, constant: -8).isActive = true
    wrapperView.heightAnchor.constraint(equalTo: messageLabel.heightAnchor, constant: 16).isActive = true
    wrapperView.widthAnchor.constraint(equalTo: messageLabel.widthAnchor, constant: 16).isActive = true
  }
  
  public func makeToast(forToast message:String, duration:TimeInterval, position:ToastPosition, style:ToastStyle) {
    do {
      let toastview = try toastViewForMessage(message, style: style)
      let operation = Toast(view: toastview, duration:duration, position: position)
      pendingQueue.queue.addOperation(operation)
      
    } catch ToastError.missingParameters {
      print("Error: message is nil")
    } catch {
      print("general exception")
    }
  }
  
}


public class ToastManager {
  public static let toast = ToastView()

  public static let LENGHT_SHORT: TimeInterval = 3.0
  public static let LENGHT_LONG: TimeInterval = 5.0
  
  public static func showToast(_ message:String, duration:TimeInterval = ToastManager.LENGHT_SHORT, position:ToastPosition = .bottom, style:ToastStyle = ToastStyle()) {
    toast.makeToast(forToast: message, duration: duration, position: position, style: style)
  }
  
}

public struct ToastStyle {

  public init() {}
  public var backgroundColor = UIColor.black.withAlphaComponent(0.6)
  public var cornerRadius:CGFloat = 6.0
  public var shadowOpacity:Float = 0.6
  public var shadowColor:CGColor = UIColor.black.cgColor
  public var shadowOffset:CGSize = CGSize(width: 2.0, height: 2.0)
  public var shadowRadius:CGFloat = 3.0
  public var textColor = UIColor.white
  
}

public enum ToastPosition {
  case top
  case center
  case bottom
}

