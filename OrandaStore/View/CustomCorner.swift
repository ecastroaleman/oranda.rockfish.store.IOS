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
struct CustomShape : Shape {
    @Binding var min : CGFloat
    func path(in rect: CGRect) -> Path {
        return Path{ path in
            path.move(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 35, y: rect.height))
            path.addLine(to: CGPoint(x: 35, y: 0))
            path.move(to: CGPoint(x: 35, y: min-15))
            path.addQuadCurve(to: CGPoint(x: 35, y: min+90), control: CGPoint(x: -35, y: min+35))
            
            
            
        }
    }
}
