//
//  TickerDetailsViewModel.swift
//  El_toro
//
//  Created by IOSdev on 21/08/2024.
//

import Foundation
import RxSwift
import RxCocoa

class TickerDetailsViewModel {
    let disposeBag = DisposeBag()
    let stocks: PublishSubject<[tickerModel]> = PublishSubject()
    let error: PublishSubject<Error> = PublishSubject()
    
    func fetchStock(ticker:String){

        APIRequest.apiCalls.getStockDetails(ticker: ticker)
            .subscribe(
                onNext: {[weak self] stocks in
                    self?.stocks.onNext([stocks])
                   // print(stocks.results)
                    
                },
                onError: {[weak self] error in
                    self?.error.onNext(error)
                }
            )
            .disposed (by: disposeBag)
    }
    
}
