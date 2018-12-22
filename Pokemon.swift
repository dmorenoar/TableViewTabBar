//
//  Pokemon.swift
//  TableViewTabBar
//
//  Created by dmorenoar on 22/12/18.
//  Copyright © 2018 DAM. All rights reserved.
//

import Foundation
import UIKit

class Pokemon : Codable {
    
    var nombre:String
    var tipo:String
    var stats:[String:Int] = [String:Int]()
    var imagen:String
    
    init(nombre:String, tipo:String, stats:[String:Int], imagen:String) {
        self.nombre = nombre
        self.tipo = tipo
        self.stats = stats
        self.imagen = imagen
    }
    
    
    
}
