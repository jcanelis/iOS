//
//  TabView.swift
//  TrackQueen2021
//
//  Created by John Canelis on 5/5/21.
//

import SwiftUI

struct WabView: View {
    
    var url: URL!

    var body: some View {
        TabView {
            ScrollView { Image(systemName: "play.rectangle") }
                .tabItem({
                    Image(systemName: "play.rectangle")
                    Text("Images")
                })
                .tag(0)
            
            FormView()
                .tabItem({
                    Image(systemName: "slider.horizontal.3")
                    Text("Form")
                })
                .tag(1)
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
       WabView()
    }
}
