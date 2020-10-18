//
//  ItemDetailSize.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/10/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI
/*
struct ItemDetailSize: View {
    @Binding var data : Certificate
//    @State var id : Int
 //   @State var name : String
  //  @State var image : String
   // @State var background = Color.gray
    @Namespace var animacion
    var body: some View {
        DetailItemSize(id: id, name: name, image: image, background: background, price: "Q.25.00", desc: "Breve descripcion del producto que debe ser mostrada en el menu donde se este presentando",size: "M", animation: animacion)
    }
}

struct ItemDetailSize_Previews: PreviewProvider {
   
    static var previews: some View {
        ItemDetailSize(id: 1, name: "Prueba", image: "Oranda1")
    }
}*/

struct DetailItemSize : View{
    @Binding var data : ProductModel!
 //   @State var id : Int
 //   @State var name : String
 //   @State var image : String
    @State var background = Color.gray
  //  var animacion : Namespace.ID
    @State var price = "Q1,000.00"
    @State var desc = "Esto debe ser una descripcion a agregar en el Certificate"
    @State var size = ""
    @State var totalProd = 1
    @EnvironmentObject var info : GlobalInfo
    var animation: Namespace.ID
    var body : some View{
        
        VStack(spacing: 0){
            ZStack(alignment: .top){
                URLImage(url: data.image)
                    .frame(minWidth: 0)
                    .matchedGeometryEffect(id: data.image, in: animation)
                
                HStack(spacing: 5){
                    Button(action: {
                        
                        withAnimation(.easeOut){
                            self.info.showItemDetail.toggle()}
                        
                                  }){
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("orange"))
                              //  .renderingMode(.original)
                                .font(.title)
                                .padding()
                             //           .background(Color.white)
                                      
                                  }
             //       .clipShape(CartShape(corner: .bottomRight, radii: 35))
                    .padding(.horizontal,0)
                    .padding(.vertical, 20)
                    
                    
                    
                    Spacer()
                    
                                  Button(action: {
                                                     
                                                 }){
                                                     Image(systemName: "cart") .foregroundColor(Color("orange"))
                                                    .padding()
                                                        .font(.title)
                                               //     .background(Color.white)
                                                    
                                                 }  //  .clipShape(CartShape(corner: .bottomLeft, radii: 35))
                    
                                  .padding(.horizontal,0)
                                  .padding(.vertical, 20)
                    
                    
                    
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .padding([.bottom,.leading, .trailing], 15)
                
               
            }
            .background(Color.black)
        
          
            
            
            VStack(alignment: .leading, spacing: 35){
                
                Text(data.title).font(.title)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    
                
                HStack{
                    VStack(alignment: .leading, spacing: 8){
                        
                      
                        
                        Text(price).fontWeight(.bold)
                            .font(.largeTitle)
                            .foregroundColor(Color("orange"))
                                 }
                    Spacer()
                    
                    HStack(spacing: 15){
                      
                        Button(action: {
                                if totalProd > 0 {totalProd -= 1}}){
                            Image(systemName: "minus")
                                .font(.title2)
                                .foregroundColor(.gray)
                                .frame(width: 35, height: 35)
                                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                        }
                        
                        Text("\(totalProd)")
                            .foregroundColor(.gray)
                            .font(.title2)
                        
                        Button(action: {totalProd += 1}){
                            Image(systemName: "plus")
                                .font(.title2)
                                .foregroundColor(.gray)
                                .frame(width: 35, height: 35)
                                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                        }
                        
                    }
                               
                }
             
                
                Text(desc)
                    .foregroundColor(.white)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .padding()
                
                Text("Seleccione Tamaño")
                    .foregroundColor(.white)
                
                HStack{
                    ForEach(sizesItem, id: \.self){i in
                                  
                                   Button(action: {
                                       self.size = i
                                   }){
                                       
                                       Text(i).padding().border(Color("orange"), width: self.size == i ? 1.5 : 0)
                                   }.foregroundColor(Color("orange"))
                               }
                    
                }
                HStack{
                    Button(action: {
                        
                    }){
                        Text("Agregar al Carro")
                            .padding()
                            //
                    }
                    .border(Color("orange"))
                    .cornerRadius(2)
                    .foregroundColor(Color("orange"))
                    
                    Spacer()
                    Button(action: {
                                   
                               }){
                                   Text("Comprar Ahora").padding()
                               }
                    .foregroundColor(.white)
                    .background(Color("orange"))
                .cornerRadius(10)
                    
                }.padding([.leading,.trailing], 15)
                    .padding(.top, 15)
           
            }.padding()
            .background(roundedItem().fill(Color("bg")))
            .padding(.top,-50)
            
        } //Fin vstack
            .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
    }
}

struct roundedItem : Shape {
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}


struct typeItem : Identifiable{
    var id : Int
    var rows : [rowItem]
    
}

struct rowItem : Identifiable {
    var id :  Int
    var name : String
    var price : String
    var image : String
    var desc : String
}

var sizesItem = ["8 Oz.", "0.5 Lb", "1 Lb"]
