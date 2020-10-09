//
//  ImageFetcher.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/7/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//
import Foundation
import SwiftUI

import Combine

class ImageFetcher : ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data : Data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    init(urlString: String){
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url){ (data,_,_)in
            guard let data = data else { return }
            
            DispatchQueue.main.async { [weak self] in
                self?.data = data
            }
        }.resume()
    }
}

