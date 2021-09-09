//
//  WelcomeView.swift
//  WelcomeView
//
//  Created by John Canelis on 8/29/21.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                        .font(.body)
                        .fontWeight(.regular)
                        .padding(.all, 24.0)
                        .lineSpacing(8.0)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    ActivityIndicator()
                }
            }
            .navigationBarTitle("Welcome")
        }
        .onAppear {
            print("showed up!")
        }
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
