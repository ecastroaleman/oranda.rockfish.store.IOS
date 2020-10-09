//
//  ActivityIndicator.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/7/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

struct ActivityIndicator : UIViewRepresentable {
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>){
        uiView.startAnimating()
    }
    
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator(style: .medium)
    }
}
