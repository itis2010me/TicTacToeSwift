//
//  ShapeView.swift
//  TicTacToe
//
//  Created by Yuan Chang on 6/26/21.
//

import SwiftUI

struct ShapeView: View {
    var content: String // x or o
    var scale: Bool // animation
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.blue)
                .frame(width: 100 , height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .opacity(0.5)
            Image(systemName: content)
            .resizable()
            .frame(width: 40, height: 40, alignment: .center)
            .scaleEffect(scale ? 0 : 1, anchor: .center)
                .animation(.easeInOut(duration:0.5))
                .rotationEffect(scale ? .degrees(0) : .degrees(180))
                .animation(.easeInOut(duration:0.5))
            .foregroundColor(.white)
        }
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeView(content: "xmark", scale: true)
    }
}
