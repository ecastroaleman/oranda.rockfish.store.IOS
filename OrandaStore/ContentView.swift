//
//  ContentView.swift
//  OrandaStore
//
//  Created by Emilio Castro on 9/22/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @AppStorage("status1") var logged = false
    
    var body: some View {
        
       NavigationView {
        
         
        
        if logged {
            
                Menu()
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
                .navigationBarHidden(true)
            
                
            }else {
                Home()
                    .preferredColorScheme(.dark)
                    .navigationBarHidden(true)
            }
        }
    }
}

struct DropDown : View {
    @State var expand  = false
    @State var titulo : String
    var body : some View {
        
    //    VStack(alignment: .leading,spacing: 18,  content: {
            HStack(spacing: 15) {
                Image(systemName: "checkmark")
                    .font(.system(size: 22))
                    .frame(width: 25, height: 25)
                
                Text(titulo)
                    .font(.title3)
                    .fontWeight(.semibold)
                Image(systemName: expand ? "chevron.up" : "chevron.down" ).resizable().frame(width: 13, height: 6).foregroundColor(.white)
                
            }.padding(.vertical)
            .padding(.trailing)
            .onTapGesture{
                self.expand.toggle()
            }
            
            if expand {
            
                SubMenu(titulo: "Agua Dulce", expand: self.expand)
                SubMenu(titulo: "Agua Salada", expand: self.expand)
                SubMenu(titulo: "Otros", expand: self.expand)
            
      
            }
   //     })
     //   .padding()
     //   .background(LinearGradient(gradient: .init(colors: [.red,.orange]), startPoint: .top, endPoint: .bottom))
     //   .cornerRadius(20)
       // .animation(expand ? .easeIn : .easeOut )
    }
}

struct ContentView_Previews: PreviewProvider {
   
    static var previews: some View {
        ContentView()
    }
}


struct Menu : View {
    @State var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var width = UIScreen.main.bounds.width
    @State var show = false
    @State var selectedIndex = ""
    @State var min : CGFloat = 0
    @AppStorage("status1") var logged = false
    var body: some View {
        
        ZStack {
        VStack {
            ZStack {
            HStack {
                Button(action: {
                    
                    withAnimation(.spring()){
                        show.toggle()
                    }
                    
                }, label: {
                    Image(systemName: "line.horizontal.3")
                        .font(.system(size: 22))
                        .foregroundColor(.black)
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
                        .frame(width: 35, height: 35)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                })
                
            }
                
                Text("Menu Inicio")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .background(Color("orange"))
                
            }.padding()
            .padding(.top,edges!.top )
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x:0, y:5 )
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            Text(selectedIndex)
          
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
        }
     
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
                            Text("Emilio")
                                .font(.title)
                                .fontWeight(.semibold)
                            
                            Text("ecastro@gmail.com")
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
            .background(Color.black.opacity(show ? 0.3 : 0))
            
    }
        .ignoresSafeArea(.all, edges: .all)
}
}

struct CustomShape : Shape {
    @Binding var min : CGFloat
    func path(in rect: CGRect) -> Path {
        return Path{ path in
            path.move(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 35, y: rect.height))
            path.addLine(to: CGPoint(x: 35, y: 0))
            path.move(to: CGPoint(x: 35, y: min-15))
            path.addQuadCurve(to: CGPoint(x: 35, y: min+90), control: CGPoint(x: -35, y: min+35))
            
            
            
        }
    }
}

struct MenuButtons: View {
    var image : String
    var title : String
    @Binding var selected : String
    @Binding var show : Bool
    @AppStorage("status1") var logged = false
    var body: some View{
        Button(action: {
            withAnimation(.spring()){
                selected = title
                show.toggle()
                
                if title == "Salir"{
                    print("ES SAlir cambiando a false")
                    withAnimation(.easeOut){logged.toggle()
                        logged = false}
                    
                   
                }
            }
        }
               , label: {
            HStack(spacing: 15){
                Image(systemName: image)
                    .font(.system(size: 22))
                    .frame(width: 25, height: 25)
                
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .padding(.vertical)
            .padding(.trailing)
               }).padding(.top,UIScreen.main.bounds.width < 750 ? 0 : 5)
        .foregroundColor(.white)
    }
}

struct Home : View {
    
