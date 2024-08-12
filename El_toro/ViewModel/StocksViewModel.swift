//
//  StocksViewModel.swift
//  El_toro
//
//  Created by IOSdev on 16/07/2024.
//

import Foundation
import RxSwift
import RxCocoa

class StocksViewModel {
    let disposeBag = DisposeBag()
    let stocks: PublishSubject<[stockModel]> = PublishSubject()
    let error: PublishSubject<Error> = PublishSubject()
    
    func fetchStock(){

        APIRequest.apiCalls.fetchData()
            .subscribe(
                onNext: {[weak self] stocks in
                    self?.stocks.onNext([stocks])
                    
                },
                onError: {[weak self] error in
                    self?.error.onNext(error)
                }
            )
            .disposed (by: disposeBag)
    }
    
}
