//
//  PasswordRecovery.swift
//  OrandaStore
//
//  Created by Emilio Castro on 9/26/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI
import Foundation

struct PasswordRecovery: View {
    @State var userName = ""
    @State var showmsg = true
    @State var mensaje = ""
    
    @State var viewNewUser = false
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    var body: some View {
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
                    
                    Text("Inresa tu correo para Recuperar la Contraseña")
                        .foregroundColor(Color.white.opacity(0.5))
                })
                Spacer(minLength: 0)
                
            }
            .padding()
            .padding(.leading,15)
            
            VStack {
            HStack{
                Image(systemName: "envelope")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 35)
                
                TextField("EMAIL", text: $userName)
                    .autocapitalization(.none)
                    .foregroundColor(Color("orange"))
                
            }.padding()
           .foregroundColor(Color.white.opacity(userName == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .onChange(of: userName){_ in
                if (userName == "" && !showmsg){
                    showmsg.toggle()
                }
            }
            
            HStack{
                Text(mensaje)
                 
            }
            .foregroundColor(showmsg ? Color("bg") : Color("orange").opacity(showmsg ? 0 : 0.5))
          //  .cornerRadius(15)
            .padding(.horizontal)
            .padding(.top)
            .frame(width: UIScreen.main.bounds.width-20 ,height: showmsg  ? 1 : nil , alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
           
            }
          
            HStack(spacing: 15){
            Button(action: {
                 
                if (validateEmail(userName)){
                    
                    let url = URL(string: "https://oranda.rockfish.store/es/recuperar-contrase%C3%B1a?email=\(userName)&submit=")!
                   
                    
                    var request = URLRequest(url: url)
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    request.httpMethod = "POST"
                    
                    URLSession.shared.dataTask(with: request) { data, response, error in
                        // handle the result here.
                        DispatchQueue.main.sync {
                            guard let unwrappedResponse = response as? HTTPURLResponse else {
                                print("Error")
                                return
                            }
                            
                            switch unwrappedResponse.statusCode {
                            case 200 ..< 300:
                                mensaje="Se ha enviado el restablecimiento de contraseña al correo :  \(userName) !"
                            default:
                                mensaje="Ocurriò un error al enviar la solicitud, comuniquese con el Establecimiento !"
                            }
                        }
                    }.resume()
                    
                   
                    if (showmsg){
                    showmsg.toggle()
                    }
                }else {
                    
                    mensaje="El email ingresado NO es valido !"
                    if (showmsg){  showmsg.toggle() }
                    print("Email Invalido")
                }
                
             //  showmsg=false
               
                
                
            }, label: {
                Text("ENVIAR")
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width-150)
                    .background(Color("green"))
                    .clipShape(Capsule())
                    .frame(height: userName != "" ? nil : 0)
                
            }
            
            )
            }
                HStack(spacing: 15){
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Regresar")
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width-150)
                        .background(Color("green"))
                        .clipShape(Capsule())
                })
           
        //    .opacity(userName != "" && password != "" ? 1:0)
         //   .disabled(userName != ""  ? false : true)
            
              
                
            }.padding(.top)
            
            
            
          Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            HStack(spacing: 5){
                Text("Aùn no tienes cuenta ?")
                    .foregroundColor(Color.white.opacity(0.6))
                
                Button(action: {viewNewUser.toggle()}, label: {
                    Text("Crear Cuenta")
                        .fontWeight(.heavy)
                        .foregroundColor(Color("green"))
                }) .sheet(isPresented: $viewNewUser){
                    NuevoUsuario()
                }
            }
        
            .padding(.vertical)
            
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
        .animation(.easeOut)
      
    }
    
}

func validateEmail(_ string: String) -> Bool {
    if string.count > 100 {
        return false
    }
    let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
    //let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
    return emailPredicate.evaluate(with: string)
}

struct PasswordRecovery_Previews: PreviewProvider {
    static var previews: some View {
        PasswordRecovery()
    }
}

enum NetworkingError: Error {
    case badUrl
    case badResponse
}
