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
            
            Text("Producto Destacado")
                .font(.system(size: 20))
                .fontWeight(.heavy)
                .padding(.leading, 20)
                .foregroundColor(Color("orange"))
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(certificates) { item in
                        
                        ProductItem(title: item.title, image: item.image)
                            .frame(width: 230.0, height: 160)
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
    var id = UUID()
    var title: String
    var image: String
}

let certificateData = [
    Certificate(title: "UI Design", image: "oranda1"),
    Certificate(title: "SwiftUI", image: "oranda2"),
    Certificate(title: "Sketch", image: "black"),
]

#if DEBUG
struct ProductoDestacado_Previews : PreviewProvider {
    static var previews: some View {
        ProductoDestacado()
    }
}
#endif
