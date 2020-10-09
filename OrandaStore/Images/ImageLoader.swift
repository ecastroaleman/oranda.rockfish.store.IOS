//
//  ImageLoader.swift
//  imagefromUrl
//
//  Created by Emilio Castro on 10/9/20.
//

import SwiftUI

class ImageLoader: ObservableObject {
    @Published var downloadedData: Data?
    
    
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


class ImageCache {
    var cache = NSCache<NSString, UIImage>()

    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }

    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
}

extension ImageCache {
    private static var imageCache = ImageCache()
    static func getImageCache() -> ImageCache {
        return imageCache
    }
}

