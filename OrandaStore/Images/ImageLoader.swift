//
//  ImageLoader.swift
//  imagefromUrl
//
//  Created by Emilio Castro on 10/9/20.
//

import SwiftUI

class ImageLoader: ObservableObject {
    @Published var downloadedData: Data?
 //   var urlString : String?
  //  var imageCache = ImageCache.getImageCache()
    
/*    func loadImageFromCache() -> Bool {
        guard let urlString = urlString else {
            return false
        }
        
        guard let cacheImage = imageCache.get(forKey: urlString) else {
            return false
        }
        
        downloadedData = cacheImage
        return true
    }*/
    func downloadImage(url: String){
        guard let imageURL = URL(string: url ) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }.resume()
    }
    
   
}

