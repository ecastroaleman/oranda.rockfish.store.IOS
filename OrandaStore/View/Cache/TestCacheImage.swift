//
//  TestCacheImage.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/25/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

struct TestCacheImage: View {
    var body: some View {
        HStack{
            UrlImageView(urlString: "http://localhost/oauth3/api-img.php?id=/29/28")
        }
    }
}

struct TestCacheImage_Previews: PreviewProvider {
    static var previews: some View {
        TestCacheImage()
    }
}
