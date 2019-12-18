//
//  ContentView.swift
//  Gainz
//
//  Created by Tiffany Ho on 12/16/19.
//  Copyright © 2019 Chris Saechao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        //TabbedStruct()
        VStack {
            List(exerciseData) { exercise in
                VStack{
                    Text(exercise.name)
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
