//
//  ViewModel.swift
//  TicTacToe
//
//  Created by Yuan Chang on 6/24/21.
//

import SwiftUI

class TicTakToeGame: ObservableObject {
    
    static func createGame() -> Game {
        Game()
    }
    
    func startNewGame() {
        model = TicTakToeGame.createGame()
    }
    
    @Published private(set) var model: Game = createGame()
    
    func choose(_ index: Int) {
        model.choose(index: index)
    }
    
    var moves: Array<Game.Move?> {
        return model.moves
    }
    
    var player1: Bool {
        return model.isPlayer1Turn
    }
    
    var win: Bool {
        return model.win
    }

    var draw: Bool {
        return model.draw
    }
    
    
}
