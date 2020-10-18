//
//  HomeList.swift
//  cdaX
//
//  Created by Emilio Castro on 2/8/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//


import SwiftUI

struct HomeList : View {
    @EnvironmentObject var info : GlobalInfo
    var slides = productData
    @Namespace var animation
    @State var indice = 0
    @State var showProd = false
    @State var selectedProd : ProductModel!
  
    var body: some View {
        
        ZStack {
        ScrollView {
           
            VStack{
            HStack {
                VStack(alignment: .leading) {
                    Text("Bienvenido").font(.largeTitle).fontWeight(.heavy)
                    Text(self.info.apellidos).foregroundColor(.gray)
                }
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
                .padding(.top, 10)
                .padding(.leading, 20)
                Divider()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack() {
                   
                    //Cursos Cocurriculares 0
                    GeometryReader { geometry in
                        Button(action: {})
                        {
                            SlideView(slides: self.slides[0])
                                .rotation3DEffect(Angle(degrees: Double(
                                    (geometry.frame(in: .global).minX - 30) / -30
                                )), axis: (x: 0, y: 10, z: 0))
                               
                        }
                    }//Geometry
                    .frame(width: 246, height: 100)
                   
                    //1
                    GeometryReader { geometry in
                                           Button(action: {})
                                           {
                                               SlideView(slides: self.slides[1])
                                                   .rotation3DEffect(Angle(degrees: Double(
                                                       (geometry.frame(in: .global).minX - 30) / -30
                                                   )), axis: (x: 0, y: 10, z: 0))
                                   
                                           }
                                       }//Geometry
                    .frame(width: 246, height: 100)
                    // 2
                    GeometryReader { geometry in
                                           Button(action: {})
                                           {
                                               SlideView(slides: self.slides[2])
                                                   .rotation3DEffect(Angle(degrees: Double(
                                                       (geometry.frame(in: .global).minX - 30) / -30
                                                   )), axis: (x: 0, y: 10, z: 0))
                                   
                                           }
                                       }//Geometry
                    .frame(width: 246, height: 100)
                    //3
            
                  
                }.padding(5)
                //Spacer()
            }
        
          
            
       //ec     CourseRow()
        
                Divider()
                VStack(alignment: .leading){
                Text("Productos Destacados")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                   // .padding(.leading, 20)
                    .foregroundColor(Color("orange"))
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(productos){prod in
                            
                            ProductView(bagData: prod,animation: animation)
                                .onTapGesture{
                                    withAnimation(.easeIn){
                                        selectedProd = prod
                                        showProd.toggle()
                                    }
                                }
                        }
                    }
                }
                
         
                
                
             
        } //Vstack
            
          
            
        Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
        }//ScrollView
            
           if (selectedProd != nil && showProd) {
                ProductDetailView(bagData: $selectedProd, show: $showProd, animation: animation)
               
            }
            
        }//ZStack
    }
    
}


#if DEBUG

struct HomeBack_Previews : PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}
#endif

struct Slides : Identifiable {
    var id = UUID()
    var index: Int
    var title: String
    var shadowColor: Color
    var urlImage: String
}

let productData = [
    Slides(index: 0, title: "Peces y Mas...",
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5), urlImage: "https://oranda.rockfish.store/modules/ps_imageslider/images/cf57c7049f5950e3f59e331e44b839394e90334f_cropped-craig-lovelidge-5iiI5wVXY8M-unsplash-scaled-1.jpg"),
    Slides(index: 1, title: "Alimento y Accesorios...",
           shadowColor: Color(red: 0.9254901960784314, green: 0.49411764705882355, blue: 0.4823529411764706, opacity: 0.5), urlImage: "https://oranda.rockfish.store/modules/ps_imageslider/images/8a80e46da848ee3fcd5bb5d7de598eb3e06958f8_daniel-corneschi-GsAJ4-Tsz_c-unsplash.jpg") ,
    Slides(index: 2, title: "Calidad y Buen Precio",
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5), urlImage: "https://oranda.rockfish.store/modules/ps_imageslider/images/e20a9822585bc0d7ebcd7ed21139c99314b4180a_oranda.png")
]

struct SlideView : View {
    var slides = Slides(index: -1, title: "", shadowColor: Color.black, urlImage: "")
    
    var body: some View {
        return VStack(alignment: .leading) {
           
            VStack(alignment: .leading){
                
                URLImage(url: slides.urlImage)
                    .aspectRatio(contentMode: .fit)
                    .shadow(color: slides.shadowColor, radius: 7, x: 0, y: 20)
                
                
            Text(slides.title)
                .foregroundColor(Color.white)
                .font(.headline)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
               // .multilineTextAlignment(.trailing)
                .padding(.horizontal,23)
                .offset(y: -8)
                
            }
        }
        .background(Color.clear)
            .cornerRadius(30)
         //   .frame(width: 266, height: 390)
          
    }
}

