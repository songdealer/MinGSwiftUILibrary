//
//  PressableButton.swift
//
//  Created by MinG on 11/7/25.
//  Copyright © 2025 com.MinG.test.MinGSwiftUILibrary. All rights reserved.
//

import SwiftUI

// MARK: - Constant
extension PressableButton {
  enum Constant {
    static let animationAlpha: CGFloat = 0.2
    static let animationDuration: CGFloat = 0.2
  }
}

// MARK: - Core
class PressableButton: UIButton {
  
  private var textColor: UIColor?
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    
    textColor = self.titleColor(for: .normal)
    
    self.setTitleColor(textColor?.withAlphaComponent(Constant.animationAlpha), for: .normal)
    
  }
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    
    let transition = CATransition()
    transition.type = .fade
    transition.duration = Constant.animationDuration
    
    self.layer.add(transition, forKey: kCATransition)
    self.setTitleColor(self.textColor, for: .normal)
 
  }
}
