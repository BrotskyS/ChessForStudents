//
//  Position.swift
//  Chess
//
//  Created by Sergiy Pik on 26.12.2025.
//

import Foundation

enum Position: Int, CaseIterable {
    case a1; case b1; case c1; case d1; case e1; case f1; case g1; case h1
    case a2; case b2; case c2; case d2; case e2; case f2; case g2; case h2
    case a3; case b3; case c3; case d3; case e3; case f3; case g3; case h3
    case a4; case b4; case c4; case d4; case e4; case f4; case g4; case h4
    case a5; case b5; case c5; case d5; case e5; case f5; case g5; case h5
    case a6; case b6; case c6; case d6; case e6; case f6; case g6; case h6
    case a7; case b7; case c7; case d7; case e7; case f7; case g7; case h7
    case a8; case b8; case c8; case d8; case e8; case f8; case g8; case h8
    
    var y: Int { rawValue / 8 }
    var x: Int { rawValue % 8 }
    
    init?(row: Int, col: Int) {
        self.init(rawValue: (7 - row) * 8 + col)
    }
}
