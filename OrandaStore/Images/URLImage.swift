//
//  URLImage.swift
//  imagefromUrl
//
//  Created by Emilio Castro on 10/9/20.
//

import SwiftUI


struct URLImage2: View {
    let url : String
    let placeholder: String
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, placeholder: String = "placeholder"){
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: self.url)
    }
    var body: some View {
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!).resizable()
                
               // .renderingMode(.original)
        }else {
            return Image("placeholder").resizable()
                //.renderingMode(.original)
        }
    }
}

struct URLImage: View {
    let url : String
    let placeholder: String
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, placeholder: String = "placeholder"){
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: self.url)
    }
    var body: some View {
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!).resizable()
                
                .renderingMode(.original)
        }else {
            return Image("placeholder").resizable()
                .renderingMode(.original)
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "http://oranda.rockfish.store/api-img.php")
    }
}
