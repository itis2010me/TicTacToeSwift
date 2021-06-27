//
//  HomeView.swift
//  TicTacToe
//
//  Created by Yuan Chang on 6/27/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: TicTakToeGame
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack (spacing: 10){
                    Text("TicTacToe")
                        .font(.largeTitle)
                    Spacer()
                    ZStack {
                        homeButtonsView(viewModel: viewModel)
                    }
                    Spacer()
                }
            }
            LaunchScreenAnimation()
        }
        
    }
}

struct homeAnimationView: View {

    var content: String
    var offset: CGFloat
    @State var move: Bool = false
    
    var body: some View {
        Image(systemName: content)
            .font(.largeTitle)
            .foregroundColor(.orange)
            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            .offset(y:offset)
            .rotationEffect(move ? .degrees(0) : .degrees(-360))
            .animation(animation)
            .onAppear {
                move.toggle()
            }
    }
    
    var animation: Animation {
        Animation.linear(duration: 5)
            .repeatForever(autoreverses: false)
    }
}

struct homeButtonsView: View {
    
    var viewModel: TicTakToeGame
    
    var body: some View {
        VStack {
            NavigationLink(
                destination: GameView(viewModel:viewModel),
                label: {
                    Text("Play")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 60)
                        .frame(maxWidth: 200)
                        .background(Color.blue)
                        .cornerRadius(3.0)
                })
                .padding()
            NavigationLink(
                destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                label: {
                    Text("Game Info")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 60)
                        .frame(maxWidth: 200)
                        .background(Color.blue)
                        .cornerRadius(3.0)
                })
                .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let game = TicTakToeGame()
        HomeView(viewModel: game)
    }
}
