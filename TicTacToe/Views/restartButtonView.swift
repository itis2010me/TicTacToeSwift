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
    var viewModel: TicTakToeGame
    var body: some View {
        Image(systemName: darkMode ? "arrow.triangle.2.circlepath.circle.fill": "arrow.triangle.2.circlepath.circle")
            .resizable()
            .frame(width: 75, height: 75, alignment: .center)
            .foregroundColor(.orange)
            //.rotationEffect(viewModel.rotate ? .degrees(0) : .degrees(90))
            .rotationEffect(.degrees(angle))
            .animation(.easeIn)
            .onTapGesture {
                angle += 180
                viewModel.startNewGame()
            }
    }
}

struct restartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        let game = TicTakToeGame()
        restartButtonView(darkMode: true, viewModel: game)
    }
}
