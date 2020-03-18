//
//  ImageLoader.swift
//  Gainz
//
//  Created by Tiffany Ho on 12/18/19.
//  Copyright © 2019 Chris Saechao. All rights reserved.
//

import Foundation

/*
    To Do:
        Cache image? Use NSCache
 */

class ImageLoader: ObservableObject {
    //Published property automatically creates a publisher
    /*
     A publisher delivers elements to one or more Subscriber instances. The subscriber’s Input and Failure associated types must match the Output and Failure types declared by the publisher. The publisher implements the receive(subscriber:) method to accept a subscriber.
     */
    @Published var data: Data?
    //static let cache = NSCache<NSURL, UIImage>()
    
    init(imgURL: String) {
        guard let url = URL(string: imgURL) else {
            return
        }

            //Whenever an image is downloaded that will send an event to the setter observer didSet
            //This call results in the image data to be passed to the publisher and renders the image as it comes in
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                
                //Whenever you use a publisher to announce your object has changed,
                //This must happen on the main thread
                DispatchQueue.main.async {
                    self.data = data
                    //ImageLoader.cache.setObject(UIImage(data: data) ?? UIImage(), forKey: url as NSURL)
                }
            }
            task.resume()
    }
}
