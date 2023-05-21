//
//  ContentView.swift
//  DrawingApp
//
//  Created by Shah Md Imran Hossain on 21/5/23.
//

import SwiftUI

struct Line {
    var points = [CGPoint]()
    var color: Color = .red
    var lineWidth: Double = 1.0
}

struct ContentView: View {
    @State private var currentLine = Line()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Canvas { context, size in
                    
                }
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onChanged({ value in
                        
                    })
                )
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
