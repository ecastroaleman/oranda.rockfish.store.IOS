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
    @EnvironmentObject var general : GlobalInfo
    @AppStorage("status1") var logged = false
    var body: some View {
        
       NavigationView {
        
         
        
        if logged {
            
                Menu()
                .preferredColorScheme(.dark)
                .navigationBarHidden(true)
                    .edgesIgnoringSafeArea(.all)
                    .statusBar(hidden: true)
                
            }else {
                Home()
                    .preferredColorScheme(.dark)
                    .navigationBarHidden(true)
                    .edgesIgnoringSafeArea(.all)
                    .statusBar(hidden: true)
            }
        }
       .navigationBarHidden(true)
               .navigationBarBackButtonHidden(true)
               .navigationBarTitle("", displayMode: .inline)
               .navigationViewStyle(StackNavigationViewStyle())
               .statusBar(hidden: true)
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

   
struct MenuButtons: View {
    @EnvironmentObject var general : GlobalInfo
    var image : String
    var title : String
    @Binding var selected : String
    @Binding var show : Bool
    @AppStorage("status1") var logged = false
    @AppStorage("stored_Name") var storedName = ""
    var body: some View{
        Button(action: {
            withAnimation(.spring()){
                selected = title
                show.toggle()
                
                if title == "Salir"{
                    print("ES SAlir cambiando a false")
                    withAnimation(.easeOut){
                        
                        general.apellidos = ""
                        general.id_customer = 0
                        general.token = ""
                        storedName=""
                        
                        logged.toggle()
                        logged = false
                        }
                    
                   
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
    @EnvironmentObject var general : GlobalInfo
    @State var userName = "ecastroaleman@gmail.com"
    @State var password = "abcd1234"
    @State var viewRecPass = false
    @State var showNewUser =  false
    @AppStorage("stored_User") var user = ""
    @AppStorage("stored_Name") var storedName = ""
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
                        
                        Text("Iniciar sesión con su cuenta...")
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
                        self.general.apellidos = "Emilio Castro Aleman Login"
                        self.general.token = "adfañsfadfasjflkjflksjfdlf"
                        self.general.id_customer = 11
                        self.general.email = userName
                        storedName = "Emilio Castro Aleman Login"
                        user = userName
                        withAnimation(.easeOut){logged = true}
                        
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
            
            withAnimation(.easeOut){
                self.general.apellidos = "Emilio Castro Aleman Faceid"
                self.general.token = "adfañsfadfasjflkjflksjfdlf"
                self.general.id_customer = 11
                self.general.email = userName
                user = userName
                storedName = "Emilio Castro Aleman Faceid"
                logged = true}
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
