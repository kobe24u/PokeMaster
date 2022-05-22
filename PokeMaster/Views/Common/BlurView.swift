//
//  BlurView.swift
//  PokeMaster
//
//  Created by Vinnie Liu on 15/5/2022.
//  Copyright © 2022 Vinnie Pty Ltd. All rights reserved.
//

import SwiftUI
import UIKit

struct BlurView: UIViewRepresentable {
  let style: UIBlurEffect.Style

  init(style: UIBlurEffect.Style) {
    self.style = style
  }
  
  func makeUIView(context: Context) -> UIVisualEffectView {
    return UIVisualEffectView(effect: UIBlurEffect(style: style))
  }
  func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
    uiView.effect = UIBlurEffect(style: style)
  }
}


extension View {
  func blurBackground(style: UIBlurEffect.Style) -> some View {
    ZStack {
      BlurView(style: style)
      self
    }
  }
}
