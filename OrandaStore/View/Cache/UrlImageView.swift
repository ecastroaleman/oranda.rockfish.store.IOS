//
//  UrlImageView.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/25/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//


import SwiftUI

struct UrlImageView: View {
    @ObservedObject var urlImageModel: UrlImageModel
    
    init(urlString: String?) {
        urlImageModel = UrlImageModel(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: urlImageModel.image ?? UrlImageView.defaultImage!)
            .resizable()
            .renderingMode(.original)
          //  .scaledToFit()
            //.frame(width: 100, height: 100)
    }
    
    static var defaultImage = UIImage(named: "placeholder")
}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        UrlImageView(urlString: nil)
    }
}
