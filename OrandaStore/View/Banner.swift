//
//  Banner.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/3/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

struct Banner: View {
    @State var width2 = UIScreen.main.bounds.width
    @State var height2 = UIScreen.main.bounds.height
    @State var swiped = 0
    @State var page = 0
    var body: some View {
        //BANNER
    //    VStack{
        
           ZStack{
           Color("bg").ignoresSafeArea(.all, edges: .all)
            
            VStack {
            VStack{
                GeometryReader {g in
                    
                    Carousel(width: width2, page: self.$page, height: g.frame(in: .global).height)
                }
                PageControl(page: self.$page)
                    .padding(.top, 20)
            }
               
            }
            .frame(width: self.width2)
            
         }
    
       
        
      /*
        ZStack {
            ForEach(books.reversed()){book in
                
                HStack{
                    ZStack{
                    Image(book.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: width2, height: getHeight(Index: book.id))
                        .cornerRadius(25)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5)
                        
                        CardView2(card: book)
                            .frame(width: width2, height: getHeight(Index: book.id))
                    }
                    .frame(height: height2)
                    PageViewController(total: books.count, current: $swiped)
                        .padding(.top, 25)
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
                .contentShape(Rectangle())
                .padding(.horizontal, 20)
                .offset(x: book.id - swiped < 3 ? CGFloat(book.id - swiped)*30 : 60)
                .offset(x: book.offset)
                .gesture(DragGesture().onChanged({
                    (value) in
                    withAnimation{onScroll(value: value.translation.width, index: book.id)}
                })
                .onEnded({ (value) in
                    withAnimation{onEnd(value: value.translation.width, index: book.id)}
                })
                
                )
            }
        }
        */
        //BANNER
        
    }
    
    func getHeight(Index: Int)->CGFloat{
        return height2 - (Index - swiped < 3 ? CGFloat(Index - swiped) * 40 : 80)
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

struct Banner_Previews: PreviewProvider {
    static var previews: some View {
        Banner()
    }
}


struct List : View {
    @Binding var page : Int
    var body: some View {
        HStack(spacing: 0) {
            ForEach(books){i in
             
                Card(page: self.$page, width: UIScreen.main.bounds.width, data: i)
                
            }
        }
    }
}


struct Card : View{
    @Binding var page : Int
    var width : CGFloat
    var data : Book
    var body: some View {
        
        VStack {
        VStack {
          /*  Text(self.data.title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20 )
            
            Text(self.data.author)
                .foregroundColor(.gray)
                .padding(.vertical)
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)*/
            
            Image(self.data.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: self.width - (self.page == self.data.id ? 100 : 100), height: (self.page == self.data.id ? 250 : 200))
                .cornerRadius(20)
               
           // Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
               
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 25)
        .background(Color.white)
        .cornerRadius(20)
        .padding(.top, 25)
        .padding(.vertical, self.page == data.id  ? 0 : 25)
        .padding(.horizontal, self.page == data.id  ? 0 : 25)
            
        }
        .frame(width: self.width)
        .animation(.spring())
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
var books = [
    Book(id: 0, image: "image1", title: "Peces y Mas ", author: "Emilio Castro", rating: 3, offset: 0),
    Book(id: 1, image: "image2", title: "Peces y Mas ", author: "Emilio Castro", rating: 3, offset: 0),
    Book(id: 2, image: "image3", title: "Peces y Mas ", author: "Emilio Castro", rating: 3, offset: 0)
    
]

struct PageControl : UIViewRepresentable {
    @Binding var page : Int
    func makeUIView(context: Context) -> UIPageControl {
        let view = UIPageControl()
        view.currentPageIndicatorTintColor = UIColor(Color("orange"))
        view.pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.2)
        view.numberOfPages = books.count
        
        return view
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        DispatchQueue.main.async {
            uiView.currentPage = self.page
        }
    }
}

struct Carousel : UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return Carousel.Coordinator(parent1: self)
    }
    
     var width : CGFloat
    @Binding var page : Int
    var height : CGFloat
    func makeUIView(context: Context) -> UIScrollView {
        
        let total = width * CGFloat(books.count)
        let view = UIScrollView()
        view.isPagingEnabled = true
        view.contentSize = CGSize(width: total, height: 1.0)
        view.bounces = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = context.coordinator
        
        let view1  = UIHostingController(rootView: List(page: self.$page))
        view1.view.frame = CGRect(x: 0, y:0, width: total, height: self.height)
        view1.view.backgroundColor = .clear
        view.addSubview(view1.view)
        return view
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
    
    }
    
    class Coordinator : NSObject, UIScrollViewDelegate {
        var parent : Carousel
        init(parent1: Carousel){
            parent = parent1
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let page = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
            self.parent.page = page
        }
    }
}

