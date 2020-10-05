//
//  ItemView.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/2/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

struct ItemView: View {
    var item : Item
    var body: some View {
        VStack(spacing: 10) {
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width / 3, height: 150)
                .clipShape(CustomCorner(corner: [.topLeft, .topRight, .bottomLeft, .bottomRight], size: 25))
              
            
            HStack(spacing: 8){
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                Text(item.title)
                    .font(.system(size: 12))
                    .fontWeight(.heavy)
                    .foregroundColor(Color("orange"))
                    .multilineTextAlignment(.trailing)
                    .lineLimit(2)
                
                Text(item.price)
                    .font(.system(size: 10))
                    .fontWeight(.heavy)
                    .foregroundColor(item.color)
                    .padding(.vertical,10)
                    .padding(.horizontal,8)
                    .background(Color("orange"))
                    .clipShape(CustomCorner(corner: [.topLeft, .topRight, .bottomLeft], size: 10))
            }
        }
        .padding(.top)
        .padding(.leading)
        .padding([.bottom, .trailing],5)
    /*    .background(item.color.opacity(0.7)
                        .clipShape(CustomCorner(corner: [.topLeft, .topRight, .bottomLeft], size: 25))
                        .padding(.top , 55)
        )*/
        
    }
}


struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 2), spacing: 20){
            
            ForEach(items){item in
                
                ItemView(item: item)
                
            }
        }
    }
}
