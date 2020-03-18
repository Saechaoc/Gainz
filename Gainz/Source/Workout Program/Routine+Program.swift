//
//  Routine.swift
//  Gainz
//
//  Created by Chris on 3/17/20.
//  Copyright © 2020 Chris Saechao. All rights reserved.
//

import Foundation

//A workout routine is a set of discrete exercises
// ie. Routine = Bench, Deadlift, Squat
struct Routine {
    var routine: [Exercise]
}

//A workout program is a set of discrete routines
//ie. Program = Deadlift routine, bench routine, squat routine.
//  Each routine has a set of different exercises
struct Program {
    var program: [Routine]
}
