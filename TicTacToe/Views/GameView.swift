//
//  ContentView.swift
//  TicTacToe
//
//  Created by Yuan Chang on 6/24/21.
//

import SwiftUI

struct GameView: View {
    
    @Environment(\.colorScheme) var colorScheme // adjust to darkmode and light mode
    @ObservedObject var viewModel: TicTakToeGame // view model
    
    var body: some View {
        let gameState = viewModel.moves
        ZStack {
            VStack{
                ZStack{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))],
                             spacing: 45) {
                        ForEach(0..<9) { index in
                            ShapeView(content:gameState[index]?.moveIndicator ?? "",
                                  scale: gameState[index]?.scale ?? true)
                                .onTapGesture {
                                    viewModel.choose(index)
                                }
                        }
                    }
                    resultScreen(
                        player1: !viewModel.player1,
                        win: viewModel.win,
                        draw: viewModel.draw,
                        darkMode: colorScheme == .dark)
                }
                restartButtonView(darkMode: colorScheme == .dark,
                                  angle: 0.0,
                                  viewModel: viewModel)
                Spacer(minLength: 50)
            }
        }
    }
}

// basic shape for a position to play
struct Shape: View {
    
    var content: String // x or o
    var scale: Bool // animation
    var body: some View {
        ZStack {
            let base = Circle()
            base
                .foregroundColor(.blue)
                .frame(width: 100 , height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .opacity(0.5)
            Image(systemName: content)
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .scaleEffect(scale ? 0 : 1, anchor: .center)
                .animation(.easeInOut(duration:0.4))
                .foregroundColor(.white)
        }
    }
}

struct resultScreen: View {
    let player1: Bool
    let win: Bool
    let draw: Bool
    let darkMode: Bool
    var body: some View {
        VStack {
            ZStack{
                if draw {
                    Rectangle()
                        .fill(darkMode ? Color.black: Color.white)
                        .opacity(0.75)
                    Text("Draw!")
                        .font(.largeTitle)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                } else if win {
                    Rectangle()
                        .fill(darkMode ? Color.black: Color.white)
                        .opacity(0.75)
                    if player1 {
                        Text("Player 1 Won!")
                            .font(.largeTitle)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    } else {
                        Text("Player 2 Won!")
                            .font(.largeTitle)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                } else {
                    Rectangle()
                        .fill(Color.white)
                        .opacity(0)
                }
            }
            .frame(height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Spacer()
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = TicTakToeGame()
        Group {
            GameView(viewModel: game)
        }
    }
}
