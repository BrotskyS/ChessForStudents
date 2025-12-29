//
//  Piece.swift
//  Chess
//
//  Created by Sergiy Pik on 26.12.2025.
//

import Foundation

enum PieceType: String {
    case pawn
    case bishop
    case knight
    case rook
    case king
    case queen
    
    var imageName: String {
        switch self {
        case .pawn: "pawn"
        case .bishop: "bishop"
        case .knight: "knight"
        case .rook: "rook"
        case .king: "king"
        case .queen: "queen"
        }
    }
}

enum PieceColor {
    case white
    case black
    
    var imageName: String {
        switch self {
        case .white:
            return "white"
        case .black:
            return "black"
        }
    }
}

struct Piece: Hashable {
    let id: UUID = UUID()
    let type: PieceType
    let color: PieceColor
}
