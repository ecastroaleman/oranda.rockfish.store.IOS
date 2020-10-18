//
//  CustomCorner.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/2/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI


struct CustomCorner : Shape {
    var corner : UIRectCorner
    var size : CGFloat
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: size, height: size))
        
        return Path(path.cgPath)
    }
}

struct CustomCorner2: Shape {
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [.topLeft, .topRight],cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}
