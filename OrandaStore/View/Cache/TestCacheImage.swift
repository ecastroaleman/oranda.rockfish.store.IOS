//
//  TestCacheImage.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/25/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

struct TestCacheImage: View {
    var body: some View {
        HStack{
            UrlImageView(urlString: "http://localhost/oauth3/api-img.php?id=/29/28")
                .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(color: .black, radius: 10, x: -5, y: 5)
                
        }
       /* VStack{
       TextShimmer2()
        }*/
    }
}

struct TestCacheImage_Previews: PreviewProvider {
    static var previews: some View {
        TestCacheImage()
    }
}

struct TextShimmer2 : View {
    @State var show = false
    var body : some View {
        
        ZStack {
            Color("bg").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
        ZStack{
            
            Text("Oranda RockFish Store")
                .font(.system(size: 30))
            //    .fontWeight(.semibold)
                .foregroundColor(Color("orange").opacity(0.4))
            
            Text("Oranda RockFish Store")
                .font(.system(size: 30))
            //    .fontWeight(.semibold)
                .foregroundColor(.white)
                .mask(
                Capsule()
                    .fill(LinearGradient(gradient: .init(colors: [.clear,.white,.clear]), startPoint: .top, endPoint: .bottom))
                    .rotationEffect(.init(degrees: 30))
                    .offset(x: self.show ? 190 : -130)
                   
                )
            
            
        }
        }.onAppear{
            
            withAnimation(Animation.default.speed(0.1).delay(0).repeatForever(autoreverses: false )){
                self.show.toggle()
            }
        }
    }
}
