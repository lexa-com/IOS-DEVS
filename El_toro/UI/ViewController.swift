//
//  ViewController.swift
//  El_toro
//
//  Created by IOSdev on 18/06/2024.
//

import UIKit

class ViewController: UIViewController,StoinksSelectionDelegate {
 
    
   
    
    
    let selectButton = UIButton()
    let pageLabel = UILabel()
    let tableItem = UIView()
    let scrollView = UIScrollView()
    var stocksLabel = UILabel()
    var stocksPrice = UILabel()
    var stocksGrowth = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpUi ()
        configureTable()
        setUpScrollView()
    }
    func selectedStoinks(label: String) {
        pageLabel.text = label    }

    
    @objc func openStoinks(){
        let destinationVC = StoinksVC()
        destinationVC.delegate = self
        destinationVC.modalPresentationStyle = .pageSheet
        destinationVC.sheetPresentationController?.detents = [.medium()]
        destinationVC.sheetPresentationController?.prefersGrabberVisible = true
        present(destinationVC, animated: true)
    }
    
    func setUpUi (){
        view.addSubview(selectButton)
        view.addSubview(pageLabel)
              
        
        pageLabel.translatesAutoresizingMaskIntoConstraints = false
        selectButton.translatesAutoresizingMaskIntoConstraints = false
        
        pageLabel.text = "WELCOME TO EL TORRRO!"
        pageLabel.textAlignment = .center
        pageLabel.textColor = .systemRed
        
        //button config
        
        selectButton.configuration = .tinted()
        //selectButton.configuration?.title = "MORE .."
        selectButton.configuration?.image = UIImage(systemName: "plus")
        selectButton.configuration?.imagePadding = 6
        selectButton.configuration?.baseForegroundColor = .systemBlue
        selectButton.configuration?.baseBackgroundColor = .systemBlue
        selectButton.addTarget(self, action: #selector(openStoinks), for: .touchUpInside)
        
        //add constraints
        
        NSLayoutConstraint.activate([
            selectButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            selectButton.rightAnchor.constraint(equalTo:view.rightAnchor,constant: -20),
            selectButton.heightAnchor.constraint(equalToConstant: 40),
            selectButton.widthAnchor.constraint(equalToConstant: 80),
            
            
            pageLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            pageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pageLabel.heightAnchor.constraint(equalToConstant: 60),
            pageLabel.widthAnchor.constraint(equalToConstant: 300),
        ])
        
    }
    
    func setUpScrollView (){
        view.addSubview(scrollView)
        scrollView.addSubview(tableItem)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: pageLabel.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        
       
        
        
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
            stocksLabel.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 20),
            stocksLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stocksLabel.heightAnchor.constraint(equalToConstant: 60),
           // stocksLabel.widthAnchor.constraint(equalToConstant: 40),
            
            stocksPrice.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: -80),
            stocksPrice.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stocksPrice.heightAnchor.constraint(equalToConstant: 60),
            //stocksPrice.widthAnchor.constraint(equalToConstant: 40),
        
            stocksGrowth.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: -20),
            stocksGrowth.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stocksGrowth.heightAnchor.constraint(equalToConstant: 60),
            //stocksGrowth.widthAnchor.constraint(equalToConstant: 40),  
        ])
    }
}




