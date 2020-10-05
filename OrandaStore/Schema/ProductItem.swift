//
//  CertificateItem.swift
//  cdaX
//
//  Created by Emilio Castro on 2/8/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

struct ProductItem: View {
    var title = "UI Design"
    var image = "oranda1"
    var background = Color.black
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("certificate")
                        .foregroundColor(Color(.displayP3, red: 0.615686274509804, green: 0.8588235294117647, blue: 0.9058823529411765))
                }
                .frame(width: 100, alignment: .leading)
                .padding(20)
                
                Spacer()
                
                Image("Logo")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 30, height: 30)
                    .padding(.trailing, 20.0)
            }
            
            Image(image)
               // .renderingMode(.original)
                .resizable()
                .frame(minWidth: 0, maxWidth: 250, minHeight:
                    0, maxHeight: 200)
               // .offset(y: 50)
                .cornerRadius(50)
        }
        .background(background)
        .cornerRadius(20)
    }
}

#if DEBUG
struct ProductItem_Previews : PreviewProvider {
    static var previews: some View {
        ProductItem().previewLayout(.sizeThatFits)
    }
}
#endif
