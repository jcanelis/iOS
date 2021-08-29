//
//  DetailView.swift
//  TrackQueen2021
//
//  Created by John Canelis on 4/25/21.
//

import SwiftUI
import Contentful

struct DetailView: View {
    
    var item: Product!
    
    init(item: Product) {
        self.item = item
    }
    
    @State private var progress: Double = 1.0
    @State private var isHidden: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                TabView {
                    ForEach(item.photos!, id: \.self) { result in
                        AsyncImage(url: result.url!) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray
                        }
                    }
                }
                .frame(height: 432.0)
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .tabViewStyle(PageTabViewStyle())
                
                Text("This is regular text.")
                Text("* This is **bold** text, this is *italic* text.")
                Text("~~A strikethrough example~~")
                Text("`Monospaced works too`")
                Text("Visit Apple: [click here](https://apple.com)")
                
                Text("\(item.price!)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("\(item.id)")
                    .font(.subheadline)
                    .foregroundColor(Color.black)
                    .lineLimit(1)
                    .padding(.all, 4.0)
                
                Text(item.description!)
                    .font(.body)
                    .fontWeight(.regular)
                    .padding(.all, 24.0)
                    .lineSpacing(8.0)
                    .fixedSize(horizontal: false, vertical: true)
                
                if !isHidden {
                    VStack {
                        Button(action: { print("hi") }) {
                            Text("Add to cart")
                                .frame(maxWidth: 380)
                        }
                        .buttonStyle(.bordered)
                        .tint(.accentColor)
                        .controlSize(.large)
                        .frame(maxWidth: 380)
                        
                        Button(action: { print("hi") }) {
                            Text("Save")
                                .frame(maxWidth: 380)
                        }
                        .buttonStyle(.bordered)
                        .tint(.accentColor)
                        .controlSize(.large)
                        .frame(maxWidth: 380)
                        
                        ProgressView(value: progress)
                            .scaleEffect(1.5, anchor: .center)
                            .progressViewStyle(CircularProgressViewStyle())
                    }
                }
            }
        }
        .onAppear {
            print("showed up!")
        }
        .navigationBarTitle(Text(item.title!))
    }
}
