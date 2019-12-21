//
//  Data.swift
//  Gainz
//
//  Created by Tiffany Ho on 12/17/19.
//  Copyright © 2019 Chris Saechao. All rights reserved.
//

import SwiftUI
import UIKit

var exerciseData : [ExerciseStruct] = load("exerciseData.json")

func load(_ filename: String) -> [ExerciseStruct] {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        let myData =  try decoder.decode([ExerciseStruct].self, from: data)
        return myData.sorted(by: {$0.name < $1.name})
    } catch {
        fatalError("Couldn't parse \(filename) as \([ExerciseStruct].self):\n\(error)")
    }
}
