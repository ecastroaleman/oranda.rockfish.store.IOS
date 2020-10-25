//
//  BlurView.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/25/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIVisualEffectView{
        let effect = UIBlurEffect(style: .systemMaterialDark)
        let view = UIVisualEffectView(effect: effect)
        return view
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<BlurView>) {
    
    }
}

struct Indicator : UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<Indicator>) -> UIActivityIndicatorView {
        let indi = UIActivityIndicatorView(style: .large)
        indi.color = UIColor.white
        indi.startAnimating()
        return indi
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Indicator>) {
    
    }
}

struct Loading : View {
    
    var body : some View {
        ZStack {
            BlurView()
            VStack{
                Indicator()
                Text("Cargado . . .").foregroundColor(Color("orange")).padding(.top,8)
            }
        }.frame(width: .infinity, height: 250)
    }
}

struct BlurView_Previews: PreviewProvider {
    static var previews: some View {
       Loading()
    }
}
