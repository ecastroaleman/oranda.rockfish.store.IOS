//
//  nUsuarioErrorResponse.swift
//  OrandaStore
//
//  Created by Emilio Castro on 9/28/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import Foundation

struct ErrorResponse: Decodable, LocalizedError {
    let error: String
    var error_description: String?{return error}
}
 
