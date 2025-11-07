//
//  UIKitButtonView.swift
//
//  Created by MinG on 11/7/25.
//  Copyright © 2025 com.MinG.test.MinGSwiftUILibrary. All rights reserved.
//

import SwiftUI

/*
 ** SwiftUI는 자체적으로 버튼의 사용성을 올리기 위해 약간의 여백을 만들어 놓는 것으로 판단.
 ** Button, onTapGesture도 모두 동일.
 ** Tap을 UIKit으로 구현하여 정확한 뷰의 경계선으로 이벤트 영역 처리.
 */

// MARK: - Core
struct UIKitButtonView: UIViewRepresentable {
  var title: String
  var onTap: () -> Void = {}
  
  private func uiSetting(context: UIButton) {
    context.setTitle(title, for: .normal)
    context.clipsToBounds = true
  }
  
  func makeUIView(context: Context) -> some UIView {
    let button = PressableButton(type: .custom)
    uiSetting(context: button)
    
    button.addTarget(context.coordinator, action: #selector(Coordinator.touchUpInside), for: .touchUpInside)
    
    return button
  }
  
  func updateUIView(_ uiView: UIViewType, context: Context) {
    guard let button = uiView as? UIButton else { return }
    uiSetting(context: button)
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(coordinatorOnTap: onTap)
  }
  
  class Coordinator {
    var coordinatorOnTap: () -> Void
    
    init(coordinatorOnTap: @escaping () -> Void) {
      self.coordinatorOnTap = coordinatorOnTap
    }
    
    @objc func touchUpInside() {
      coordinatorOnTap()
    }
  }
}

// MARK: - Chaining
extension View where Self == UIKitButtonView {
  func onTap(_ onTap: @escaping () -> Void) -> UIKitButtonView {
    var copy = self
    copy.onTap = onTap
    
    return copy
  }
}
