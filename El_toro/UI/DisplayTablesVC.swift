//
//  DisplayTablesVC.swift
//  El_toro
//
//  Created by IOSdev on 29/07/2024.
//

import UIKit
import RxSwift
import RxCocoa

class DisplayTablesVC: UIViewController {
    
    let pageLabel = UILabel()
    let tablesView = UITableView()
    var stocks:[stockDetails] = []
    let disposeBag = DisposeBag()
    let viewModel = StocksViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    func dataBinding() {
        APIRequest.apiCalls.fetchData()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: {[weak self] stocks in
                self?.stocks = stocks.results
                //self?.tableView.reloadData()
            }, onError: {error in
                print("Error fetching data: \(error)")
            })
            .disposed(by: disposeBag)
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
        return stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "stocksCell") as! StocksCell
        let stock = (stocks[indexPath.row])
        cell.set(stock: stock)
        
     return cell
    }
    
    
}
