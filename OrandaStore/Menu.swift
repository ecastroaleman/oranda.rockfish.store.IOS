//
//  Menu.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/2/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI
import Combine

class GlobalInfo : ObservableObject {
  //  var didChange = PassthroughSubject<Void,Never>()
    @Published var token = ""
    @Published var showItemDetail = false
    @Published var apellidos = "Emilio Castro Aleman" 
    
    init(){
        
    }
}

struct Menu : View {
    @State var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var width = UIScreen.main.bounds.width
    @State var width2 = UIScreen.main.bounds.width - (10 + 60)
    @State var height2 = UIScreen.main.bounds.height / 2
    @State var books = [
        Book(id: 0, image: "image1", title: "Peces y Mas ", author: "Emilio Castro", rating: 3, offset: 0),
        Book(id: 1, image: "image2", title: "Peces y Mas ", author: "Emilio Castro", rating: 3, offset: 0),
        Book(id: 2, image: "image3", title: "Peces y Mas ", author: "Emilio Castro", rating: 3, offset: 0)
        
    ]
    @State var show = false
    @State var selectedIndex = ""
    @State var min : CGFloat = 0
    @AppStorage("status1") var logged = false
    @State var search = ""
    @State var swiped = 0
 //   @State var showItemDetail = false
    var general = GlobalInfo()
  
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
         //   .background(Color.white.opacity(show ? 0.3 : 0))
         
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            
           
            
    }.ignoresSafeArea(.all, edges: .top)
        .environmentObject(general)
    }
    
    func getHeight(Index: Int)->CGFloat{
        return height2 - (Index - swiped < 3 ? CGFloat(Index - swiped)*40 : 80)
    }
    
    func onScroll(value: CGFloat, index: Int){
        if (value < 0){
            if index != books.last!.id {
                books[index].offset = value
            }
        }else {
            if index > 0 {
                books[index-1].offset = -(width2 + 60) + value
                
            }
        }
    }
    
    func onEnd(value: CGFloat, index: Int){
        if value < 0 {
            if -value > width2 / 2 && index != books.last!.id{
                books[index].offset = -(width2 + 60)
                swiped += 1
            }else {
                books[index].offset = 0
            }
        }else {
            if index > 0 {
                if value > width2 / 2 {
                    books[index - 1].offset = 0
                    swiped -= 1
                }else {
                    books[index - 1 ].offset = -(width2 + 60)
                }
            }
        }
    }
}


let userData = GlobalInfo()
struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu().environmentObject(userData)
    }
}


struct Book : Identifiable {
    var id : Int
    var image : String
    var title : String
    var author : String
    var rating : Int
    var offset : CGFloat
}

struct CardView2 : View {
    var card : Book
    
    var body : some View {
        
        VStack{
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            HStack{
                
                Button(action: {}){
                    Text("Read Now")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10 )
                        .background(Color("orange"))
                        .clipShape(Capsule())
                }
                
                Spacer(minLength: 0)
            }.padding()
            .padding(.bottom, 10)
        }
    }
}

struct PageViewController : UIViewRepresentable {
    var total : Int
    @Binding var current : Int
    func makeUIView(context: Context) -> UIPageControl {
        let view  = UIPageControl()
        view.numberOfPages = total
        view.currentPage = current
        view.currentPageIndicatorTintColor = .white
        view.preferredIndicatorImage = UIImage(systemName: "book.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22))
        view.backgroundStyle = .prominent
        return view
     }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = current
    }
    
}

//new

struct DetailScroll : View {
    @State var show = false
    
    var body : some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 12){
                
            
            ForEach(datas){i in
                HStack{
                    ForEach(i.rows){j in
                        
                        Cards(row: j)
                    }
                    
                }
                
            }
        }
        }
    }
}


struct Cards : View {
    var row : row
    @State var show = false
  
    var body : some View {
        VStack(spacing: 8){
                            
            NavigationLink(destination: DetailView(show: $show, name: row.name, image: row.image, price: row.price, desc: row.desc ), isActive: $show){
                                
                                Image(row.image).renderingMode(.original).resizable().frame(width: UIScreen.main.bounds.width / 3 - 25, height: 120)
                                    .cornerRadius(35)
                            }
                           
                            
                            HStack{
                                VStack(alignment: .leading, spacing: 10){
                                    
                                    Text(row.name)
                                    Text(row.price).fontWeight(.heavy)
                                }
                                Spacer()
                                
                                Button(action: {
                                    
                                }){
                                    Image(systemName: "line.horizontal.3").renderingMode(.original)
                                        .background(Color("orange"))
                                }.padding(.trailing,15)
                            }
                        }
    }
}

