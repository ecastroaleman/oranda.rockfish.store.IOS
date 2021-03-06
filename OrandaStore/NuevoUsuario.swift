//
//  NuevoUsuario.swift
//  OrandaStore
//
//  Created by Emilio Castro on 9/26/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

struct NuevoUsuario: View {
  //  @State var tratamiento : String
    @State var nombre : String = ""
    @State var selected = "<-Seleccione->"
    @State var show = false
    var body: some View {
        VStack{
         
           
            
            HStack {
                Image ("logo2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal,1)
                    .padding(.vertical,2)
                    .frame(width: 150, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                VStack(alignment: .leading, spacing: 5, content: {
                    Text("Oranda RockFish Store")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("orange"))
                    
                    Text("Ingresa los datos para crear un usuario:")
                        .foregroundColor(Color.white.opacity(0.5))
                        .font(.footnote)
                })
                Spacer(minLength: 0)
                
            }
          //  .padding()
            .padding(.leading,5)
            
            NewUser(show: self.$show)
            
            //In
/*            HStack(spacing: 20) {
            Text("Tratamiento: ")
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 150)
             //   .padding(.all)
                
            TextField("",text: $selected)
                .onTapGesture( perform: {
                    self.show.toggle()
                })
                .onChange(of: selected){_ in
                   
                    self.show.toggle()
                    
                }
               
            }
            
            HStack(spacing: 20){
                Text("Nombre ")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 150)
                    .padding(.horizontal,25)
                
                TextField("Ingrese Nombre",text: $nombre)
            }
            HStack(spacing: 20){
                Text("Apellidos  ")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 150)
                    .padding(.horizontal,25)
               //     .padding(.all)
                
                TextField("Ingrese Nombre",text: $nombre)
            }
            
            HStack(spacing: 20){
                Text("Email  ")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 150)
                    .padding(.horizontal,25)
               //     .padding(.all)
                
                TextField("Ingrese Nombre",text: $nombre)
                    .frame(width: 150, alignment: .center)
            }
            
            HStack(spacing: 20){
                Text("Contraseña ")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.horizontal,25)
                    //.padding(.all)
                
                SecureField("Ingrese Nombre",text: $nombre)
                    .frame(width: 150, alignment: .center)
            }
            
            HStack(spacing: 20){
                Text("Fecha Nacimiento ")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.horizontal,25)
                   // .padding(.all)
                
                TextField("DD/MM/YYYY",text: $nombre)
                    .frame(width: 150, alignment: .center)
            }
            
            ZStack{
               
                
            /*    VStack {
                    
                    Button(action:{self.show.toggle()}){
                        Text("Cambio")
                    }
                    
                    TextField("Texto:", text: self.$selected)
                        .padding(.top)
                        .onChange(of: selected){_ in
                           
                            self.show.toggle()
                            
                        }
                }*/
                VStack{
                    Spacer()
                    RatioButtons(selected: self.$selected, show: self.$show).offset(y: self.show ? (UIApplication.shared.windows.last?.safeAreaInsets.bottom)!+15 : UIScreen.main.bounds.height)
                    
                }.background(Color(UIColor.label.withAlphaComponent(self.show ? 0.2 : 0))
                                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
                
            }.background(Color("bg").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
            .animation(.spring())
            
            
            //Fin
        */
            
          
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
        .animation(.easeOut)
        
     
    }
  
}

struct NuevoUsuario_Previews: PreviewProvider {
    static var previews: some View {
        NuevoUsuario()
    }
}

struct RatioButtons : View {
    @Binding var selected : String
    @Binding var show : Bool
    var body : some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Seleccione Tratamiento: ").font(.title).padding(.top)
                .foregroundColor(Color("orange"))
            
            ForEach(tratamientos,id: \.self){i in
                
                Button(action:{
                    self.selected = i
                    
                }){
                    HStack{
                        Text(i)
                        Spacer()
                        
                        ZStack{
                        
                            Circle().fill(self.selected ==  i ? Color("orange") : Color.red.opacity(0.2)).frame(width: 18, height: 18)
                            
                            if self.selected==i{
                                Circle().stroke(Color("orange"),lineWidth: 4).frame(width: 25, height: 25)
                            }
                        }
                    }.foregroundColor(.white)
                }.padding(.top)
                
            }
            
  /*          HStack{
                Spacer()
            
            
           Button(action: {
                self.show.toggle()
                
            }){
                Text("Continuar").padding(.vertical).padding(.horizontal,25).foregroundColor(.white)
            }
            .background(
                self.selected != "" ?
                Color("orange") : Color("bg"))
            .clipShape(Capsule())
            .disabled(self.selected != "" ? false : true)
            }
            .padding(.top)*/
            
        }.padding(.vertical)
        .padding(.horizontal,15)
    //    .padding(.bottom,(UIApplication.shared.windows.last?.safeAreaInsets.bottom)!+15)
        .background(Color("bg"))
        .cornerRadius(30)
    }
}

var tratamientos = ["Sr.","Sra.","Srita."]


struct NewUser : View {
    @State var tratamiento = ""
    @State var nombre = ""
    @State var apellido = ""
    @State var email = ""
    @State var contrasena = ""
    @State var fecha = ""
    @State var selection = 1
    @Binding var show : Bool
    @State var index = 0
    @State private var nac = Date()
    @State private var valida = "ERROR"
    @State private var showValCampos = false
    @State private var ofertas : Bool = false
    @State private var suscripcion : Bool = false
    @State private var politicas : Bool = false
    
