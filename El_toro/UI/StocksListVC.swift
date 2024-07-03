//
//  StocksListVC.swift
//  El_toro
//
//  Created by IOSdev on 02/07/2024.
//

import UIKit

class StocksListVC: UIViewController {
    
    var stocksLabel = UILabel()
    var stocksPrice = UILabel()
    var stocksGrowth = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
       
    }
    
    func configureTable() {
        view.addSubview(stocksLabel)
        view.addSubview(stocksPrice)
        view.addSubview(stocksGrowth)
        
        stocksLabel.translatesAutoresizingMaskIntoConstraints = false
        stocksPrice.translatesAutoresizingMaskIntoConstraints = false
        stocksGrowth.translatesAutoresizingMaskIntoConstraints = false
        
        stocksLabel.text = "AAFL"
        stocksLabel.textColor = .black
        stocksLabel.textAlignment = .justified
        
        stocksPrice.text = "$20.24"
        stocksPrice.textColor = .systemPink
        
        stocksGrowth.text = "2.2%"
        stocksGrowth.textColor = .systemGreen
        
        NSLayoutConstraint.activate([
            stocksLabel.centerXAnchor.constraint(equalTo:view.leadingAnchor),
            stocksLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stocksLabel.heightAnchor.constraint(equalToConstant: 60),
            stocksLabel.widthAnchor.constraint(equalToConstant: 40),
            
            stocksPrice.centerXAnchor.constraint(equalTo:view.trailingAnchor),
            stocksPrice.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stocksPrice.heightAnchor.constraint(equalToConstant: 60),
            stocksPrice.widthAnchor.constraint(equalToConstant: 40),        
        
            stocksGrowth.centerXAnchor.constraint(equalTo:view.leadingAnchor),
            stocksGrowth.topAnchor.constraint(equalTo: stocksPrice.bottomAnchor),
            stocksGrowth.heightAnchor.constraint(equalToConstant: 60),
            stocksGrowth.widthAnchor.constraint(equalToConstant: 40),        ])
    }
}
