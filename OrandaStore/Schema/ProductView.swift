//
//  ProductView.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/17/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

struct ProductView2: View{
    @Namespace var animation
    var body : some View {
        
        
        ProductView(bagData: productos[2], animation: animation)
    }
}

struct ProductView: View {
    var bagData : ProductModel
    var animation : Namespace.ID
    var body: some View {
        
        VStack(alignment: .center){
            ZStack{
             //   Color("orange")
               //     .cornerRadius(15)
                
                URLImage(url: bagData.image)
              //  Image(bagData.image).resizable()
                    .aspectRatio(contentMode: .fill)
                  //  .frame(width: 150, height: 200)
                    .frame(minWidth: 150, idealWidth: 150, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 200, idealHeight: 200, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    //.padding(2)
                    .matchedGeometryEffect(id: bagData.id, in: animation)
            }
            
            VStack(spacing: 10){
            Text(bagData.title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .lineLimit(2)
                        // .multilineTextAlignment(.trailing)
                      //  .padding(.top,10)
                        
                    Text("Q. 25.00")
                        .foregroundColor(Color.white)
                        .font(.system(size: 25))
            }
            .frame(width: 200)
            .background(Color.gray)
           
               
        } .background(Color.gray)
        .cornerRadius(20)
    }
}


struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView2()
    }
}
