//
//  SlidersList.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/22/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

final class SlidersList : ObservableObject{
    
    init(){
        fetchPosts()
    }
  
  @Published var posts = [Sliders]() {
        didSet {
            didChange.send(self)
        }
    }
    public func fetchPosts(){
     let imprime = getSlides().request2(endpoint: ""){ ret, res in
            print(" Si trae datos -> \(ret.Slides[0].title)")
            print("y Respuesta es -> "+res)
         //   if (!self.posts.isEmpty){
            self.posts = [ret]
            return
          //  }
        }
      print(imprime)
    }
    
   
     
    let didChange = PassthroughSubject<SlidersList, Never>()
}
