//
//  ContentView.swift
//  TicTacToe
//
//  Created by Yuan Chang on 6/24/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: TicTakToeGame
    
    var body: some View {
        let gameState = viewModel.moves
        VStack{
            Button(action: {
                viewModel.startNewGame()
            }, label: {
                Text("Restart")
                    .font(.largeTitle)
                    .italic()
                    .foregroundColor(.black)
            })
            ZStack{
                LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]) {
                    ForEach(0..<9) { index in
                        Shape(content: gameState[index]?.moveIndicator ?? "")
                            .onTapGesture {
                                viewModel.choose(index)
                            }
                    }
                }
                resultScreen(
                    player1: !viewModel.player1,
                    win: viewModel.win,
                    draw: viewModel.draw)
            }
        }
    }
}

struct Shape: View {
    
    var content: String
    
    var body: some View {
        ZStack {
            let shape = Circle()
            shape
                .foregroundColor(.blue)
                .frame(width: 100 , height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .opacity(0.5)
            Image(systemName: content)
                .resizable()
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
        }
    }
}

struct resultScreen: View {
    let player1: Bool
    let win: Bool
    let draw: Bool
    var body: some View {
        ZStack{
            if draw {
                Rectangle()
                    .fill(Color.white)
                    .opacity(1)
                Text("Draw!")
                    .font(.largeTitle)
            } else if win {
                Rectangle()
                    .fill(Color.white)
                    .opacity(1)
                if player1 {
                    Text("Player 1 Won!")
                        .font(.largeTitle)
                } else {
                    Text("Player 2 Won!")
                        .font(.largeTitle)
                }
            } else {
                Rectangle()
                    .fill(Color.white)
                    .opacity(0)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = TicTakToeGame()
        ContentView(viewModel: game)
    }
}
