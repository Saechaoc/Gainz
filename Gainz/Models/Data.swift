//
//  Data.swift
//  Gainz
//
//  Created by Tiffany Ho on 12/17/19.
//  Copyright © 2019 Chris Saechao. All rights reserved.
//

import SwiftUI
import CoreData

//var exerciseData : [Exercise] = FetchJSON().exerciseData

//https://raw.githubusercontent.com/Saechaoc/Gainz/master/Gainz/Resources/deduped.json

//Loading local file
func load(_ filename: String) -> [Exercise] {
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
        let myData =  try decoder.decode([Exercise].self, from: data)
        return myData.sorted(by: {$0.name < $1.name})
    } catch {
        fatalError("Couldn't parse \(filename) as \([Exercise].self):\n\(error)")
    }
}

class FetchJSON: ObservableObject {
    @Published var exerciseData = [Exercise]()
    static var sharedInstance = FetchJSON()
    var context = CoreDataStack.sharedInstance.persistentContainer.viewContext
    
    
    init() {
        guard let url = URL(string: "https://raw.githubusercontent.com/Saechaoc/Gainz/master/Gainz/Resources/deduped.json")
            else {
                return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            do {
                if let fetchData = data {
                    // 3.
                    let decodedData = try JSONDecoder().decode([Exercise].self, from: fetchData)
                    DispatchQueue.main.async {
                        self.exerciseData = decodedData
                    }
                } else {
                    print("No data")
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
    
    func createExerciseEntity(exercise: Exercise) -> NSManagedObject? {
        
        if let exerciseEntity = NSEntityDescription.insertNewObject(forEntityName: "Exercises", into: context) as? Exercises {
            
            exerciseEntity.name = exercise.name
            exerciseEntity.type = exercise.type
            exerciseEntity.muscleUsed = exercise.muscleUsed
            exerciseEntity.equipment = exercise.equipment
            exerciseEntity.level = exercise.level
            exerciseEntity.rating = exercise.rating
            exerciseEntity.muscleChartImg = exercise.muscleChartImg
            exerciseEntity.imgs = exercise.imgs
            exerciseEntity.instructions = exercise.instructions
            
            return exerciseEntity
        }
        
        return nil
    }
    
    func saveToCoreData() {
        for exercise in exerciseData {
            _ = self.createExerciseEntity(exercise: exercise)
        }
        
        do {
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
        print("saved to core data")
    }
}


