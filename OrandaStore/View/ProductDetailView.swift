//
//  ProductDetailView.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/17/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI
/*
struct ProductDetailView2: View {
    @State var selectedProd : ProductModel!
    @State var showProd = false
    @Namespace var animation
    
    var body: some View {
      
        ProductDetailView(bagData: productos[0], show: false, animation: animation)
    }
}*/

struct ProductDetailView: View {
    @Binding var bagData : ProductModel!
   // @State var bagData : ProductModel!
    @Binding var show : Bool
   // @State var show : Bool
    var animation : Namespace.ID
    @State var selectedColor = Color("bg")
    @State var totalProd = 1
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading, spacing: 5){
                    Button(action:{
                        withAnimation(.easeOut){show.toggle()}
                        
                    }){
                        Image(systemName: "chevron.left")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                    }
                    
                    HStack{
                    Text("Producto Destacado")
                        .fontWeight(.bold)
                        .foregroundColor(Color("orange"))
                        .padding(.top)
                        Spacer()
                    Button(action:{
                        withAnimation(.easeOut){show.toggle()}
                        
                    }){
                        Image(systemName: "cart")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("orange"))
                    }
                    }
                    Text(bagData.title)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    VStack(alignment: .leading, spacing: 2){
                        Text("Precio")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text(bagData.precio)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        
                    }.padding(.top,15)
                }
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
               
                
                
                
            }
            .padding()
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            HStack(){
               
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                URLImage(url: bagData.image)
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: bagData.image, in: animation)
                    .cornerRadius(20)
                    .frame(width: 220, height: 200)
                    .position(x: UIScreen.main.bounds.width - 165,y: 40)
                   
            }
           // .padding()
           // .padding(.top,2)
            .padding(.horizontal,30)
            .zIndex(1)
            
            VStack{
                HStack{
                    VStack(alignment: .leading, spacing: 8){
                        Text("Seleccione Peso")
                            .foregroundColor(.gray)
                        
                        
                     /*   HStack(spacing: 15){
                            ColorButton(color: Color(bagData.image), selectedColor: $selectedColor)
                            ColorButton(color: Color.yellow, selectedColor: $selectedColor)
                            ColorButton(color: Color.green, selectedColor: $selectedColor)
                        }*/
                    }
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    
                   
                }
                .padding(.horizontal)
                .padding(.top, -100)
                
                Divider()
               infoProdDet(titulo: "Alimento Tipo Hojuela", valor: "")
                
                Divider()
                HStack{
                    Text("Informaciòn del Producto")
                        .foregroundColor(Color.black)
                        .font(.callout).fontWeight(.heavy)
                }.padding(.horizontal,20)
                .padding(.top,5)
                
                infoProdDet(titulo: "Cantidad Minima", valor: "1")
                infoProdDet(titulo: "Condiciòn", valor: "Nuevo")
                infoProdDet(titulo: "SKU", valor: "500")
        //        infoProdDet(titulo: "Esto es el detalle completo de lo que debe agregare en el producto y no se exactamente cuanto debe ser el maximo pero vamos a tomar en cuenta que debe minimizarse.", valor: "")
                
                HStack(spacing: 15){
                  
                    Button(action: {
                            if totalProd > 1 {totalProd -= 1}}){
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
                    Spacer()
                    
                    Button(action: {}){
                        Image(systemName: "suit.heart.fill")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.red)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    }
                    
                }.padding(.horizontal,20)
                .padding(.top,10)
                
                Button(action:{}){
                    Text("Añadir al Carrito")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color("orange"))
                        .clipShape(Capsule())
                }
                
             //   Spacer()
            }
            .background(Color.white.clipShape(CustomCorner2()).padding(.top,-180))
            .zIndex(0)
        }
       .background(selectedColor.ignoresSafeArea(.all, edges: .top))
      //  .background(Color.gray.ignoresSafeArea(.all, edges: .bottom))
   //     .onAppear{
    //        selectedColor = Color("bg")
     //   }
    }
}

/*
struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView2()
    }
}*/

struct infoProdDet: View {
    @State var titulo : String
    @State var valor : String
    var body: some View {
        HStack{
            Text(titulo)
                .foregroundColor(Color.black)
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            Text(valor)
                .foregroundColor(Color.black)
        }.padding(.horizontal,20)
        .padding(.top,2)
    }
}
