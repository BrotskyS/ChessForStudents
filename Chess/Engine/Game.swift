//
//  Game.swift
//  Chess
//
//  Created by Sergiy Pik on 26.12.2025.
//

import Foundation

class Game {
    var board: Board
    
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
            return canPawnMove(from: from, to: to) && !piecesExistBetween(from: from, to: to)
        case .bishop:
            return abs(from.y - to.y) == abs(from.x - to.x)
        case .knight:
            let x = to.x - from.x
            let y = to.y - from.y

            return [[2, 1], [2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2], [-2, 1], [-2, -1]].contains([x, y])
        case .rook:
            return (from.y - to.y == 0 || from.x - to.x == 0)
        case .king:
            return abs(to.x - from.x) <= 1 && abs(to.y - from.y) <= 1
        case .queen:
            return from.y - to.y == 0 || from.x - to.x == 0 || abs(from.y - to.y) == abs(from.x - to.x)
        }
    }
    
    func canPawnMove(from: Position, to: Position) -> Bool {
        guard let figure = board[from] else { return false }
        let toFigure = board[to]
        
        let deltaY = to.y - from.y
        let deltaX = to.x - from.x
        
        let direction: Int = figure.color == .white ? 1 : -1
        let enemyColor: PieceColor = figure.color == .white ? .black : .white
        let startY = figure.color == .white ? 1 : 6
        
        if deltaY == direction && deltaX == 0 && toFigure == nil { return true }
        else if deltaY == direction && abs(deltaX) == 1 && toFigure?.color == enemyColor { return true }
        else if from.y == startY && deltaY == 2 * direction && deltaX == 0 && toFigure == nil { return true }
        else { return false }
    }
    
    func piecesExistBetween(from: Position, to: Position) -> Bool {

        let stepY = from.y < to.y ? 1 : -1
        let stepX = from.x < to.x ? 1 : -1

        var positionY = from.y

        positionY += stepY

        while positionY != to.y {
            guard positionY >= 0, positionY < 8 else { return false }

            if board.pieces[Position(row: positionY, col: from.x)!.rawValue] != nil {
                return true
            }

            positionY += stepY
        }

        return false
    }
    
    func move(from: Position, to: Position) {
        board.movePiece(from: from, to: to)
    }
}
