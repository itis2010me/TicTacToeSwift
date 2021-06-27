//
//  LaunchScreenAnimation.swift
//  TicTacToe
//
//  Created by Yuan Chang on 6/26/21.
//

import SwiftUI

struct LaunchScreenAnimation: View {
    
    @State var animate: Bool = false
    @State var fades: Bool = true
    
    var body: some View {
        ZStack {
            Color(.systemBlue)
            
            Image(systemName: "puzzlepiece.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 175, height: 175, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .scaleEffect(animate ? 20 : 1)
                .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/(duration: 1))
                
            
        }
        .opacity(fades ? 1 : 0)
        .animation(.easeOut(duration: 1))
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                animate.toggle()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                fades.toggle()
            }
        }
    }
}

struct LaunchScreenAnimation_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenAnimation()
    }
}
