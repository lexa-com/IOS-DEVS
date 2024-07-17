//
//  APIRequest.swift
//  El_toro
//
//  Created by IOSdev on 09/07/2024.
//

import Foundation
import RxSwift
import RxCocoa

class APIRequest{
    let baseUrlInstance = baseURL()
   static let apiCalls = APIRequest()
    
    func fetchData() ->Observable<stockModel>{
        let date = baseUrlInstance.dateFormatter()
        let url = URL(string: "\(baseUrlInstance.baseURL)\(date)?apiKey=\(baseUrlInstance.apiKey)")!
                
        return Observable.create{observer in
            let task = URLSession.shared.dataTask(with: url){
                data,response,error in
                if let error = error{
                    observer.onError(error)
                }
                
                if let data = data{
                    do{
                        let stocks = try JSONDecoder().decode(stockModel.self, from: data)
                        observer.onNext(stocks)
                        observer.onCompleted()
                    } catch {
                        observer.onError(error)
                    }
                }
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
    

}
