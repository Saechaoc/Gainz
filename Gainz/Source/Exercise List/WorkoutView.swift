//
//  WorkoutView.swift
//  Gainz
//
//  Created by Chris on 3/17/20.
//  Copyright © 2020 Chris Saechao. All rights reserved.
//

import SwiftUI
import CoreData

struct WorkoutView: View {
    //@FetchRequest(entity: Exercises.entity(), sortDescriptors: []) var exerciseData: FetchedResults<Exercises>
    @State private var searchText = ""
    var fetched = FetchJSON()
    @Environment(\.managedObjectContext) var context
    
    func createExerciseEntity(exercise: Exercise) -> NSManagedObject? {
        
        if let exerciseEntity = NSEntityDescription.insertNewObject(forEntityName: "Exercises", into: self.context) as? Exercises {
            
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
        for exercise in fetched.exerciseData {
            _ = self.createExerciseEntity(exercise: exercise)
        }
        
        do {
            try self.context.save()
        } catch let error {
            print(error.localizedDescription)
        }
        print("saved to core data")
    }
    
    var body: some View {
//        Text("Test")
        NavigationView {
            List(fetched.exerciseData, id: \.self) { exercise in

                NavigationLink(destination: exerciseDetails(exercise: exercise)) {
                    exerciseRow(exercise:exercise)
                }
            }
            .navigationBarTitle(Text("Exercises"))
        }.onAppear(perform: self.saveToCoreData)
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
