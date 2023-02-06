//
//  ApplicationController.swift
//  MVVMPokedex
//
//  Created by Fredy lopez on 2/1/23.
//

import Foundation

class ApplicationController {
    
    let network = NetworkManager()
    
    static func mock() -> ApplicationController {
        ApplicationController()
    }
    
}
