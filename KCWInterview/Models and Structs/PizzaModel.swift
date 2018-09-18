//
//  PizzaModel.swift
//  KCWInterview
//
//  Created by Kerry Washington on 8/29/18.
//  Copyright © 2018 kerrywashington. All rights reserved.
//

import UIKit

struct PizzaModel : Decodable {
    
    let id : Int
    let name : String
    let price : Float
    let menuAssetId: Int
    let menuDescription : String
    let vegetarian : Int?
    let spicy : Int?
    let classifications : [String:Bool]?
    let toppings : [Topping]
    let menuAsset : MenuAsset
    let menuBadge : MenuBadge?
    let availability : Availability?
    
    enum CodingKeys : String, CodingKey {
        
        case id
        case name
        case price
        case menuAssetId = "menu_asset_id"
        case menuDescription = "menu_description"
        case vegetarian
        case spicy
        case classifications
        case toppings
        case toppingDescription
        case menuAsset
        case menuBadge
        case availability
    }
    
    init(from decoder: Decoder) throws {
        
        let values =  try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        let priceString = try values.decode(String.self, forKey: .price)
        price = Float(priceString)!
//        let waitTimeString = try container.decode(String.self, forKey: .waitTime)
//        let waitTime = Float(waitTimeString)!
        menuAssetId = try values.decode(Int.self, forKey: .menuAssetId)
        menuDescription = try values.decode(String.self, forKey: .menuDescription)
        vegetarian = try values.decodeIfPresent(Int.self, forKey: .vegetarian)
        spicy = try values.decodeIfPresent(Int.self, forKey: .spicy)
        classifications = try values.decodeIfPresent([String:Bool].self, forKey: .classifications)
        toppings = try values.decode([Topping].self, forKey: .toppings)
        menuAsset = try values.decode(MenuAsset.self, forKey: .menuAsset)
        menuBadge = try values.decodeIfPresent(MenuBadge.self, forKey: .menuBadge)
        availability = try values.decodeIfPresent(Availability.self, forKey: .availability)
     }
}


struct Classification : Codable {
    
    let vegetarian : Bool?
    let spicy : Bool?
    
    enum CodingKeys : String, CodingKey {
        case vegetarian
        case spicy
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        vegetarian = try values.decodeIfPresent(Bool.self, forKey: .vegetarian)
        spicy = try values.decodeIfPresent(Bool.self, forKey: .spicy)
    }
}



struct Topping : Decodable {
    
    let id : Int
    let name : String
    let type : String
    let assetId : Int
    let station : Int
    let description : String?
    let asset : Asset
    
    enum CodingKeys : String, CodingKey {
        case id
        case name
        case type
        case assetId = "asset_id"
        case station
        case description
        case asset
    }
    
    init(from decoder: Decoder) throws {
        let values =  try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        type = try values.decode(String.self, forKey: .type)
        assetId = try values.decode(Int.self, forKey: .assetId)
        station = try values.decode(Int.self, forKey: .station)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        asset = try values.decode(Asset.self, forKey: .asset)
    }
}

struct MenuAsset :Decodable {
    
    let id : Int
    let url : URL
    
    enum CodingKeys : String, CodingKey {
        case id
        case url
    }
    
    init(from decoder: Decoder) throws {
        let values =  try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        url = try values.decode(URL.self, forKey: .url)
    }
}

struct Asset : Decodable {
    let id : Int
    let url : URL
    
    enum CodingKeys : String, CodingKey {
        case id
        case url
    }
    
    init(from decoder: Decoder) throws {
        let values =  try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        url = try values.decode(URL.self, forKey: .url)
    }
}

struct MenuBadge : Decodable {
    let transformable : Any
    
    enum CodingKeys : String, CodingKey {
        case transformable
    }
    
    init(from decoder: Decoder) throws {
        let values =  try decoder.container(keyedBy: CodingKeys.self)
        transformable = try values.decodeIfPresent(String.self, forKey: .transformable) ?? "NaN"
    }
}

struct Availability : Decodable {
    let isLimited : Bool?
    let quantity : Int?
    
    enum CodingKeys : String, CodingKey {
        case isLimited
        case quantity
    }
    
    init(from decoder: Decoder) throws {
        let values =  try decoder.container(keyedBy: CodingKeys.self)
        isLimited = try values.decodeIfPresent(Bool.self, forKey: .isLimited)
        quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
    }
}


 