struct DetailView : View{
    @Binding var show : Bool
    @State var name : String
    @State var image : String
    @State var price : String
    @State var desc : String
    @State var size = ""
    var body : some View{
        
        VStack(spacing: 0){
            ZStack(alignment: .top){
                   Image(image).resizable()
                   
                
                HStack(spacing: 18){
                    Button(action: {
                                      self.show.toggle()
                                  }){
                                    Image(systemName: "backward").renderingMode(.original)
                                      .padding()
                                        .background(Color.white)
                                      
                                  }
                    .clipShape(CartShape(corner: .bottomRight, radii: 35))
                    .padding(.horizontal,0)
                    .padding(.vertical, 20)
                    
                    
                    
                    Spacer()
                    
                                  Button(action: {
                                                     
                                                 }){
                                                     Image(systemName: "cart").renderingMode(.original)
                                                    .padding()
                                                    .background(Color.white)
                                                    
                                                 }    .clipShape(CartShape(corner: .bottomLeft, radii: 35))
                    
                                  .padding(.horizontal,0)
                                  .padding(.vertical, 20)
                    
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .padding([.bottom,.leading, .trailing], 15)
            }
            .background(Color.black)
            
          
            
            
            VStack(alignment: .leading, spacing: 15){
                
                HStack{
                    VStack(alignment: .leading, spacing: 8){
                                     Text(name).font(.largeTitle)
                                                   Text(price).fontWeight(.heavy)
                                 }
                    Spacer()
                    HStack(spacing: 10){
                        Circle().fill(Color.green).frame(width: 20, height: 20)
                         Circle().fill(Color.red).frame(width: 20, height: 20)
                         Circle().fill(Color.blue).frame(width: 20, height: 20)
                        
                    }
                               
                }
             
                
                Text(desc)
                
                Text("Seleccione Tamaño")
                
                HStack{
                    ForEach(sizes, id: \.self){i in
                                  
                                   Button(action: {
                                       self.size = i
                                   }){
                                       
                                       Text(i).padding().border(Color.black, width: self.size == i ? 1.5 : 0)
                                   }.foregroundColor(.black)
                               }
                    
                }
                HStack{
                    Button(action: {
                        
                    }){
                        Text("Agregar al Carro").padding().border(Color.black, width: 1.4)
                    }.foregroundColor(.black)
                    Spacer()
                    Button(action: {
                                   
                               }){
                                   Text("Comprar Ahora").padding()
                               }
                    .foregroundColor(.white)
                    .background(Color.black)
                .cornerRadius(10)
                    
                }.padding([.leading,.trailing], 15)
                    .padding(.top, 15)
           
            }.padding()
            .background(rounded().fill(Color.white))
            .padding(.top,-50)
            
        } //Fin vstack
            .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
    }
}

struct rounded : Shape {
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}

struct CartShape : Shape {
    var corner : UIRectCorner
    var radii : CGFloat
    
    func path(in rect: CGRect)-> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radii, height: radii))
        
        return Path(path.cgPath)
    }
}

struct type : Identifiable{
    var id : Int
    var rows : [row]
    
}

struct row : Identifiable {
    var id :  Int
    var name : String
    var price : String
    var image : String
    var desc : String
}

var sizes = ["S", "M", "X", "XL"]
var types = ["Redcap", "Escalar", "Panda", "Blue"]
var datas = [
    
    
    type(id:0,rows: [row(id:0,name: "Half Black", price: "Q35.00", image: "oranda1", desc: "Bonito Ejemplar con jiba color naranja y cuerpo color negro"),
                     row(id:1,name: "Otro nombre", price: "Q50.00", image: "oranda2", desc: "Bonito Ejemplar para dar color a tu acuario." ),
                     row(id:2,name: "Otro nombre", price: "Q50.00", image: "oranda2", desc: "Bonito Ejemplar para dar color a tu acuario." )]),
    
    type(id:1,rows: [row(id:0,name: "Full Black", price: "Q55.00", image: "black", desc: "Escalares color Negro completo, para adornar tu acuario completamente y dar una vista extraordinaria."),
                     row(id:1,name: "Half Black", price: "Q80.00", image: "black", desc: "Escalar totalmente blanco, para disuadir el acuario y dar una excelente vista."),
                     row(id:2,name: "Otro nombre", price: "Q50.00", image: "oranda2", desc: "Bonito Ejemplar para dar color a tu acuario." )]),
    type(id:2,rows: [row(id:0,name: "Full Black", price: "Q55.00", image: "black", desc: "Escalares color Negro completo, para adornar tu acuario completamente y dar una vista extraordinaria."),
                     row(id:1,name: "Half Black", price: "Q80.00", image: "black", desc: "Escalar totalmente blanco, para disuadir el acuario y dar una excelente vista."),
                     row(id:2,name: "Otro nombre", price: "Q50.00", image: "oranda2", desc: "Bonito Ejemplar para dar color a tu acuario." )]),
    type(id:0,rows: [row(id:0,name: "Half Black", price: "Q35.00", image: "oranda1", desc: "Bonito Ejemplar con jiba color naranja y cuerpo color negro"),
                     row(id:1,name: "Otro nombre", price: "Q50.00", image: "oranda2", desc: "Bonito Ejemplar para dar color a tu acuario." ),
                     row(id:2,name: "Otro nombre", price: "Q50.00", image: "oranda2", desc: "Bonito Ejemplar para dar color a tu acuario." )])
]