    var body : some View {
        VStack{
            VStack{
              
                HStack(spacing: 15){
                    
                    icono(tipo: "person.fill")
                     Button(action:{self.index = 0}){
                        Text("Sr.")
                            .foregroundColor(self.index == 0 ? Color("orange") : .white)
                            .fontWeight(.bold)
                      //      .padding(.vertical,5)
                            .frame(width: (UIScreen.main.bounds.width - 130)/3)
                    }.background(self.index == 0 ? Color.white : Color.clear)
                    .clipShape(Capsule())
                    
                   Button(action:{self.index = 1}){
                        Text("Sra.")
                            .foregroundColor(self.index == 1 ? Color("orange") : .white)
                            .fontWeight(.bold)
                       //     .padding(.vertical,5)
                            .frame(width: (UIScreen.main.bounds.width - 130)/3)
                    }.background(self.index == 1 ? Color.white : Color.clear)
                    .clipShape(Capsule())
                    
                    Button(action:{self.index = 3}){
                        Text("Srita.")
                            .foregroundColor(self.index == 3 ? Color("orange") : .white)
                            .fontWeight(.bold)
                        //    .padding(.vertical,5)
                            .frame(width: (UIScreen.main.bounds.width - 50)/3)
                    }.background(self.index == 3 ? Color.white : Color.clear)
                    .clipShape(Capsule())
                    
                }//.background(Color.black.opacity(0.1))
               // .clipShape(Capsule())
              //  .padding(.vertical, 10)
       
                  Divider()
                
                Campo(tipo: "person.crop.circle.fill.badge.plus", titulo: "Nombre", tratamiento: self.$nombre)
                
             //  Divider()
                Campo(tipo: "person.crop.circle.fill.badge.plus", titulo: "Apellidos", tratamiento: self.$apellido)
                
                Divider()
                Campo(tipo: "envelope.fill", titulo: "Email", tratamiento: self.$email)
                
             //   Divider()
                
                HStack(spacing: 15){
                    icono(tipo: "lock")
                    
                    SecureField("Password", text: self.$contrasena)
                    
                    Button(action:{}){
                        Image(systemName: "eye")
                            .foregroundColor(.black)
                    }
                
                }.padding(.vertical,10)
                
                Divider()
          //      Campo(tipo: "calendar", titulo: "Fecha Nacimiento", tratamiento: self.$fecha).padding(.vertical, 15)
                HStack(spacing: 15){
                icono(tipo: "calendar")
                DatePicker("Fecha de Nacimiento", selection: $nac , displayedComponents: .date )
                    .opacity(0.5)
                   
                }
                
                
                VStack(spacing: 15){
                Toggle(isOn: $ofertas, label: {
                    Text("Desea Recibir ofertas de nuestros socios ? ")
                        .foregroundColor(Color("orange"))
                        .font(.footnote)
                        .fontWeight(.light)
                }).padding(.top, 5)
                Toggle(isOn: $suscripcion, label: {
                    Text("Desea suscribirse al boletìn de noticias ? ")
                        .foregroundColor(Color("orange"))
                        .font(.footnote)
                        .fontWeight(.light)
                })
                Toggle(isOn: $politicas, label: {
                    Text("Estoy de acuerdo con los Tèrminos y Condiciones ? ") .foregroundColor(Color("orange"))
                        .font(.footnote)
                        .fontWeight(.light)
                }).padding(.bottom,5)
                }.padding(.top, 15)
             
               
                
              
            }
            .padding(.vertical)
            .padding(.horizontal,20)
            .padding(.bottom,20)
          //  .background(Color.white)
            .cornerRadius(10)
            .padding(.top,25)
            
            Button(action: {
                valida =  validaCampos(tratamiento: index,nombre: nombre,apellido: apellido,email: email,contrasena: contrasena,nac: nac)
                
                if (valida != "OK"){
                    showValCampos.toggle()
                }else {
                    
                    print("LLama servicio de crear Usuario")
                }
                      
                         
                
                
            }){
                Text("CREAR USUARIO")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 180)
            }.background(Color("orange"))
            .cornerRadius(8)
            .offset(y: -30)
            .padding(.bottom, -40)
            .shadow(radius: 15 )
            .alert(isPresented: $showValCampos, content: {
                Alert(title: Text("ERROR"), message: Text("\(valida)"), dismissButton: .cancel(Text("Aceptar")))
            })
            
        }
    }
}

struct icono: View {
    @State var tipo : String
    var body: some View {
        Image(systemName: tipo)
            .resizable()
            .frame(width: 15, height: 15)
            .foregroundColor(.white)
    }
}

struct Campo: View {
    @State var tipo : String
    @State var titulo : String
    @Binding var tratamiento : String
    var body: some View {
        HStack(spacing: 15){
            Image(systemName: tipo)
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(.white)
            
            TextField(titulo, text: $tratamiento)
        }.padding(.vertical, 15)
    }
}

func validaCampos(tratamiento : Int , nombre : String ,apellido : String ,email : String , contrasena : String ,nac : Date) -> String {
    var ret = "OK"
    if (tratamiento < 0 && tratamiento > 2) {ret = "Debe seleccionar un Tratamiento."; return ret}
    if (nombre.count < 1 || apellido.count < 1) {ret = "Debe ingresar su Nombre y Apellido."; return ret;}
    if (!validateEmail(email)){ret = "Debe ingresar un Email valido."; return ret;}
    if (contrasena.count == 0){ret = "Debe ingresar una contraseña."; return ret;}
   
   return ret
}
