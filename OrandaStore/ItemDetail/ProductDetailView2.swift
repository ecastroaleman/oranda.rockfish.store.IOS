//
//  ProductDetailView2.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/20/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

struct ProductDetailView2: View {
    @State var isInfo = true
  //  public var viewSpace: Namespace.ID
    var body: some View {
        ZStack{
            Color.darkBackground
                .ignoresSafeArea()
                .transition(.move(edge: .bottom))
            
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading) {
                    
                    RecipeInteractionView()
                       // .rotationEffect(.degrees(90))
                        .offset(y : -50)
                        
                    
                    Group {
                        // title
                        Text("Titulo Principal")
                            .font(.system(size: 29, weight: .bold))
                            .foregroundColor(.white)
                        
                        HStack(spacing: 32) {
                            HStack(spacing: 12) {
                                Image(systemName:  "alarm")
                                    .foregroundColor(.green)
                                Text("alarm")
                                    
                            }
                            
                            HStack(spacing: 12) {
                                Image(systemName: "leaf")
                                    .foregroundColor(.green)
                                Text("Otro Texto")
                                    
                            }
                        }
                        .foregroundColor(.white)
                        .padding(.vertical)
                    }//Group
                    .padding(.horizontal)
                    
                    Toggle(isOn: $isInfo, label: {})
                        .toggleStyle(IngredientMethodToggleStyle())
                        .foregroundColor(.white)
                    
                    if isInfo {
                        // ingredient list
                        InfoListView()
                    }else {
                        DetalleListView()
                    }
                    
                    
                    
                }//VStack
            }//ScrollView
            
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

struct ProductDetailView2_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView2()
    }
}

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
          
           /* Circle()
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.darkBackground.opacity(0.1),
                            Color.green, Color.green
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing),
                    lineWidth: 4
                )
                .scaleEffect(1.15)*/
            //    .matchedGeometryEffect(id: "borderId", in: viewSpace, isSource: true)
            
       /*     ArrowShape(reachedTop: index == 0, reachedBottom: index == count - 1)
                .stroke(Color.gray,
                        style: StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
                .frame(width: UIScreen.screenWidth - 32, height: UIScreen.screenWidth - 32)
                .scaleEffect(1.15)
                .matchedGeometryEffect(id: "arrowId", in: viewSpace, isSource: true)
            */
            Image("oranda1")
                .resizable()
                .scaledToFit()
              //  .matchedGeometryEffect(id: "imageId", in: viewSpace, isSource: true)
            
            // this circle will be used to drag interaction
         /*   Circle()
                .fill(Color.black.opacity(0.001))
                .scaleEffect(1.2)
                .gesture(
                    DragGesture(minimumDistance: 10)
                        .onChanged({ value in
                            withAnimation {
                                manager.chageSwipeValue(value: value.translation.height)
                            }
                        })
                        .onEnded({ value in
                            withAnimation {
                                manager.swipeEnded(value: value.translation.height)
                            }
                        })
                )*/
        }
    }
}

struct IngredientMethodToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return
            VStack(alignment: .leading) {
                HStack {
                    Text("Resumen")
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
                        .fill(Color.green)
                        .frame(width: configuration.isOn ? 110 : 70, height: 3)//110 : 70
                        .offset(x: configuration.isOn ? 16 : 140)//0 : 115
                }
            }
    }
}

struct InfoListView: View {
  //  @ObservedObject var manager: RecipeManager
    var body: some View {
        Text("Aqui debe ir el resumen")
            .foregroundColor(.white)
            .padding()
    }
    
}

struct DetalleListView: View {
  //  @ObservedObject var manager: RecipeManager
    var body: some View {
        Text("Aqui debe ir el Detalle")
            .foregroundColor(.white)
            .padding()
    }
    
}
