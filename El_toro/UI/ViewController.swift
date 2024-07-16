//
//  ViewController.swift
//  El_toro
//
//  Created by IOSdev on 18/06/2024.
//

import UIKit
import RxSwift
import RxCocoa


class ViewController: UIViewController,StoinksSelectionDelegate {
 
    
    
    let selectButton = UIButton()
    let pageLabel = UILabel()
    let tableView = UITableView()
    let disposeBag = DisposeBag()
    let viewModel = StocksViewModel()
    var stocks:[stockModel] = []
   

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpUi ()
        setTable()
        viewModel.fetchStock()
        dataBinding()
       
    }
    func selectedStoinks(label: String) {
        pageLabel.text = label    }
    
    func dataBinding(){
        viewModel.stocks
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: {[weak self] stocks in
                self?.stocks = stocks
                self?.tableView.reloadData()})
            .disposed(by: disposeBag)
        
        viewModel.error
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: {error in
                print("eRROR: \(error)")
            })
            .disposed(by: disposeBag)
        
        print("\(stocks) stoinks")
        
    }

    
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
        let stock = (stocks[indexPath.row].results?[indexPath.row])!
        cell.set(stock: stock)
        
        print("\(stock) malenge")
        
     return cell
    }
    
    
}

// test data



