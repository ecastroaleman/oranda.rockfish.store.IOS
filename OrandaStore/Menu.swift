//
//  Menu.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/2/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI
import Combine



struct Menu : View {
    @EnvironmentObject var general : GlobalInfo
    @State var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var width = UIScreen.main.bounds.width
  
    @State var show = false
    @State var selectedIndex = ""
    @State var min : CGFloat = 0
    @AppStorage("status1") var logged = false
    @State var search = ""
    @Namespace var animation
    var body: some View {
        
        ZStack {
            Color("bg").ignoresSafeArea(.all, edges: .all)
        VStack {
            ZStack {
            HStack {
                Button(action: {
                    
                    withAnimation(.spring()){
                        show.toggle()
                    }
                    
                }, label: {
                    Image(systemName: "line.horizontal.3.decrease")
                        .font(.system(size: 22))
                        .foregroundColor(Color("orange"))
                })
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
                Button(action: {
                    print("\(selectedIndex)")
                    withAnimation(.spring()){
                        show.toggle()
                    }
                    
                }, label: {
                    Image("pic")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 40, height: 40)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        //.foregroundColor(Color("orange"))
                })
                
            }
                
                Text("Oranda RockFish Store")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("orange"))
                
            }.padding()
            .padding(.top,edges!.top )
            .background(Color("bg"))
           
          
            HomeList()
               
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
        }
     
            
            //Menu desplegable
            HStack(spacing: 0) {
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
                VStack{
                    HStack{
                        Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                        Button(action: {
                            
                            withAnimation(.spring()){
                                show.toggle()
                            }
                            
                        }, label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.white)
                        })
                    }
                    .padding()
                    .padding(.top, edges!.top)
                    
                    HStack(spacing: 15){
                        
                        GeometryReader{reader in
                        Image("pic")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                            .onAppear(perform: {
                                self.min = reader.frame(in: .global).minY
                            })
                            
                        } .frame(width: 75, height: 75)
                        VStack(alignment: .leading, spacing: 5 ,content: {
                            Text(general.apellidos)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Text(general.email)
                                .font(.caption2)
                                .fontWeight(.semibold)
                        })
                        .foregroundColor(.white)
                            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                        }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, content: {
                        MenuButtons(image: "cart", title: "My Orders",selected: $selectedIndex, show: $show,logged: logged)
                        MenuButtons(image: "person", title: "My Profile",selected: $selectedIndex, show: $show,logged: logged)
                        MenuButtons(image: "mappin", title: "Delivery Address",selected: $selectedIndex, show: $show,logged: logged)
                        MenuButtons(image: "creditcard", title: "Payment Method",selected: $selectedIndex, show: $show,logged: logged)
                        MenuButtons(image: "envelope", title: "Contact Us",selected: $selectedIndex, show: $show, logged: logged)
                        
                        DropDown(titulo: "Peces")
                        DropDown(titulo: "Accesorios")
                        DropDown(titulo: "Alimento")
                        
                        MenuButtons(image: "info.circle", title: "Help & FAQs",selected: $selectedIndex, show: $show,logged: logged)
                        
                        MenuButtons(image: "arrow.left.circle", title: "Salir", selected: $selectedIndex, show: $show
                                    ,logged: logged)
                    })
                    .padding(.top)
                    .padding(.leading,40)
                   
                    
                    
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
                .frame(width: width-100)
                .background(Color("orange").clipShape(CustomShape(min: $min)))
                .offset(x: show ? 0 : width-100)
            }
         //   .background(Color.white.opacity(show ? 0.3 : 0))
         
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
    
            
    }.ignoresSafeArea(.all, edges: .top)
        .environmentObject(general)
    }
    
}

/*
let userData = GlobalInfo()
struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu().environmentObject(userData)
    }
}*/


struct Book : Identifiable {
    var id : Int
    var image : String
    var title : String
    var author : String
    var rating : Int
    var offset : CGFloat
}


//new
