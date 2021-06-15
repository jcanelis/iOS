//
//  Placeholder.swift
//  TrackQueen2021
//
//  Created by John Canelis on 4/16/21.
//

import SwiftUI

struct Post: Codable, Identifiable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

class Api {
    func getPosts(completion: @escaping ([Post]) -> ()) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
}

struct Data_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
