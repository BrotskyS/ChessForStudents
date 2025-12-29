//
//  CellView.swift
//  Chess
//
//  Created by Sergiy Pik on 26.12.2025.
//

import SwiftUI

struct CellView: View {
    let isLight: Bool
    let piece: Piece?
    let isSelected: Bool
    var canMove: Bool
    var onTap: () -> Void
    
    var body: some View {
        ZStack {
            if !isLight {
                Color.green.opacity(0.9)
            } else {
                Color.green.opacity(0.2)
            }
            
            if isSelected {
                Color.red.opacity(0.9)
            }
            
            if let piece {
                Image(piece.color.imageName + "_" + piece.type.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(6)
            }
            
            if canMove {
                Circle()
                    .frame(width: 10, height: 10)
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .onTapGesture {
            onTap()
        }
    }
}

