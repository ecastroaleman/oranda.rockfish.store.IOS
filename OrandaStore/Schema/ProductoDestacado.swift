//
//  CertificateRow.swift
//  cdaX
//
//  Created by Emilio Castro on 2/8/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

struct ProductoDestacado : View {
    @EnvironmentObject var info : GlobalInfo
    var prods = productos
    @State var selected = ProductModel?.self
    @Namespace var animacion
    var body: some View {
        ZStack{
        VStack(alignment: .leading) {
            
            Text("Productos Destacados")
                .font(.system(size: 20))
                .fontWeight(.heavy)
                .padding(.leading, 20)
                .foregroundColor(Color("orange"))
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(prods) { item in
                        
                        ProductItem(data: item, animacion: animacion)
                            .cornerRadius(20)
                            .fullScreenCover(isPresented: Binding.constant(info.showItemDetail)){
                                
                           //     ItemDetailSize(id: item.id, name: item.title, image: item.image)
                                
                            
                            }
                          
                         //   .frame(width: 230.0, height: 160)
                       //     .shadow(color: Color("orange"), radius: 10, x: 0, y: 10)
                        /*    .contextMenu {
                                VStack {
                                    Button(action: {}) {
                                        HStack {
                                            Text("Make First")
                                            Image(systemName: "star")
                                        }
                                    }
                                    Button(action: {}) {
                                        HStack {
                                            Text("Remove")
                                            Image(systemName: "trash")
                                        }
                                    }
                                }
                            }*/
                        
                    }
                }
                .padding(.leading, 20)
               // .padding(.top, 5)
                
            //    Spacer()
            }
           // .frame(height: 200)
        }
            
           
        }.ignoresSafeArea(.all, edges: .top)
    }
}



#if DEBUG
struct ProductoDestacado_Previews : PreviewProvider {
    static var previews: some View {
        ProductoDestacado()
    }
}
#endif
