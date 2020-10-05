//
//  HomeList.swift
//  cdaX
//
//  Created by Emilio Castro on 2/8/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//


import SwiftUI

struct HomeList : View {
    var token: String
    var courses = coursesData
    var apellidos: String
    @State var indice = 0
    @State var showCourseView = false
     @State var showUniformes = false
     @State var showCambiopass = false
     @State var showCafeteria = false
     @State var showCambioBus = false
     @State var showCourseCocu = false
    
    var body: some View {
        ScrollView {
           
            VStack{
            HStack {
                VStack(alignment: .leading) {
                    Text("Bienvenido").font(.largeTitle).fontWeight(.heavy)
                    Text(self.apellidos).foregroundColor(.gray)
                }
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
                .padding(.top, 10)
                .padding(.leading, 20)
                Divider()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                   
                    //Cursos Cocurriculares 0
                    GeometryReader { geometry in
                        Button(action: {self.showCourseCocu.toggle()})
                        {
                            CardView(course: self.courses[0])
                                .rotation3DEffect(Angle(degrees: Double(
                                    (geometry.frame(in: .global).minX - 30) / -30
                                )), axis: (x: 0, y: 10, z: 0))
                                /*.sheet(isPresented: self.$showCourseCocu) {
                                    CourseCocurricular(token: "", title: self.courses[0].title, image: self.courses[0].image)
                            }*/
                        }
                    }//Geometry
                    .frame(width: 246, height: 100)
                   
                    //Cambio de Bus 1
                    GeometryReader { geometry in
                                           Button(action: {self.showCambioBus.toggle()})
                                           {
                                               CardView(course: self.courses[1])
                                                   .rotation3DEffect(Angle(degrees: Double(
                                                       (geometry.frame(in: .global).minX - 30) / -30
                                                   )), axis: (x: 0, y: 10, z: 0))
                                     /*              .sheet(isPresented: self.$showCambioBus) {
                                                       CourseBusChange(token: "", title: self.courses[1].title, image: self.courses[1].image)
                                               }*/
                                           }
                                       }//Geometry
                    .frame(width: 246, height: 100)
                    //Cafeteria 2
                    GeometryReader { geometry in
                                           Button(action: {self.showCambioBus.toggle()})
                                           {
                                               CardView(course: self.courses[2])
                                                   .rotation3DEffect(Angle(degrees: Double(
                                                       (geometry.frame(in: .global).minX - 30) / -30
                                                   )), axis: (x: 0, y: 10, z: 0))
                                     /*              .sheet(isPresented: self.$showCambioBus) {
                                                       CourseBusChange(token: "", title: self.courses[1].title, image: self.courses[1].image)
                                               }*/
                                           }
                                       }//Geometry
                    .frame(width: 246, height: 100)
                    //Cambio PAssword 3
            
                    //Pedido  Uniformes 4
            
                    
        //            ForEach(courses) { course in
      /*                  GeometryReader { geometry in
                            Button(action: {
                                self.indice = self.courses[course.index].index
                              
                                switch self.indice {
                                case 0:
                                    self.showCourseCocu.toggle()
                                case 1:
                                    self.showCambioBus.toggle()
                                case 2:
                                    self.showCafeteria.toggle()
                                case 3:
                                    self.showCambiopass.toggle()
                                default:
                                    self.showUniformes.toggle()
                                }
                                
                            }) {
                                
                                      CardView(course: course)
                                        .rotation3DEffect(Angle(degrees: Double(
                                            (geometry.frame(in: .global).minX - 30) / -30
                                        )), axis: (x: 0, y: 10, z: 0))
                                        .sheet(isPresented: self.$showCourseCocu) {
                                            CourseCocurricular(token: "", title: course.title, image: course.image)
                                    }
                                    
                                
                                
                            }
                        }
                        .frame(width: 246, height: 360)
                        */
                 //   } //for
                }.padding(10)
                //Spacer()
            }
           // .frame(width: UIScreen.main.bounds.width)
      
          
            
       //ec     CourseRow()
         Divider()
            ProductoDestacado()
             
        } //Vstack
        Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
        }//ScrollView
    }
    
}

#if DEBUG
struct HomeBack_Previews : PreviewProvider {
    static var previews: some View {
        HomeList(token: "", apellidos: "Emilio Castro")
    }
}
#endif

struct Course : Identifiable {
    var id = UUID()
    var index: Int
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
}

let coursesData = [
    Course(index: 0, title: "Peces y Mas...",
           image: "image1",
           color: Color(hue: 0.677, saturation: 0.701, brightness: 0.788),
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
    Course(index: 1, title: "Alimento y Accesorios...",
           image: "image2",
           color: Color(red: 0.9254901960784314, green: 0.49411764705882355, blue: 0.4823529411764706),
           shadowColor: Color(red: 0.9254901960784314, green: 0.49411764705882355, blue: 0.4823529411764706, opacity: 0.5)) ,
    Course(index: 2, title: "Calidad y Buen Precio",
           image: "image3",
           color: Color("background7"),
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5))/*,
    Course(index: 3, title: "Cambio de \nContraseña",
           image: "Illustration4",
           color: Color("background8"),
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
    Course(index: 4, title: "Pedido de \nUniformes",
           image: "uniformes",
           color: Color("background9"),
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),*/
]

struct CardView : View {
    var course = Course(index: -1, title: "", image: "Illustration1", color: Color.white, shadowColor: Color.black)
    
    var body: some View {
        return VStack(alignment: .leading) {
        /*    Text(course.title)
                .foregroundColor(.white)
                .font(.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .lineSpacing(6)
                .lineLimit(4)
         //       .padding(30)
        //    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
         //   .frame(height: 120)*/
           
            VStack(alignment: .leading){
            Image(course.image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
             //   .frame(width: .infinity, height: .infinity)
              //  .padding(.bottom, 30)
                .shadow(color: course.shadowColor, radius: 7, x: 0, y: 20)
                
            Text(course.title)
                .foregroundColor(Color.white)
                .font(.headline)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
               // .multilineTextAlignment(.trailing)
                .padding(.horizontal,23)
                .offset(y: -5)
                
            }
        }
        .background(Color.clear)
            .cornerRadius(30)
         //   .frame(width: 266, height: 390)
          
    }
}

