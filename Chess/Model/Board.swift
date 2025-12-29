//
//  File.swift
//  Chess
//
//  Created by Sergiy Pik on 26.12.2025.
//

import Foundation

struct Board {
    private(set) var pieces: [Piece?] = Array(repeating: nil, count: 64)
    
    init() {
        defaultSetup()
    }
    
    mutating func defaultSetup() {
        
        let pieceType: [PieceType] = [.rook, .knight, .bishop, .queen, .king, .bishop, .knight, .rook]
        
        // white
        for i in 0..<8 {
            let type = pieceType[i]
            pieces[i] = Piece(type: type, color: .white)
        }
        
        for i in 8..<16 {
            pieces[i] = Piece(type: .pawn, color: .white)
        }
        
        // black
        for i in 48..<56 {
            pieces[i] = Piece(type: .pawn, color: .black)
        }
        
        for i in 56..<64 {
            let type = pieceType[i - 56]
            pieces[i] = Piece(type: type, color: .black)
        }
    }
    
    subscript(position: Position) -> Piece? {
        pieces[position.rawValue]
    }
    
    subscript(x: Int, y: Int) -> Piece? {
        pieces[0]
    }
    
    func getPiece(x: Int, y: Int) -> Piece? {
        pieces[0]
    }
}
