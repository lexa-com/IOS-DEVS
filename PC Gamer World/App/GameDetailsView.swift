//
//  GameDetailsView.swift
//  PC Gamer World
//
//  Created by IOSdev on 18/09/2024.
//

import SwiftUI

struct GameDetailsView: View {
    let games:GameModel
    
    var body: some View {
        VStack() {
            // title with name
            Text("\(games.name)")
                .font(.title)
                
            // images swipable ig style
            AsyncImage(url: URL(string: games.background_image), content: { image in
                    image.resizable()
                    .frame(height: 250)
                    .aspectRatio(contentMode: .fit)
                    .clipped()
            }, placeholder: {
                ProgressView().progressViewStyle(.circular)
            })
                .cornerRadius(36)
                .frame(height: 250)
        
            // release
            Text("\(games.released)")
                .font(.headline)
                
            // min requirement
            // recomemded requirements
            ScrollView{
                Text("MINIMUM REQUIREMENTS:- \(games.platforms[0].requirements_en?.minimum ?? "N/A")")
                    
                Text("RECOMMENDED REQUIREMENTS:- \(games.platforms[0].requirements_en?.recommended ?? "N/A")")
            }.font(.headline)
        }.padding(6)
    }
}


