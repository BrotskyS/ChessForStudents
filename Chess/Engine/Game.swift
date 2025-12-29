//
//  Game.swift
//  Chess
//
//  Created by Sergiy Pik on 26.12.2025.
//

import Foundation

class Game {
    let board: Board
    
    init(board: Board) {
        self.board = board
    }
    
    func allMoves(from position: Position) -> [Position] {
        return Position.allCases.filter { to in
            canMove(from: position, to: to)
        }
    }
    
    func canMove(from: Position, to: Position) -> Bool {
        if from == to { return false }
        guard let figure = board[from] else { return false }
        
        switch figure.type {
        case .pawn:
            return false
        case .bishop:
            return abs(from.y - to.y) == abs(from.x - to.x)
        case .knight:
            let x = to.x - from.x
            let y = to.y - from.y

            return [[2, 1], [2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2], [-2, 1], [-2, -1]].contains([x, y])
        case .rook:
            return from.y - to.y == 0 || from.x - to.x == 0
        case .king:
            return abs(to.x - from.x) <= 1 && abs(to.y - from.y) <= 1
        case .queen:
            return from.y - to.y == 0 || from.x - to.x == 0 || abs(from.y - to.y) == abs(from.x - to.x)
        }
    }
}
