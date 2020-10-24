//
//  GlobalInfo.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/20/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

class GlobalInfo : ObservableObject {
    @Published var token = ""
    @Published var nombres = ""
    @Published var apellidos = ""
    @Published var id_customer = 0
    @Published var email = ""
    init(){
        
    }
}
