//
//  TabView.swift
//  TrackQueen2021
//
//  Created by John Canelis on 5/5/21.
//

import SwiftUI

struct WabView: View {
    
    var body: some View {
        TabView {
            WelcomeView()
                .tabItem({
                    Image(systemName: "house")
                    Text("Home")
                })
                .tag(0)
            
            FormView()
                .tabItem({
                    Image(systemName: "slider.horizontal.3")
                    Text("Form")
                })
                .tag(1)
            
            GridView()
                .tabItem({
                    Image(systemName: "rectangle.grid.2x2.fill")
                    Text("Grid")
                })
                .tag(2)
            
            ContentView().environmentObject(Generator())
                .tabItem({
                    Image(systemName: "list.star")
                    Text("Grid")
                })
                .tag(3)
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        WabView()
    }
}
