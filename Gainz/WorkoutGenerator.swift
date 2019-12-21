//
//  WorkoutGenerator.swift
//  Gainz
//
//  Created by Tiffany Ho on 12/20/19.
//  Copyright © 2019 Chris Saechao. All rights reserved.
//

import Foundation

class WorkoutGenerator {
    
    /*
        To Do: Generate a workout based on recovery stats & gym settings
     */
    
    //To Do: Generate a workout based on muscle groups selected - P0 Requirement
    
    //To Do: Create a custom workout from user - P0 Requirement
    
    //To Do: Create predefined splits - P0 Requirement
    
    //To Do: Create a recovery schedule - P1/2 priority
    
}


//The workout styles will determine what types of splits & workouts are used
// Ex: Bodybuilding will focus on full rep range & submaximal loads
//      Strongman lifting will be periodized and focus on getting better at event lifting through volume
//      PowerBuilding will focus on 6-8 rep range etc...
enum workoutStyles : String {
    case bodyBuilding
    case powerLifting
    case powerBuilding
    case strongMan
    case weekendWarrior //Balance between rehabilitative work, PB, and BB
    case tooDamnBusy    //Focus is on quick full body workouts
    case sovietTraining
}


