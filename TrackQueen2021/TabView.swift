//
//  TabView.swift
//  TrackQueen2021
//
//  Created by John Canelis on 5/5/21.
//

import SwiftUI

struct WabView: View {
    
    //var url: URL!

    var body: some View {
        TabView {
            
            ScrollView {
                
                Text("Welcome")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                    .font(.body)
                    .fontWeight(.regular)
                    .padding(.all, 24.0)
                    .lineSpacing(8.0)
                    .fixedSize(horizontal: false, vertical: true)
                
            }
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
