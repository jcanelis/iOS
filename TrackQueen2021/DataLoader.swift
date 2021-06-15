//
//  DataLoader.swift
//  TrackQueen2021
//
//  Created by John Canelis on 6/15/21.
//

import Foundation

class DataLoader: ObservableObject {
    
    @Published var downloadedData: Data?
    
    func downloadData(url: URL) {
        URLSession.shared.dataTask(with: url)  { data, _, error in
            
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                self.downloadedData = data
            }
            
        }.resume()
    }
}

