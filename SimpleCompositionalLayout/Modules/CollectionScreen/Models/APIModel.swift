//
//  APIModel.swift
//  SimpleCompositionalLayout
//
//  Created by EDUARD Latynsky on 17.06.2022.
//

import Foundation

struct Sections: Decodable {
    let sections: [APIModel]
    
    static let items1: [Item] = [
    Item(title: "Item1", image: [ImageModel(imageString: "Loskov1")]),
    Item(title: "Item111", image: [ImageModel(imageString: "Loskov2")]),
    Item(title: "Item1111", image: [ImageModel(imageString: "Loskov3")]),
    Item(title: "Item111112", image: [ImageModel(imageString: "Loskov4")]),
    Item(title: "Item1111122", image: [ImageModel(imageString: "Loskov5")]),
    Item(title: "Item11111222", image: [ImageModel(imageString: "Loskov6")]),
    Item(title: "Item11111222", image: [ImageModel(imageString: "Loskov7")])
    ]
    
    static let items2: [Item] = [
    Item(title: "items2", image: [ImageModel(imageString: "Loskov11")]),
    Item(title: "items222", image: [ImageModel(imageString: "Loskov22")]),
    Item(title: "items2222", image: [ImageModel(imageString: "Loskov223")]),
    Item(title: "items22222", image: [ImageModel(imageString: "Loskov223")])
    ]
    
    static let items3: [Item] = [
    Item(title: "items33", image: [ImageModel(imageString: "Loskov33")]),
    Item(title: "items3333", image: [ImageModel(imageString: "Loskov3333")]),
    Item(title: "items33333", image: [ImageModel(imageString: "Loskov3333")]),
    Item(title: "items333333", image: [ImageModel(imageString: "Loskov33333")])
    ]
    
    static let items4: [Item] = [
    Item(title: "items44", image: [ImageModel(imageString: "Loskov444")]),
    Item(title: "items4444", image: [ImageModel(imageString: "Loskov44444")]),
    Item(title: "items444", image: [ImageModel(imageString: "Loskov44")]),
    ]
}

struct APIModel: Decodable, Hashable {
//    var id = UUID()
    let header: String
    let items: [Itemm]
//
}

struct Item: Decodable, Hashable {
//    var id = UUID()
    let title: String
    let image: [ImageModel]
}

struct ImageModel: Decodable, Hashable {
    let imageString: String
}

struct ImageModell: Decodable, Hashable {
    let x1: String
    let x2: String
    let x3: String
    
    enum CodingKeys: String, CodingKey {
        case x1 = "1x"
        case x2 = "2x"
        case x3 = "3x"
    }
}

struct Itemm: Decodable, Hashable {
    let title: String
    let image: ImageModell
    let id: String
}








