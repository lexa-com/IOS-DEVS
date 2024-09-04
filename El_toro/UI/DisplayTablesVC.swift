//
//  DisplayTablesVC.swift
//  El_toro
//
//  Created by IOSdev on 29/07/2024.
//

import UIKit
import RxSwift
import RxCocoa

class DisplayTablesVC: UIViewController{
    
    
    let pageLabel = UILabel()
    var pageTitle: String!
    var category: String!
    let tablesView = UITableView()
    var stocks:[stockDetails] = []
    var stocksData:[stockDetails]!
    let disposeBag = DisposeBag()
    let viewModel = StocksViewModel()
    var delegate: StocksSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setLabel()
        setTable()
        viewModel.fetchStock()
        dataBinding()
       // print("\(String(describing: stocksData)) malengee")

       
    }
    
    func dataBinding() {
        APIRequest.apiCalls.fetchData()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: {[weak self] stocks in
                
               // print("\(stocks) data binding")
                                
                let volumeStocks = stocks.results.sorted(by: { $0.v > $1.v})
                let expesiveStocks = stocks.results.sorted(by: { $0.c > $1.c})
                let cheapStocks = stocks.results.sorted(by: { $0.c < $1.c})
                let gainers = stocks.results.filter{$0.c > $0.o}
                let sortGainers = gainers.sorted{
                    let firtsGain = $0.c - $0.o
                    let secondGain = $1.c - $1.o
                    
                    return firtsGain > secondGain
                    
                }
                if self?.category == "loss"{
                    self?.stocks = sortGainers
                    self?.tablesView.reloadData()
                }
                if self?.category == "movers"{
                    self?.stocks = volumeStocks
                    self?.tablesView.reloadData()
                }
                if self?.category == "expensive"{
                    self?.stocks = expesiveStocks
                    self?.tablesView.reloadData()
                }
                if self?.category == "cheap"{
                    self?.stocks = cheapStocks
                    self?.tablesView.reloadData()
                }
                
                
            }, onError: {error in
                print("Error fetching data: \(error)")
            })
            .disposed(by: disposeBag)
        
        //print("\(stocks) malengeess")
    }
    
    
    func setLabel (){
        
        view.addSubview(pageLabel)
        pageLabel.translatesAutoresizingMaskIntoConstraints = false

 
 
 pageLabel.textAlignment = .center
 pageLabel.textColor = .systemRed
        pageLabel.text = pageTitle
 
 //add constraints
 
 NSLayoutConstraint.activate([
            
     
     pageLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor),
     pageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
     pageLabel.heightAnchor.constraint(equalToConstant: 60),
     pageLabel.widthAnchor.constraint(equalToConstant: 300),
     ])
 
}

    
    func setTable (){
        view.addSubview(tablesView)
        setdelegates()
        tablesView.rowHeight = 60
        tablesView.register(StocksCell.self, forCellReuseIdentifier: "stocksCell")
        
        tablesView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tablesView.topAnchor.constraint(equalTo: pageLabel.bottomAnchor, constant: 12),
            tablesView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            tablesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tablesView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        ])
        
        
        
    }
    func setdelegates(){
        tablesView.delegate = self
        tablesView.dataSource = self
        
        
    }
}
extension DisplayTablesVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(stocks.count)
        return stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "stocksCell") as! StocksCell
        let stock = (stocks[indexPath.row])
        cell.set(stock: stock)
        
     return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewControl = StockDetailsViewController()
        viewControl.stockName = stocks[indexPath.row]
        self.navigationController?.pushViewController(viewControl, animated: true)
    }
}
