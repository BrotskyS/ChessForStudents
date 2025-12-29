//
//  GameViewModel.swift
//  Chess
//
//  Created by Sergiy Pik on 26.12.2025.
//

import Foundation
import Combine

class GameViewModel: ObservableObject {
    let game: Game
    @Published var selectPosition: Position?
    @Published var allowedMove: [Position] = []
    
    init() {
        self.game = Game(board: Board())
    }
    
    func getPiece(at position: Position) -> Piece? {
        game.board[position]
    }
    
    func selectPosition(_ position: Position) {
        if selectPosition == position {
            selectPosition = nil
            allowedMove = []
            return
        }
        
        if game.board.pieces[position.rawValue] != nil {
            selectPosition = position
        }
        
        selectAllowedMove(from: position)
    }
    
    func selectAllowedMove(from position: Position) {
        allowedMove = game.allMoves(from: position)
    }
}
