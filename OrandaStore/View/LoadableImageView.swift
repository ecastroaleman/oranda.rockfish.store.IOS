//
//  LoadableImageView.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/7/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI
    
struct LoadableImageView: View {
    @ObservedObject var imageFetcher : ImageFetcher
    
    var stateContent: AnyView {
        if let image = UIImage(data: imageFetcher.data){
            return AnyView(
                Image(uiImage: image).resizable()
            )
        }else {
            return AnyView(
                ActivityIndicator(style: .medium)
            )
        }
    }
    
    init(with urlString: String){
        self.imageFetcher = ImageFetcher(urlString: urlString)
    }
    
    var body: some View {
        
            stateContent
    
    }
}

struct LoadableImageView_Previews: PreviewProvider {
    static var previews: some View {
        LoadableImageView(with: "http://oranda.rockfish.store/api-img.php?pic.jpg")
    }
}
