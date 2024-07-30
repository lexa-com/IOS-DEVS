//
//  StocksCell.swift
//  El_toro
//
//  Created by IOSdev on 04/07/2024.
//

import UIKit

class StocksCell: UITableViewCell {
    
    var symbolName = UILabel()
    var openPrice = UILabel()
    var closePrice = UILabel()
    var change = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(symbolName)
        addSubview(openPrice)
        addSubview(closePrice)
        addSubview(change)
        
        configureTable()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(stock: stockDetails){
        
        let percentageChange = (stock.o - stock.c)
        
        change.text = String(format: "%.2f",percentageChange)
        symbolName.text = String(stock.T)
        openPrice.text = String(format: "%.2f",stock.o)
        closePrice.text = String(format: "%.2f",stock.c)
    }
    
    func configureTable() {
        
        
        symbolName.textAlignment = .justified
        
        
        openPrice.textColor = .systemPink
                
        change.textColor = .systemGreen
        
    
            
    }
    
    func setConstraints(){
        symbolName.translatesAutoresizingMaskIntoConstraints = false
        symbolName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        symbolName.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20).isActive = true
        symbolName.heightAnchor.constraint(equalToConstant: 60).isActive = true
        symbolName.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        openPrice.translatesAutoresizingMaskIntoConstraints = false
        openPrice.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        openPrice.heightAnchor.constraint(equalToConstant: 60).isActive = true
        // openPrice.widthAnchor.constraint(equalToConstant: 60).isActive = true
        openPrice.trailingAnchor.constraint(equalTo: closePrice.leadingAnchor, constant: -10).isActive = true
        
        closePrice.translatesAutoresizingMaskIntoConstraints = false
        closePrice.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        closePrice.heightAnchor.constraint(equalToConstant: 60).isActive = true
        //closePrice.widthAnchor.constraint(equalToConstant: 60).isActive = true
        closePrice.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -120).isActive = true
        
        change.translatesAutoresizingMaskIntoConstraints = false
        change.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        change.heightAnchor.constraint(equalToConstant: 60).isActive = true
        //closePrice.widthAnchor.constraint(equalToConstant: 60).isActive = true
        change.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        
    }
    
}
