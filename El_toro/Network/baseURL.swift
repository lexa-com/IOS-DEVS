//
//  baseURL.swift
//  El_toro
//
//  Created by IOSdev on 09/07/2024.
//

import Foundation

class baseURL{
    var baseURL = "https://api.polygon.io/v2/aggs/grouped/locale/us/market/stocks/"
    let apiKey  = "lay6xs6VrvXrFPmQVEm7O2i6EpaoVaH9"
    
    let todayDate = Date()
    
        
    func dateFormatter()->String{
        
        let date = Date()
        
        let dateToday = Calendar.current.date(byAdding: .day, value: -3, to: date) ?? date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let apiDate = dateFormatter.string(from:dateToday)
        return apiDate
    }
    
}
