//
//  Crazy.swift
//  Crazy
//
//  Created by John Canelis on 9/8/21.
//

import Foundation
import UIKit
import SwiftUI
import Lottie

struct ActivityIndicator: UIViewRepresentable {
    
    let starAnimationView = AnimationView(name: "data")
    
    func makeUIView(context: Context) -> AnimationView {
        let v = starAnimationView
        
        return v
    }

    func updateUIView(_ uiView: AnimationView, context: Context) {
        starAnimationView.play(fromProgress: 0.0, toProgress: 1.0, loopMode: .loop)
    }
}
