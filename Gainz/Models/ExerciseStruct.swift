//
//  ExerciseStruct.swift
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
 */

struct ExerciseStruct: Codable, Identifiable {
    var id: Int
    var name: String
    var exerciseType: String
    var description: String
    var mainMuscle: String
    
    var pictureOne: URL
    var pictureTwo: URL
}
