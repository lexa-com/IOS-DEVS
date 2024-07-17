//
//  StoinksVC.swift
//  El_toro
//
//  Created by IOSdev on 25/06/2024.
//

import UIKit

protocol StoinksSelectionDelegate{
    func selectedStoinks(label:String,method:String)
    
}

class StoinksVC: UIViewController {
    
    let topGainersBtn = UIButton()
    let allStocksBtn = UIButton()
    let bottomStocksBtn = UIButton()
    
    var delegate: StoinksSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpUI()

        
    }
    
    @objc func onTopGains(){
        delegate?.selectedStoinks(label: "TOP STOINKS",method: "top")
        dismiss(animated: true)
        
    }
    @objc func onAllStocksClicked(){
        delegate?.selectedStoinks(label: "ALL STOINKS", method: "all")
        dismiss(animated: true)
        
    }
    @objc func onBottonStocksClicked(){
        delegate?.selectedStoinks(label: "BOTTOM STOINKS", method: "bottom")
        dismiss(animated: true)
        
    }
    func setUpUI(){
        view.addSubview(topGainersBtn)
        view.addSubview(allStocksBtn)
        view.addSubview(bottomStocksBtn)
        
        topGainersBtn.translatesAutoresizingMaskIntoConstraints = false
        allStocksBtn.translatesAutoresizingMaskIntoConstraints = false
        bottomStocksBtn.translatesAutoresizingMaskIntoConstraints = false
        
        topGainersBtn.configuration = .tinted()
        topGainersBtn.configuration?.title = "TOP STOINKS"
        topGainersBtn.configuration?.image = UIImage(systemName: "iphone")
        topGainersBtn.configuration?.imagePadding = 6
        topGainersBtn.configuration?.baseForegroundColor = .systemBlue
        topGainersBtn.configuration?.baseBackgroundColor = .systemBlue
        topGainersBtn.addTarget(self, action: #selector(onTopGains), for: .touchUpInside)
        
        bottomStocksBtn.configuration = .tinted()
        bottomStocksBtn.configuration?.title = "CHEAP STOINKS"
        bottomStocksBtn.configuration?.image = UIImage(systemName: "star")
        bottomStocksBtn.configuration?.imagePadding = 6
        bottomStocksBtn.configuration?.baseForegroundColor = .systemTeal
        bottomStocksBtn.configuration?.baseBackgroundColor = .systemTeal
        bottomStocksBtn.addTarget(self, action: #selector(onBottonStocksClicked), for: .touchUpInside)
        
        allStocksBtn.configuration = .tinted()
        allStocksBtn.configuration?.title = "ALL STOINKS"
        allStocksBtn.configuration?.image = UIImage(systemName: "star")
        allStocksBtn.configuration?.imagePadding = 6
        allStocksBtn.configuration?.baseForegroundColor = .systemPink
        allStocksBtn.configuration?.baseBackgroundColor = .systemPink
        allStocksBtn.addTarget(self, action: #selector(onAllStocksClicked), for: .touchUpInside)
        
        //add constraints of each
        
        NSLayoutConstraint.activate([
            
            allStocksBtn.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            allStocksBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
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
