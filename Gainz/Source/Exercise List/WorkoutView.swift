//
//  WorkoutView.swift
//  Gainz
//
//  Created by Chris on 3/17/20.
//  Copyright © 2020 Chris Saechao. All rights reserved.
//

import SwiftUI

struct WorkoutView: View {
    @State private var searchText = ""
//    @FetchRequest(entity: Exercise.entity(), sortDescriptors: <#T##[NSSortDescriptor]#>)
    
    func addItem() {
        exerciseData.append(Exercise(name: "1 Exercise", type: "test", muscleUsed: "Test", equipment: "Test", level: "Test", rating: "1.0", imgs:["https://www.bodybuilding.com/images/2020/xdb/originals/xdb-129s-landmine-twist-m1-16x9.jpg","https://www.bodybuilding.com/images/2020/xdb/originals/xdb-129s-landmine-twist-m3-16x9.jpg"], muscleChartImg: "Test.com", instructions: ["Instructions"]))
    }
    
    var body: some View {
        
        NavigationView {
            List(exerciseData) { exercise in
                NavigationLink(destination: exerciseDetails(exercise: exercise)) {
                    exerciseRow(exercise:exercise)
                }
            }
            .navigationBarTitle(Text("Exercises"))
        }.onAppear {
            self.addItem()
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
