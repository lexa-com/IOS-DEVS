//
//  StocksCell.swift
//  El_toro
//
//  Created by IOSdev on 04/07/2024.
//

import UIKit

class StocksCell: UITableViewCell {
    
    var T = UILabel()
    var o = UILabel()
    var stocksGrowth = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(T)
        addSubview(o)
        addSubview(stocksGrowth)
        
        configureTable()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(stock: stock){
        T.text = stock.T
        o.text = stock.o
    }
    
    func configureTable() {
        
        
        T.textColor = .black
        T.textAlignment = .justified
        
        
        o.textColor = .systemPink
        
        
        stocksGrowth.text = "2.2%"
        stocksGrowth.textColor = .systemGreen
        
    
            
    }
    
    func setConstraints(){
        T.translatesAutoresizingMaskIntoConstraints = false
        T.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        T.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20).isActive = true
        T.heightAnchor.constraint(equalToConstant: 60).isActive = true
        T.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        o.translatesAutoresizingMaskIntoConstraints = false
        o.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        o.heightAnchor.constraint(equalToConstant: 60).isActive = true
        o.widthAnchor.constraint(equalToConstant: 60).isActive = true
        //o.leadingAnchor.constraint(equalTo: T.trailingAnchor, constant: 50).isActive = true
        
        o.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
    
}
