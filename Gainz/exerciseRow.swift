//
//  exerciseRow.swift
//  Gainz
//
//  Created by Tiffany Ho on 12/18/19.
//  Copyright © 2019 Chris Saechao. All rights reserved.
//
/*
 To Do:
    Create animation from the images
 */


import SwiftUI

struct exerciseRow: View {
    //The exercisestruct is a stored property of exerciseRow
    var exercise: ExerciseStruct
    
    //To Do: Create a sample image that loads
    var body: some View {
        HStack {
            ForEach(exercise.imgs, id: \.self) {
                ImageView($0.absoluteString, width: 50, height: 50)
            }
            VStack (alignment: .leading) {
                Text(exercise.name)
            }
        }
    }
}

struct ImageView: View {
    @ObservedObject var imgLoader: ImageLoader
    @State var image: UIImage = UIImage()
    let width : CGFloat
    let height : CGFloat
    
    init(_ url: String, width: CGFloat, height: CGFloat) {
        imgLoader = ImageLoader(imgURL: url)
        self.width = width
        self.height = height
    }
    
    var body: some View {
        return VStack {
            Image(uiImage: imgLoader.data != nil ? UIImage(data: imgLoader.data!)! : UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: self.width, height: self.height)
        }
    }

}


//Preview won't work unless there is an instance provided of exerciseStruct
struct exerciseRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            exerciseRow(exercise: exerciseData[0])
        }
    }
}
