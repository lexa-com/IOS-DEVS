//
//  AppBar.swift
//  PC Gamer World
//
//  Created by IOSdev on 18/09/2024.
//

import SwiftUI

struct AppBar: View {
    var body: some View {
        VStack{
            Text("PC Gamer's Paradise")
                .font(.title)
            Text("Get your PC games catalogue")
                .font(.caption)
            
        }
            
    }
}

#Preview {
    AppBar()
}
