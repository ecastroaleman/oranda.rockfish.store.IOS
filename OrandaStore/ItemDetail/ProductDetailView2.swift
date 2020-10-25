//
//  ProductDetailView2.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/20/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

struct ProductDetailView2: View {
    @EnvironmentObject var info : GlobalInfo
    @Binding var selectedProd : PDDatosEnc!
    @Binding var showProd : Bool
    @State var attSelected :PDDatosDet!
//    @State var showProd : Bool
    var animation : Namespace.ID
    @State var isInfo = true
  //  public var viewSpace: Namespace.ID
    @State var totalProd : Double = 1.00
    var features = ["8 Onzas","16 Onzas","1 Libra"]
    @State var feature: String = "<Seleccione>"
    @State var precioSelected : String = "0.00"
    @State var precioUnitario : String = "0.00"
    var body: some View {
        ZStack{
            Color.darkBackground
                .ignoresSafeArea()
                .transition(.move(edge: .bottom))
            
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading) {
                    
                    ZStack {
                      //  URLImage(url: selectedProd.imagen)
                        UrlImageView(urlString: selectedProd.imagen)
                          //  .frame(minWidth: 200, idealWidth: 200, maxWidth: .infinity, minHeight: 100, idealHeight: 100, maxHeight: .infinity)
                            .scaledToFill()
                        
                    }
                       // .rotationEffect(.degrees(90))
                        .offset(y : -50)
                        
                    
                    Group {
                        // title
                        Text(selectedProd.name)
                            .font(.system(size: 29, weight: .bold))
                            .foregroundColor(.white)
                       
                        VStack(spacing: 10) {
                            HStack(spacing: 12) {
                                Image(systemName:  "checkmark.seal")
                                    .foregroundColor(.orange)
                                Text("Precio Q. \(precioSelected == "0.00" ? selectedProd.price : precioSelected)")
                                    .font(.title2)
                                   
                                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                            }
                           
                            HStack(spacing: 12) {
                                Image(systemName: "staroflife")
                                    .foregroundColor(.orange)
                                Text("Peso: ").font(.title2)
                                Text("\(feature)")
                                    .font(.title2)
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                    .contextMenu{
                                        VStack {
                                         /*   ForEach(0 ..< self.features.count) { index in
                                                Button(action: {self.feature = self.features[index] }) {
                                                HStack {
                                                    Text(self.features[index])
                                                    Image(systemName: "person")
                                                    
                                                }//HStck
                                            }//Button
                                                
                                                
                                            } //ForEach*/
                                            
                                            ForEach(0 ..< Int(self.selectedProd.Atributos)! ) { index2 in
                                             //   Text("ola -> \(selectedProd.DetalleAtributos![index2].name)")
                                                Button(action: {
                                                self.feature = selectedProd.DetalleAtributos![index2].name
                                                    self.precioSelected = String(format: "%.2f", (selectedProd.DetalleAtributos![index2].price as NSString).doubleValue * totalProd)
                                                    self.precioUnitario = selectedProd.DetalleAtributos![index2].price
                                                    self.attSelected = selectedProd.DetalleAtributos![index2]
                                                }) {
                                                HStack {
                                                   // Text(selectedProd.DetalleAtributos![index2].name)
                                                    Text("\(selectedProd.DetalleAtributos![index2].name)   -   Q. \(selectedProd.DetalleAtributos![index2].price)")
                                                    
                                                }//HStck
                                            }//Button
                                                
                                                
                                            } //ForEach
                                           
                                    }//VStack
                                }//contextMenu
                                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                            }
                        }
                        .foregroundColor(.white)
                        .padding(.vertical)
                            
                        
                    }//Group
                    .padding(.horizontal)
                    
                    
                    HStack(spacing: 15){
                      
                        Button(action: {
                                if totalProd > 1 {
                                    totalProd -= 1
                                    
                                    if (precioUnitario == "0.00") {self.precioUnitario = self.selectedProd.price}
                                    
                                    precioSelected = String(format: "%.2f", (precioUnitario as NSString).doubleValue * totalProd)
                                    
                                }}){
                            Image(systemName: "minus")
                                .font(.title2)
                                .foregroundColor(.gray)
                                .frame(width: 35, height: 35)
                                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                        }
                        
                        Text(String(format: "%.0f", totalProd))
                            .foregroundColor(.gray)
                            .font(.title2)
                        
                        Button(action: {
                            if (precioUnitario == "0.00") {self.precioUnitario = self.selectedProd.price}
                            
                            totalProd += 1
                            precioSelected = String(format: "%.2f", (precioUnitario as NSString).doubleValue * totalProd)
                            
                        }){
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
                        
                        Button(action:{
                            withAnimation(.easeOut){}
                            
                        }){
                            ZStack{
                            Image(systemName: "cart")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color("orange"))
                                
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 15, height: 15)
                                    .offset(x: 14, y: -10)
                                
                                Text("1")
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.white)
                                    .offset(x: 14, y: -10)
                                    .font(.system(size: 10))
                                   
                            }
                        }
                        
                        
                    }.padding(.horizontal,20)
                    .padding(.top,10)
                    
