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
    let tableView = UITableView()
    var stocks:[stock] = []
   

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpUi ()
        setTable()
        stocks = getStocks()
       
       
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
    
    func setTable (){
        view.addSubview(tableView)
        setTableDelegates()
        tableView.rowHeight = 60
        tableView.register(StocksCell.self, forCellReuseIdentifier: "stocksCell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: pageLabel.bottomAnchor, constant: 12),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        ])
        
        
        
    }
    
    func setTableDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    

   
}
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stocksCell") as! StocksCell
        let stock = stocks[indexPath.row]
        cell.set(stock: stock)
        
        return cell
    }
    
    
}

// test data

extension ViewController {
    func getStocks() -> [stock]{
        let stock1 = stock(T: "TANH", o: "24.5")
        let stock2 = stock(T: "VSAT", o: "34.9")
        let stock3 = stock(T: "VSdd", o: "30.9")
        let stock4 = stock(T: "VSvs", o: "44.9")
        let stock5 = stock(T: "AAPL", o: "654.9")
        let stock6 = stock(T: "TANH", o: "24.5")
        let stock7 = stock(T: "VSAT", o: "34.9")
        let stock8 = stock(T: "VSdd", o: "30.9")
        let stock9 = stock(T: "VSvs", o: "44.9")
        let stock10 = stock(T: "AAPL", o: "654.9")
        
        return [stock1,stock2,stock3,stock4,stock5,stock6,stock7,stock8,stock9,stock10]
        
    }
}


