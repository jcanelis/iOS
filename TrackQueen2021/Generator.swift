//
//  Generator.swift
//  TrackQueen2021
//
//  Created by John Canelis on 5/2/21.
//

import Foundation

class Generator: ObservableObject {
    
    @Published var someVar: String = "This a value provided"
    @Published var server: String = "Ready..."
    
    private func goBig() -> Void {
        print("fire")
    }
    
    func fetchServer() async {
        do {
            let message = try await serverGetter()
            print(message)
            DispatchQueue.main.async {
                self.server = message
            }
        } catch {
            print(error)
        }
    }
    
    func getRandom(update: String) -> Void {
        someVar = update
    }
}