                    Toggle(isOn: $isInfo, label: {})
                        .toggleStyle(IngredientMethodToggleStyle())
                        .foregroundColor(.white)
                        .padding(.top,15)
                    
                    if isInfo {
                        // ingredient list
                        InfoListView(info: self.$selectedProd)
                    }else {
                        DetalleListView(info: self.$selectedProd)
                       
                            
                           
                    }
                   
                    
                }//VStack
                
              
               
            }//ScrollView
            
            VStack(){
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
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
            }
            
        }//ZStack
        
      //  BackButtonView()
          //  .foregroundColor(.black)
    }
}

struct BackButtonView: View {
  //  @ObservedObject var manager: RecipeManager
    var body: some View {
        VStack {
            Button(action: {
           //     withAnimation {
                 //   manager.selectedRecipe = nil
             //   }
            }, label: {
                HStack {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .bold))
                        .padding(24)
                    
                    Spacer()
                }
            })
            
            Spacer()
        }
    }
}

/*
struct ProductDetailView2_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView2()
    }
}*/

// lets add some color for background
extension Color {
    static let lightBackground = Color.init(red: 243/255, green: 243/255, blue: 243/255)
    static let darkBackground = Color.init(red: 34/255, green: 51/255, blue: 68/255)
}


extension UIScreen {
   static let screenWidth   = UIScreen.main.bounds.size.width
   static let screenHeight  = UIScreen.main.bounds.size.height
   static let screenSize    = UIScreen.main.bounds.size
}


struct RecipeInteractionView: View {
//    let recipe: RecipeItem
 //   let index: Int
 //   let count: Int
  //  @ObservedObject var manager: RecipeManager
    //lets add some matched geometry effect
//    public var viewSpace: Namespace.ID
    var body: some View {
        ZStack {
          
            Image("oranda1")
                .resizable()
                .scaledToFit()
            
        }
    }
}

struct IngredientMethodToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return
            VStack(alignment: .leading) {
                HStack {
                    Text("Información")
                        .font(.system(size: 16, weight: configuration.isOn ? .bold : .regular))
                        .frame(width: 110)
                        .fixedSize()
                        .animation(nil)
                        .padding(4)
                        .padding(.leading, 12)
                        .onTapGesture {
                            withAnimation {
                                configuration.isOn = true
                            }
                        }
                    
                    Text("Detalles")
                        .font(.system(size: 16, weight: configuration.isOn ? .regular : .bold))
                        .animation(nil)
                        .padding(4)
                        .onTapGesture {
                            withAnimation {
                                configuration.isOn = false
                            }
                        }
                }
                
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 3)
                    
                    Rectangle()
                        .fill(Color.orange)
                        .frame(width: configuration.isOn ? 110 : 70, height: 3)//110 : 70
                        .offset(x: configuration.isOn ? 16 : 140)//0 : 115
                }
            }
    }
}

struct InfoListView: View {
  //  @ObservedObject var info: PDDatosEnc!
    @Binding var info: PDDatosEnc!
    var body: some View {
        
        VStack(){
        
            infoProdDet2(titulo: "Cantidad Minima", valor: "1")
         
            infoProdDet2(titulo: "Condiciòn", valor: info.condition)
          
            infoProdDet2(titulo: "SKU", valor: info.reference)
         
        }.padding(.top,20)
        
    }
    
}

struct DetalleListView: View {
   // @ObservedObject var info: PDDatosEnc!
    @Binding var info: PDDatosEnc!
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 2, content: {
            Text("\(info.Atributos) It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.")
                .foregroundColor(.white)
                .padding()
                .multilineTextAlignment(.center)
                //.fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        })
       
            
    }
    
}

struct infoProdDet2: View {
    @State var titulo : String
    @State var valor : String
    var body: some View {
        HStack{
            Text(titulo)
                .foregroundColor(Color.white)
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            Text(valor)
                .foregroundColor(Color.white)
        }.padding(.horizontal,20)
        .padding(.top,2)
    }
}
