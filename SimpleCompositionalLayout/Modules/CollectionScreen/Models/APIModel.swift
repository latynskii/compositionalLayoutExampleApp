//
//  APIModel.swift
//  SimpleCompositionalLayout
//
//  Created by EDUARD Latynsky on 17.06.2022.
//

import Foundation

struct Sections: Decodable {
    let sections: [APIModel]
}

struct APIModel: Decodable, Hashable {
    let header: String
    let items: [ItemModel]
}

struct ImageModel: Decodable, Hashable {
    let x1: String
    let x2: String
    let x3: String
    
    enum CodingKeys: String, CodingKey {
        case x1 = "1x"
        case x2 = "2x"
        case x3 = "3x"
    }
}

struct ItemModel: Decodable, Hashable {
    let title: String
    let image: ImageModel
    let id: String
}








