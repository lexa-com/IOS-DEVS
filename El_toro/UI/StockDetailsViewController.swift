//
//  StockDetailsViewController.swift
//  El_toro
//
//  Created by IOSdev on 21/08/2024.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftUI

class StockDetailsViewController: UIViewController {
    
    var stockName:stockDetails!
    var pageLabel=UILabel()
    let disposeBag = DisposeBag()
    let viewModel = TickerDetailsViewModel()
    var tickers:tickerModel!
    var name = UILabel()
    var homeUrl = UILabel()
    var listingDate = UILabel()
    var aboutCompany = UILabel()
    var logo = UIImageView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //setLabel ()
        viewModel.fetchStock(ticker: stockName.T)
        dataBinding()
        
    }
    func setLabel (){
        view.addSubview(pageLabel)
        pageLabel.translatesAutoresizingMaskIntoConstraints = false

 
 
 pageLabel.textAlignment = .center
 pageLabel.textColor = .systemRed
 pageLabel.text = stockName.T
 
 //add constraints
 
 NSLayoutConstraint.activate([
            
     
     pageLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor),
     pageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
     pageLabel.heightAnchor.constraint(equalToConstant: 60),
     pageLabel.widthAnchor.constraint(equalToConstant: 300),
     ])
 
}
    
    func dataBinding() {
        APIRequest.apiCalls.getStockDetails(ticker: stockName.T)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: {[weak self] stocks in
                self?.tickers = stocks
                self?.setUpUI(test: stocks)
               // print("\(String(describing: self?.tickers)) malengee ")
                    
            }, onError: {error in
                print("Error fetching data: \(error)")
            })
            .disposed(by: disposeBag)
        
    }
    func setUpUI(test:tickerModel){
        
        
        
        
        view.addSubview(name)
        view.addSubview(homeUrl)
        view.addSubview(listingDate)
        view.addSubview(aboutCompany)
        view.addSubview(logo)
        
        logo.image = UIImage()
        
        
        name.textAlignment = .left
        name.textColor = .systemCyan
        name.text = "Company Name:    \(test.results.name ?? "not found!")"
        name.numberOfLines = .max
        name.font = .boldSystemFont(ofSize: 20)
        
        aboutCompany.textAlignment = .natural
        aboutCompany.textColor = .systemBlue
        aboutCompany.text = test.results.description ?? " profile not found!"
        aboutCompany.numberOfLines = .max
        
        listingDate.textAlignment = .left
        listingDate.textColor = .systemPink
        listingDate.text = "Date of Listing:   \(test.results.list_date ?? "listing date not found!")"
        
        homeUrl.textAlignment = .left
        homeUrl.textColor = .systemBlue
        homeUrl.text = "Company Link:   \(test.results.homepage_url ?? "No Link found!!")"
        
        name.translatesAutoresizingMaskIntoConstraints = false
        aboutCompany.translatesAutoresizingMaskIntoConstraints = false
        listingDate.translatesAutoresizingMaskIntoConstraints = false
        homeUrl.translatesAutoresizingMaskIntoConstraints = false
        logo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.heightAnchor.constraint(equalToConstant: 200),
            logo.widthAnchor.constraint(equalToConstant: 200),
            
            
            name.leadingAnchor.constraint(equalTo:view.leadingAnchor),
            name.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 20),
            name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            listingDate.leadingAnchor.constraint(equalTo:view.leadingAnchor),
            listingDate.topAnchor.constraint(equalTo: name.topAnchor, constant: 40),
            listingDate.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            homeUrl.leadingAnchor.constraint(equalTo:view.leadingAnchor),
            homeUrl.topAnchor.constraint(equalTo: listingDate.topAnchor, constant: 40),
            homeUrl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
           
            aboutCompany.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 10),
            aboutCompany.topAnchor.constraint(equalTo: homeUrl.topAnchor, constant: 60),
            aboutCompany.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            
        ])
        
    }
    
}
