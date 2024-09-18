//
//  GameItem.swift
//  PC Gamer World
//
//  Created by IOSdev on 18/09/2024.
//

import SwiftUI

struct GameItem: View {
    let game:GameModel
    var body: some View {
        VStack(alignment: .leading){
            //zstack image/star rating
            ZStack (alignment: .topLeading){
                AsyncImage(url: URL(string: game.background_image)){ image in
                    image.image?.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                        .clipped()}
                    .padding(4)
            }
            .frame(height: 250)
            //name
            Text("\(game.name)")
                .padding(.leading)
                .font(.title)
            //release date
            Text("\(game.released)")
                .padding(.leading)
                .foregroundColor(.gray)
            HStack{
                Image(systemName: "star.fill").foregroundColor(.blue)
                    .font(.headline)
                    
                Text("\(game.rating.rateFormat()) / \(game.rating_top.rateFormat())")
                    .font(.headline)
                
                
            }.padding()
        }
    }
}


