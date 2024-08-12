//
//  ViewController.swift
//  El_toro
//
//  Created by IOSdev on 18/06/2024.
//

import UIKit
import RxSwift
import RxCocoa

protocol StocksSelectionDelegate{
    func selectedStoinks(label:String,data:[stockDetails])
    
}

class ViewController: UIViewController, StocksSelectionDelegate{
    func selectedStoinks(label: String, data: [stockDetails]) {
        
    }
    
 
    
    
    let pageLabel = UILabel()
    let disposeBag = DisposeBag()
    let viewModel = StocksViewModel()
    var stocks:[stockDetails] = []
    let logoImageView = UIImageView()
    let topGainersBtn = UIButton()
    let allStocksBtn = UIButton()
    let bottomStocksBtn = UIButton()
    let expensiveStocksBtn = UIButton()
    let baseUrlInstance = baseURL() 

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpUi ()
        setUpButtons()
        
       
        
                           
    }
   
    
    @objc func onAllStocksClicked(){
        
        let vc = DisplayTablesVC()
        vc.pageTitle = "TOP LOSSERS"
        vc.category = "loss"
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @objc func cheapStocksClicked(){
        
        let vc = DisplayTablesVC()
        vc.pageTitle = "CHEAP STOCK OPTIONS"
        vc.category = "cheap"
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @objc func expensiveStocksClicked(){
        
        let vc = DisplayTablesVC()
        vc.pageTitle = "EXPENSIVE STOCK OPTIONS"
        vc.category = "expensive"
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @objc func moverStocksClicked(){
        
        let vc = DisplayTablesVC()
        vc.pageTitle = "TOP MOVERS"
        vc.category = "movers"
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

    
    func setUpUi (){
        let logoImage = UIImage(named: "logo.jpeg")
        logoImageView.image = logoImage
        view.addSubview(pageLabel)
        view.addSubview(logoImageView)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
               pageLabel.translatesAutoresizingMaskIntoConstraints = false
     
        
        pageLabel.text = "WELCOME TO EL TORRRO!"
        pageLabel.textAlignment = .center
        pageLabel.textColor = .systemRed
        
        
        //add constraints
        
        NSLayoutConstraint.activate([
                   
            
            pageLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            pageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pageLabel.heightAnchor.constraint(equalToConstant: 60),
            pageLabel.widthAnchor.constraint(equalToConstant: 300),
            
            logoImageView.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: pageLabel.bottomAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 300),        ])
        
    }
    
  
    
    func setUpButtons(){
        view.addSubview(topGainersBtn)
        view.addSubview(allStocksBtn)
        view.addSubview(bottomStocksBtn)
        view.addSubview(expensiveStocksBtn)
        
        topGainersBtn.translatesAutoresizingMaskIntoConstraints = false
        allStocksBtn.translatesAutoresizingMaskIntoConstraints = false
        bottomStocksBtn.translatesAutoresizingMaskIntoConstraints = false
    expensiveStocksBtn.translatesAutoresizingMaskIntoConstraints = false
        
        
        topGainersBtn.configuration = .tinted()
        topGainersBtn.configuration?.title = "TOP MOVERS"
        topGainersBtn.configuration?.image = UIImage(systemName: "arrowtriangle.up.fill")
        topGainersBtn.configuration?.imagePadding = 6
        topGainersBtn.configuration?.baseForegroundColor = .systemTeal
        topGainersBtn.configuration?.baseBackgroundColor = .systemTeal
        topGainersBtn.addTarget(self, action: #selector(moverStocksClicked), for: .touchUpInside)
        
        
        bottomStocksBtn.configuration = .tinted()
        bottomStocksBtn.configuration?.title = "CHEAP STOCKS"
        bottomStocksBtn.configuration?.image = UIImage(systemName: "square.fill")
        bottomStocksBtn.configuration?.imagePadding = 6
        bottomStocksBtn.configuration?.baseForegroundColor = .systemGray
        bottomStocksBtn.configuration?.baseBackgroundColor = .systemGray
        bottomStocksBtn.addTarget(self, action: #selector(cheapStocksClicked), for: .touchUpInside)
        
        allStocksBtn.configuration = .tinted()
        allStocksBtn.configuration?.title = "TOP LOSSERS"
        allStocksBtn.configuration?.image = UIImage(systemName: "arrowtriangle.down.fill")
        allStocksBtn.configuration?.imagePadding = 6
        allStocksBtn.configuration?.baseForegroundColor = .systemPink
        allStocksBtn.configuration?.baseBackgroundColor = .systemPink
        allStocksBtn.addTarget(self, action: #selector(onAllStocksClicked), for: .touchUpInside)
        
        expensiveStocksBtn.configuration = .tinted()
        expensiveStocksBtn.configuration?.title = "PRICEY STOCKS"
        expensiveStocksBtn.configuration?.image = UIImage(systemName: "dollarsign.square.fill")
        expensiveStocksBtn.configuration?.imagePadding = 6
        expensiveStocksBtn.configuration?.baseForegroundColor = .systemBrown
        expensiveStocksBtn.configuration?.baseBackgroundColor = .systemBrown
        expensiveStocksBtn.addTarget(self, action: #selector(expensiveStocksClicked), for: .touchUpInside)
        
        //add constraints of each
        
        NSLayoutConstraint.activate([
            
            allStocksBtn.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            allStocksBtn.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            allStocksBtn.heightAnchor.constraint(equalToConstant: 30),
            allStocksBtn.widthAnchor.constraint(equalToConstant: 200),
            
            
            topGainersBtn.topAnchor.constraint(equalTo: allStocksBtn.bottomAnchor, constant: 20),
            topGainersBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topGainersBtn.heightAnchor.constraint(equalToConstant: 30),
            topGainersBtn.widthAnchor.constraint(equalToConstant: 200),
            
            bottomStocksBtn.topAnchor.constraint(equalTo: topGainersBtn.bottomAnchor, constant: 20),
            bottomStocksBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomStocksBtn.heightAnchor.constraint(equalToConstant: 30),
            bottomStocksBtn.widthAnchor.constraint(equalToConstant: 200),
            
            expensiveStocksBtn.topAnchor.constraint(equalTo: bottomStocksBtn.bottomAnchor, constant: 20),
            expensiveStocksBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            expensiveStocksBtn.heightAnchor.constraint(equalToConstant: 30),
            expensiveStocksBtn.widthAnchor.constraint(equalToConstant: 200),
        
        ])
        
        
    }

   
}







