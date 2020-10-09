//
//  CertificateItem.swift
//  cdaX
//
//  Created by Emilio Castro on 2/8/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI
import Foundation
import Combine

struct ProductItem: View {
    var id : Int
    var title : String
    var image : String
    var background = Color.gray
    var body: some View {
      
        VStack(alignment: .center) {
            
            
            URLImage(url: image)
                .aspectRatio(contentMode: .fill)
                .frame(width: 170, height: 150)
              
               
               // .resizable()
         //       .frame(minWidth: 0, maxWidth: 250, minHeight:
           //         0, maxHeight: 200)
               // .offset(y: 50)
             //   .cornerRadius(20)
               // .padding(10)
                
        
           
                    Text(title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .lineLimit(2)
                        // .multilineTextAlignment(.trailing)
                        .padding(.top,10)
                        
                    Text("Q. 25.00")
                        .foregroundColor(Color.white)
                        .font(.system(size: 25))
           
                        
               
                
               
                
             /*   Image("Logo")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 30, height: 30)
                    .padding(.trailing, 20.0)*/
            
            
         
                
        }
        .background(background)
       // .cornerRadius(20)
       
    
    }
}

#if DEBUG
struct ProductItem_Previews : PreviewProvider {
    static var previews: some View {
      
        ProductItem(id: 1,title: "Alimento en Hojuela", image: "https://oranda.rockfish.store/27-large_default/alimento-en-hojuela.jpg").previewLayout(.sizeThatFits)
    }
}
#endif
