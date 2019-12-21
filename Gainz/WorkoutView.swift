//
//  WorkoutView.swift
//  Gainz
//
//  Created by Tiffany Ho on 12/20/19.
//  Copyright © 2019 Chris Saechao. All rights reserved.
//

import SwiftUI

struct WorkoutView: View {
    var body: some View {
        NavigationView {
            List(exerciseData) { exercise in
                NavigationLink(destination: exerciseDetails(exercise: exercise)) {
                    exerciseRow(exercise:exercise)
                }
            }
            .navigationBarTitle(Text("Exercises"))
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
