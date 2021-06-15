//
//  Products.swift
//  TrackQueen2021
//
//  Created by John Canelis on 4/16/21.
//

import SwiftUI
import Contentful

let contentTypeClasses: [EntryDecodable.Type] = [
    Product.self
]

let client = Client(spaceId: ProcessInfo.processInfo.environment["contentful_space_id"]!,
                    environmentId: "master",
                    accessToken: ProcessInfo.processInfo.environment["contentful_api_key"]!,
                    contentTypeClasses: contentTypeClasses)

final class Product: EntryDecodable, FieldKeysQueryable {
    
    static let contentTypeId: String = "product"
    
    let id: String
    let localeCode: String?
    let updatedAt: Date?
    let createdAt: Date?

    let title: String?
    let price: Int?

    public required init(from decoder: Decoder) throws {
        let sys         = try decoder.sys()
        id              = sys.id
        localeCode      = sys.locale
        updatedAt       = sys.updatedAt
        createdAt       = sys.createdAt

        let fields      = try decoder.contentfulFieldsContainer(keyedBy: Product.FieldKeys.self)
        self.title      = try fields.decodeIfPresent(String.self, forKey: .title)
        self.price      = try fields.decodeIfPresent(Int.self, forKey: .price)
    }

    enum FieldKeys: String, CodingKey {
        case title, price
    }
}

class Donkey {
    func getProducts() {
        client.fetchArray(of: Product.self) { (result: Result<HomogeneousArrayResponse<Product>, Error>) in
            switch result {
                case .success(let productsResponse):
                    guard let product = productsResponse.items.first else { return }
                    print(product)
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func getPoops() -> String {
        let dat: String = "cooool"
        return dat
    }
    
    func getNuts() {
        client.fetch(Asset.self, id: "kSbdpKtk27WcksWdqoOET") { (result: Result<Asset, Error>) in
            switch result {
                case .success(let asset):
                    guard let butts = asset.file?.url else { return }
                    print(butts.absoluteString)
                case .failure(let error):
                    print("Error \(error)!")
            }
        }
    }
    
    func getCake() {
        client.fetch(Entry.self, id: "4nkTIB4roIryyaAxaW1n2B") { (result: Result<Entry, Error>) in
            switch result {
            case .success(let entry):
                print(entry.fields)
            case .failure(let error):
                print("Error \(error)!")
            }
        }
    }
}
