//
//  exerciseDetails.swift
//  Gainz
//
//  Created by Tiffany Ho on 12/20/19.
//  Copyright © 2019 Chris Saechao. All rights reserved.
//

/*
    To Do: Scrape BB Website to get video
    Layout should be:
        Title
        Target Muscles
        Workout GIF/ Animation
        Workout Steps
 */

import SwiftUI

struct exerciseDetails: View {
    var exercise: ExerciseStruct
    
    var body: some View {
        VStack {
            VStack (alignment: .center) {
                //Add Title
                //Add Muscle
                //Create Gif
                Text(exercise.name)
                    .font(.title)
                HStack (alignment: .top, spacing: 100) {
                    ImageView(exercise.pictureOne.absoluteString, width: 100, height: 100)
                    ImageView(exercise.pictureTwo.absoluteString, width: 100, height: 100)
                }
                Text(exercise.description)
                .padding()
                Spacer()
            }
            .navigationBarTitle(Text(verbatim: exercise.name), displayMode: .inline)
        }
    }
}

struct exerciseDetails_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            exerciseDetails(exercise: exerciseData[0])
        }
    }
}
