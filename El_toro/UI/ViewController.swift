//
//  ViewController.swift
//  El_toro
//
//  Created by IOSdev on 18/06/2024.
//

import UIKit
import RxSwift
import RxCocoa


class ViewController: UIViewController{
 
    
    
    let pageLabel = UILabel()
    let disposeBag = DisposeBag()
    let viewModel = StocksViewModel()
    var stocks:[stockDetails] = []
    let logoImageView = UIImageView()
    let topGainersBtn = UIButton()
    let allStocksBtn = UIButton()
    let bottomStocksBtn = UIButton()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpUi ()
        setUpButtons()
        viewModel.fetchStock()
               
        
       
    }
   
    
    func dataBinding() {
        APIRequest.apiCalls.fetchData()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: {[weak self] stocks in
                self?.stocks = stocks.results
            }, onError: {error in
                print("Error fetching data: \(error)")
            })
            .disposed(by: disposeBag)
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
        
        topGainersBtn.translatesAutoresizingMaskIntoConstraints = false
        allStocksBtn.translatesAutoresizingMaskIntoConstraints = false
        bottomStocksBtn.translatesAutoresizingMaskIntoConstraints = false
        
        topGainersBtn.configuration = .tinted()
        topGainersBtn.configuration?.title = "TOP MOVERS"
        topGainersBtn.configuration?.image = UIImage(systemName: "arrowshape.up.circle")
        topGainersBtn.configuration?.imagePadding = 6
        topGainersBtn.configuration?.baseForegroundColor = .systemBlue
        topGainersBtn.configuration?.baseBackgroundColor = .systemBlue
        //topGainersBtn.addTarget(self, action: #selector(onTopGains), for: arrowshape.up.circle.touchUpInside)
        
        bottomStocksBtn.configuration = .tinted()
        bottomStocksBtn.configuration?.title = "TOP GAINERS"
        bottomStocksBtn.configuration?.image = UIImage(systemName: "arrowtriangle.up.fill")
        bottomStocksBtn.configuration?.imagePadding = 6
        bottomStocksBtn.configuration?.baseForegroundColor = .systemGreen
        bottomStocksBtn.configuration?.baseBackgroundColor = .systemTeal
        //bottomStocksBtn.addTarget(self, action: #selector(onBottonStocksClicked), for: .touchUpInside)
        
        allStocksBtn.configuration = .tinted()
        allStocksBtn.configuration?.title = "TOP LOSSERS"
        allStocksBtn.configuration?.image = UIImage(systemName: "arrowtriangle.down.fill")
        allStocksBtn.configuration?.imagePadding = 6
        allStocksBtn.configuration?.baseForegroundColor = .systemPink
        allStocksBtn.configuration?.baseBackgroundColor = .systemPink
        //allStocksBtn.addTarget(self, action: #selector(onAllStocksClicked), for: .touchUpInside)
        
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
        
        ])
        
        
    }

   
}






