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

struct ProductItem2 : View {
    @Namespace var animacion
 
    var body : some View {
        
      
        ProductItem(data: productos[0], animacion: animacion).previewLayout(.sizeThatFits)
    }
}

struct ProductItem: View {
    var data : ProductModel!
 //   var id : Int
  //  var title : String
  //  var image : String
    var background = Color.gray
    var animacion : Namespace.ID
    var body: some View {
      
        VStack(alignment: .center) {
            
            ZStack {
                URLImage(url: data.image)
                .aspectRatio(contentMode: .fill)
                .frame(width: 170, height: 150)
                    .matchedGeometryEffect(id: data.image, in: animacion)
               
               // .resizable()
         //       .frame(minWidth: 0, maxWidth: 250, minHeight:
           //         0, maxHeight: 200)
               // .offset(y: 50)
             //   .cornerRadius(20)
               // .padding(10)
                
            }
           
            Text(data.title)
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
      
        ProductItem2()
    }
}
#endif
