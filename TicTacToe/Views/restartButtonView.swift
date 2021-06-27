//
//  restartButtonView.swift
//  TicTacToe
//
//  Created by Yuan Chang on 6/26/21.
//

import SwiftUI

struct restartButtonView: View {
    let darkMode: Bool
    @State var angle: Double = 0.0
    @State var shake: Bool = false
    var viewModel: TicTakToeGame
    var body: some View {
        Image(systemName: darkMode ? "arrow.triangle.2.circlepath.circle.fill": "arrow.triangle.2.circlepath.circle")
            .resizable()
            .frame(width: 75, height: 75, alignment: .center)
            .foregroundColor(.orange)
            .rotationEffect(.degrees(angle))
            .animation(animation)
            .onTapGesture {
                angle += 180
                viewModel.startNewGame()
            }
    }
    
    var animation: Animation {
        Animation.easeInOut(duration: 0.275)
            .repeatCount(2)
    }
    
}

struct restartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        let game = TicTakToeGame()
        restartButtonView(darkMode: true, viewModel: game)
    }
}
