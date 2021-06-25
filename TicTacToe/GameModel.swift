//
//  GameModel.swift
//  TicTacToe
//
//  Created by Yuan Chang on 6/24/21.
//

import Foundation

struct Game {
    
    private(set) var moves: [Move?]
    
    private(set) var isPlayer1Turn: Bool = true
    
    private(set) var win: Bool = false
    private(set) var draw: Bool = false
    
    init() {
        // empty game
        moves = Array(repeating: nil, count: 9)
    }
    
    mutating func choose(index: Int) {
        if moves[index] == nil {
            if isPlayer1Turn {
                moves[index] = Move(player1: true, boardIndex: index)
            } else {
                moves[index] = Move(player1: false, boardIndex: index)
            }
            win = checkWin()
            draw = checkDraw()
            isPlayer1Turn.toggle()
        } else {
            print("Clicked on an existing place")
        }
    }
    
    func checkWin() -> Bool {
        
        let winConditions: Set<Set<Int>> = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8],[2,4,6]]
        
        let currentPlayerMoves = moves.compactMap {
            $0
        }.filter {
            $0.player1 == isPlayer1Turn
        }
        
        let currentPlayerPositions = Set(currentPlayerMoves.map {
            $0.boardIndex
        })
        
        for condition in winConditions {
            if condition.isSubset(of: currentPlayerPositions) {
                return true
                
            }
        }
        return false
    }
    
    func checkDraw() -> Bool {
        let winAtLastMove = checkWin()
        let numMovesMade = moves.compactMap {$0}.count
        if numMovesMade == 9 {
            if winAtLastMove {
                return false
            } else {
                print("Draw")
                return true
            }
        }
        return false
    }
   
    struct Move {
        
        let player1: Bool
        var boardIndex: Int
        var moveIndicator: String {
            if player1 {
                return "xmark"
            } else {
                return "circle"
            }
        }
    }
    
}
