//
//  TabView.swift
//  Gainz
//
//  Created by Tiffany Ho on 12/16/19.
//  Copyright © 2019 Chris Saechao. All rights reserved.
//

import SwiftUI

struct TabbedView: View {
    var exercise : Exercise
    
    var body: some View {
        Text(exercise.name)
    }
}

