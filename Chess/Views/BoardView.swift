//
//  BoardView.swift
//  Chess
//
//  Created by Sergiy Pik on 26.12.2025.
//

import SwiftUI

struct BoardView: View {
    @ObservedObject var vm: GameViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<8) { row in
                HStack(spacing: 0) {
                    ForEach(0..<8) { col in
                        let isLight: Bool = (row + col) % 2 == 0
                        let position = Position(row: row, col: col)!
                        let piece = vm.getPiece(at: position)
                    
                        CellView(
                            isLight: isLight,
                            piece: piece,
                            isSelected: vm.selectPosition == position,
                            canMove: vm.allowedMove.contains(position)
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
