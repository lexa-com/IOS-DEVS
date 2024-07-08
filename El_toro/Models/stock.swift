//
//  stock.swift
//  El_toro
//
//  Created by IOSdev on 04/07/2024.
//

import UIKit

struct stock: Codable {
    
    var queryCount: Float
    var resultsCount : Float
    var adjusted : Bool
    var results :[stockDetails]
    var status : String
}

struct stockDetails: Codable{
    
    var T : String //exchange symbol
    var c : Float // close price
    var h : Float //highest price for the symbol
    var l : Float //lowest price for the symbol
    var o : Float //open price for the symbol
    var v : Float //Trading volume
    
}