    @State var userName = ""
    @State var password = ""
    @State var viewRecPass = false
    @State var showNewUser =  false
    @AppStorage("stored_User") var user = "ecastroaleman@gmail.com"
    @AppStorage("status1") var logged = false
    
    var body: some View{
    
            VStack{
                Spacer(minLength: 0)
                Image ("logo2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal,35)
                    .padding(.vertical)
                
                HStack {
                    VStack(alignment: .leading, spacing: 12, content: {
                        Text("Oranda RockFish Store")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("orange"))
                        
                        Text("Iniciar sesiòn con su cuenta...")
                            .foregroundColor(Color.white.opacity(0.5))
                    })
                    Spacer(minLength: 0)
                    
                }
                .padding()
                .padding(.leading,15)
                
                HStack{
                    Image(systemName: "envelope")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 35)
                    
                    TextField("EMAIL", text: $userName)
                        .autocapitalization(.none)
                    
                }.padding()
                .foregroundColor(Color.white.opacity(userName == "" ? 0 : 0.12))
                .cornerRadius(15)
                .padding(.horizontal)
                
                HStack{
                    Image(systemName: "lock")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 35)
                    
                    SecureField("PASSWORD", text: $password)
                        .autocapitalization(.none)
                    
                }.padding()
                .foregroundColor(Color.white.opacity(password == "" ? 0 : 0.12))
                .cornerRadius(15)
                .padding(.horizontal)
                .padding(.top)
              
                HStack(spacing: 15){
                Button(action: {
                    print("user -> \(userName)")
                    print("pass -> \(password)")
                    
                    if (userName == "ecastroaleman@gmail.com" && password == "abcd1234"){
                        print ("Logeado")
                        withAnimation(.easeOut){
                            logged = true
                            self.logged.toggle()
                            }
                        
                    }
                    
                    
                    
                }, label: {
                    Text("LOGIN")
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width-150)
                        .background(Color("green"))
                        .clipShape(Capsule())
                    
                })
                .opacity(userName != "" && password != "" ? 1:0)
                .disabled(userName != "" && password != "" ? false : true)
                    
                    if getBiometricStatus(){
                        Button(action: authenticateUser, label: {
                            
                            Image(systemName: LAContext().biometryType == .faceID ? "faceid" : "touchid" )
                                .font(.title)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color("green"))
                                .clipShape(Circle())
                        })
                    }
                    
                }.padding(.top)
                
                
                Button(action: {
                    
                    viewRecPass.toggle()
                    
                }, label: {
                        Text("Olvidò su Password ?")
                            .foregroundColor(Color("green"))
                }).padding(.top,8)
                .fullScreenCover(isPresented: $viewRecPass){
                    PasswordRecovery()
                }
                
                Spacer(minLength: 0)
                
                HStack(spacing: 5){
                  
                    Text("Aùn no tienes cuenta ?")
                        .foregroundColor(Color.white.opacity(0.6))
                    
                /*    NavigationLink(destination: NuevoUsuario()){
                        Text("Crear Cuenta")
                            .fontWeight(.heavy)
                            .foregroundColor(Color("green"))
                    }*/
                    
                    Button(action: {self.showNewUser.toggle()}, label: {
                        Text("Crear Cuenta")
                            .fontWeight(.heavy)
                            .foregroundColor(Color("green"))
                    }).fullScreenCover(isPresented: $showNewUser){
                      NuevoUsuario()
                    }
                }
                
                .padding(.vertical)
                
            }
            .background(Color("bg").ignoresSafeArea(.all, edges: .all))
            .animation(.easeOut)
    
    }
    
    //Biometric
    
    func getBiometricStatus()->Bool {
        let scanner = LAContext()
        if userName == user && scanner.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: .none){
            return true
        }
        return false
    }
    
    func authenticateUser(){
        let scanner = LAContext()
        scanner.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To Unlock \(userName)"){
            (status, err) in
            
            if err != nil {
                print(err!.localizedDescription)
                return
            }
            
            withAnimation(.easeOut){logged = true}
        }
    }
}


struct SubMenu: View {
    @State var titulo : String
    @State var expand : Bool
    var body: some View {
        Button(action: {print(titulo); expand.toggle()}) {
            Text("          \(titulo)")
                .font(.body)
                .fontWeight(.light)
                .padding(3)
            
            
            
        }.foregroundColor(.white)
    }
}
