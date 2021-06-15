//
//  TabView.swift
//  TrackQueen2021
//
//  Created by John Canelis on 5/5/21.
//

import SwiftUI

struct FormView: View {
    
    @State var isShowing: Bool = true
    @State private var fullText: String = "This is some editable text..."
    
    var body: some View {
        Form {
            Section {
                TextEditor(text: $fullText)
            }
            
            Section {
                Toggle(isOn: $isShowing) {
                    Text("Hello World")
                }
            }
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
