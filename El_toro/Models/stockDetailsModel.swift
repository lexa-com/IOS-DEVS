//
//  stockDetailsModel.swift
//  El_toro
//
//  Created by IOSdev on 21/08/2024.
//

import Foundation

struct stockMoreDetails: Codable{
    
    var name:String?
    var sic_description:String?
    var homepage_url:String?
    var list_date:String?
    var branding:branding?
    var description:String?
}
struct branding: Codable {
    var icon_url:String?
}
struct tickerModel : Codable{
    var results :stockMoreDetails
}
