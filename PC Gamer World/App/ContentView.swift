//
//  ContentView.swift
//  PC Gamer World
//
//  Created by IOSdev on 18/09/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = GameviewModel()
    var body: some View {
        NavigationStack{
            VStack {
                AppBar()
                
                ScrollView{
                    LazyVStack{
                        ForEach(vm.games){games in
                            NavigationLink(value: games){
                                GameItem(game:games)
                            }
                            
                        }
                        
                    }
                }.navigationDestination(for: GameModel.self){
                    games in
                    GameDetailsView(games:games)
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}
