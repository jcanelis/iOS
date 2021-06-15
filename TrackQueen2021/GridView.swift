//
//  GridView.swift
//  TrackQueen2021
//
//  Created by John Canelis on 5/3/21.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        
        let columns: [GridItem] = Array(repeating: .init(.fixed(48)), count: 8)
        
        ScrollView(.horizontal, showsIndicators: false) {
            LazyVGrid(columns: columns, alignment: .center) {
                ForEach(0..<24) { item in
                    Text("😂").font(.title)
                }
            }
        }
        
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
