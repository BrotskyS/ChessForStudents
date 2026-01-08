//
//  BoardView.swift
//  Chess
//
//  Created by Sergiy Pik on 26.12.2025.
//

import SwiftUI

struct BoardView: View {
    @ObservedObject var vm: GameViewModel
    @Namespace var imageNamespace
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<8) { row in
                HStack(spacing: 0) {
                    ForEach(0..<8) { col in
                        let isLight: Bool = (row + col) % 2 == 0
                        let position = Position(rawValue: (7 - row) * 8 + col)!
                        let piece = vm.getPiece(at: position)
                    
                        CellView(
                            isLight: isLight,
                            piece: piece,
                            isSelected: vm.selectPosition == position,
                            canMove: vm.allowedMove.contains(position),
                            imageNamespace: imageNamespace
                        ) {
                            vm.selectPosition(position)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
//    BoardView()
}
