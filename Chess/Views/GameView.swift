//
//  GameView.swift
//  Chess
//
//  Created by Sergiy Pik on 26.12.2025.
//

import SwiftUI

struct GameView: View {
    @StateObject var vm: GameViewModel = GameViewModel()
    var body: some View {
        BoardView(vm: vm)
    }
}

#Preview {
    GameView()
}
