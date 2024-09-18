//
//  numberFormatter.swift
//  PC Gamer World
//
//  Created by IOSdev on 18/09/2024.
//

import Foundation

extension Float {
    private var ratingConverter:NumberFormatter {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        return formatter
    }
    
    func rateFormat()->String{
        return ratingConverter.string(for: self) ?? "N/A"
    }
}
