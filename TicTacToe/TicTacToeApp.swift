//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by Yuan Chang on 6/24/21.
//

import SwiftUI

@main
struct TicTacToeApp: App {
    var body: some Scene {
        let game = TicTakToeGame()
        WindowGroup {
            HomeView(viewModel: game)
        }
    }
}
