//
//  CertificateRow.swift
//  cdaX
//
//  Created by Emilio Castro on 2/8/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

struct ProductoDestacado : View {
    var certificates = certificateData
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Productos Destacados")
                .font(.system(size: 20))
                .fontWeight(.heavy)
                .padding(.leading, 20)
                .foregroundColor(Color("orange"))
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(certificates) { item in
                        
                        ProductItem(id: item.id, title: item.title, image: item.image)
                            .cornerRadius(20)
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
    }
}

struct Certificate: Identifiable {
    var id : Int
    var title: String
    var image: String
    var precio: String
    
}

let certificateData = [
    Certificate(id: 1, title: "Alimento en Hojuela", image: "https://oranda.rockfish.store/27-large_default/alimento-en-hojuela.jpg",precio: "Q. 25.00"),
    Certificate(id: 2, title: "Filtros Boyu", image: "https://oranda.rockfish.store/29-large_default/filtro-catarata.jpg", precio: "Q. 125.00"),
    Certificate(id: 3, title: "Escalares", image: "https://oranda.rockfish.store/26-large_default/red-cap.jpg", precio: "Q. 45.00"),
]

#if DEBUG
struct ProductoDestacado_Previews : PreviewProvider {
    static var previews: some View {
        ProductoDestacado()
    }
}
#endif
