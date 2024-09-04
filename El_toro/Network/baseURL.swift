//
//  baseURL.swift
//  El_toro
//
//  Created by IOSdev on 09/07/2024.
//

import Foundation

class baseURL{
    var baseURL = "https://api.polygon.io/v2/aggs/grouped/locale/us/market/stocks/"
    var tickersURL = "https://api.polygon.io/v3/reference/tickers/"
    let apiKey  = "lay6xs6VrvXrFPmQVEm7O2i6EpaoVaH9"
    
    let todayDate = Date()
    
    
        
    func dateFormatter()->String{
        
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let removedDays:Int
    
        switch Calendar.current.component(.weekday, from: date){
        case 7:
            removedDays = 2
        case 2:
            removedDays = 3
        default:
            removedDays = 1
        }
        let dateToday = Calendar.current.date(byAdding: .day, value: -removedDays, to: date) ?? date
        let apiDate = dateFormatter.string(from:dateToday)
        return apiDate
    }
    
    
}
