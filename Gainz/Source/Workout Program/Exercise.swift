//
//  Exercise.swift
//  Gainz
//
//  Created by Tiffany Ho on 12/17/19.
//  Copyright © 2019 Chris Saechao. All rights reserved.
//

import SwiftUI

//Codable = Decodable & Encodable

/* Represents the object containing keys in the JSON file
 At the moment it's just a list of workouts, but in reality some workouts are children of a primary workout
 
 Ex: Bench Press is the parent, and Bench Press with Bands is a child.
 This is potentially important, because when we look at the bench, do we care about total load for each workout or just bench?
 Ie. You workout one day doing 135 bench press with 45 lb Chains when looking at the data,
        should we compare this to your total bench or that workout itself?
 
 When using values, Equatable and Hashable is probably the way to go in terms of identity - since you are more comparing a normalized representation of a value, rather than a unique instance. However, when dealing with objects, using some of the techniques from this post can make your APIs easier to use, and in result decrease complexity and increase stability.

 Instead of requiring implementors to conform to Equatable, or exposing some form of unique identifier (like a UUID), you can use techniques like the === operator and the ObjectIdentifier type to quickly and uniquely identify objects without much extra code.
 */

struct Exercise: Codable {
    let name: String
    var type: String
    var muscleUsed: String
    var equipment: String?
    var level: String
    var rating: String
    
    var imgs: [String]
    var muscleChartImg: String
    var instructions: [String]
//    var weight: Double?
//    var reps: Int?
//    var RPE: Int?
    
//    enum CodingKeys: String, CodingKey, Hashable {
//        case id = "name"
//        case type = "type"
//        case muscleUsed = "muscleUsed"
//        case equipment = "equipment"
//        case level = "level"
//        case rating = "rating"
//        case imgs = "imgs"
//        case muscleChartImg = "muscleChartImg"
//        case instructions = "instructions"
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        name = try container.decode(String.self, forKey: .id)
//        type = try container.decode(String.self, forKey: .type)
//        muscleUsed = try container.decode(String.self, forKey: .muscleUsed)
//        equipment = try container.decode(String.self, forKey:.equipment)
//
//        level = try container.decode(String.self, forKey: .level)
//        rating = try container.decode(String.self, forKey: .rating)
//        imgs = try container.decode([URL].self, forKey: .imgs)
//        muscleChartImg = try container.decode(URL.self, forKey: .muscleChartImg)
//        instructions = try container.decode([String].self, forKey: .instructions)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        do {
//            try container.encode(name, forKey: .id)
//            try container.encode(type, forKey: .type)
//            try container.encode(muscleUsed, forKey: .muscleUsed)
//            try container.encode(equipment, forKey: .equipment)
//            try container.encode(level, forKey: .level)
//            try container.encode(rating, forKey: .rating)
//            try container.encode(imgs, forKey: .imgs)
//            try container.encode(muscleChartImg, forKey: .muscleChartImg)
//            try container.encode(instructions, forKey: .instructions)
//        } catch {
//            //What should I do in the case of encoding doesn't work?
//            print("Could not encode object")
//        }
//    }
}


extension Exercise: Identifiable {
    var id: String { name }
}
