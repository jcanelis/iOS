//
//  ContentView.swift
//  TrackQueen2021
//
//  Created by John Canelis on 4/13/21.
//

import SwiftUI
import Contentful

struct ContentView: View {
    
    @State private var searchText: String = ""
    @State var showingModal: Bool = false
    @State var confirmDialog: Bool = false
    @State var date: Date = Date.now
    @StateObject var products = GetProducts()
    @StateObject var server = Generator()
    @EnvironmentObject var something: Generator
    
    private var searchResults: [Product] {
        if searchText.isEmpty {
            return products.products
        } else {
            return products.products.filter {
                $0.title!.contains(searchText)
            }
        }
    }
    
    var dateString: AttributedString {
        let str = date.formatted(.dateTime
                                    .minute()
                                    .hour()
                                    .weekday()
                                    .attributed)
        return str
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(searchResults) { result in
                    NavigationLink(destination: DetailView(item: result)) {
                        HStack {
                            AsyncImage(url: result.photos![0].url!) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Color("Grey")
                            }
                        }
                        .frame(width: 48, height: 48)
                        .mask(RoundedRectangle(cornerRadius: 16))
                        .padding(.trailing, 8.0)
                        
                        Text("\(result.title!)")
                            .badge("\(result.price!)")
                    }
                }
            }
            .refreshable {
                await server.fetchServer()
                products.getProducts()
                date = Date.now
            }
            .task {
                products.getProducts()
                date = Date.now
            }
            .listStyle(SidebarListStyle())
            .swipeActions(allowsFullSwipe: false) {
                Button {
                    print("wow wow")
                } label: {
                    Label("Mute", systemImage: "bell.slash.fill")
                }.tint(.indigo)
            }
            .sheet(isPresented: $showingModal) {
                
                Link(destination: URL(string: "https://us-central1-trackqueen2020-37135.cloudfunctions.net/spotifyLoginiOS")!,
                     label: { Text("Link") })
                
                Button("give it a shot") {
                    print("wow")
                    confirmDialog = true
                }
                .confirmationDialog("Select a color", isPresented: $confirmDialog) {
                    Button("Red", role: .destructive) {
                        print("wow")
                    }
                    
                    Button("Green") {
                        print("wow")
                    }
                }
                
                Menu("Choose option") {
                    Button("Order now", action: { print("hi") })
                    Button("Order later", action: { print("hi") })
                    Button("Order ya face", action: { print("hi") })
                } primaryAction: {
                    print("nice")
                }
                
                Text("hellow world")
                    .padding(.all, 24.0)
                    .background(.thickMaterial)
                    .foregroundColor(Color.red)
                Text("\(server.server)")
                Text("\(something.someVar)")
                Text("Some random text redacted.")
                    .redacted(reason: .placeholder)
                    .padding(24)
            }
            .navigationBarItems(leading: Image(systemName: "square.and.arrow.up").imageScale(.large).onTapGesture { showingModal.toggle() })
            .navigationBarTitle(Text("Content"))
            .onAppear {
                products.getProducts()
            }
        }
        .searchable(text: $searchText)
        .onSubmit(of: .search) {
            print(searchText)
        }
    }
}

struct Token: Decodable {
    var name: String
    var iat: Int
}

struct Hashy: Decodable {
    var hash: String
    var token: Token
}

func serverGetter() async throws -> String {
    
    enum Fail: Error {
        case badGood, badBad
    }

    do {
        guard let url = URL(string: "https://us-central1-futurejohn.cloudfunctions.net/hashmaker-makeHash") else { throw Fail.badGood }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw Fail.badGood }
        
        let jsonData = try? JSONDecoder().decode(Hashy.self, from: data)
        
        return jsonData!.hash
    } catch {
        print("oops")
        return "error"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Generator())
    }
}
