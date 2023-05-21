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
    @State private var lines: [Line] = []
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Canvas { context, size in
                    for line in lines {
                        var path = Path()
                        path.addLines(line.points)
                        context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                    }
                }
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onChanged({ value in
                        // creating an array of all touch points
                        let newPoint = value.location
                        currentLine.points.append(newPoint)
                    })
                    
                    .onEnded({ _ in
                        self.lines.append(currentLine)
                        self.currentLine = Line()
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
