//
//  GameviewModel.swift
//  PC Gamer World
//
//  Created by IOSdev on 18/09/2024.
//

import Foundation

class GameviewModel:ObservableObject{
    @Published var games = [GameModel]()
    
    private var service = GameService()
    
    init (){
        fetchGames()
    }
    
    func fetchGames(){
        Task{ @MainActor in
            self.games  = try await service.getGames()
            print(self.games)
            
        }
    
    }
}
