//
//  GameService.swift
//  PC Gamer World
//
//  Created by IOSdev on 18/09/2024.
//

import Foundation
class GameService{
    
    let urlString = "https://api.rawg.io/api/games?key=138598dde6b1465cb0a562b7076e2453"
    
    func getGames() async throws ->[GameModel]{
        guard let url = URL(string: urlString) else{return[]}
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            let games = try JSONDecoder().decode(GameResponse.self, from: data)
            return games.results
        }catch{
            print("debug error: \(error.localizedDescription)")
            return []
        }
        
    }
}
