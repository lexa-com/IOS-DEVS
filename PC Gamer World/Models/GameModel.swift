//
//  GameModel.swift
//  PC Gamer World
//
//  Created by IOSdev on 18/09/2024.
//

import Foundation

struct GameResponse:Codable{
    let results:[GameModel]
    
}
struct GameModel:Codable,Identifiable,Hashable{
    let name:String
    let id: Int
    let released:String
    let background_image:String
    let rating:Float
    let rating_top:Float
    let platforms:[platform]
}
struct platform:Codable,Hashable{
    let requirements_en: systemRequirements?
}
struct systemRequirements:Codable,Hashable {
    let minimum: String
    let recommended : String?
}
