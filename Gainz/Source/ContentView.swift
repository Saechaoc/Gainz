//
//  ContentView.swift
//  Gainz
//
//  Created by Tiffany Ho on 12/16/19.
//  Copyright © 2019 Chris Saechao. All rights reserved.
//

/*
 To Do:
 Create search by functionality: All Exercises (Ordered), By Muscle, Category
 */

import SwiftUI
import Combine

struct ContentView: View {
    @State var selected = 0
    
    var body: some View {
        TabView(selection: $selected){
            GoalsView().tabItem {
                VStack {
                    Image("star")
                    Text("Goals")
                }
            }.tag(0)
            
            RoutineView().tabItem {
                VStack {
                    Image("routine")
                    Text("Routines")
                }
            }.tag(1)
            
            WorkoutView().tabItem {
                VStack {
                    Image("heart")
                    Text("Workout")
                }
            }.tag(2)
            
            ProgressView().tabItem {
                VStack {
                    Image("progress")
                    Text("Progress")
                }
            }.tag(3)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
