//
//  HasGraph.swift
//  leCalc
//
//  Created by Martin Čech on 19.11.2023.
//

import Foundation
import SwiftUI
import Charts

struct HasGraph: View {
    var body: some View {
            PlotView()

        }
    }
struct PlotView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // Y-axis
                Path { path in
                    path.move(to: CGPoint(x: geometry.size.width / 2, y: 0))
                    path.addLine(to: CGPoint(x: geometry.size.width / 2, y: geometry.size.height))
                }
                .stroke(Color.black, lineWidth: 1)

                // X-axis
                Path { path in
                    path.move(to: CGPoint(x: 0, y: geometry.size.height / 2))
                    path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height / 2))
                }
                .stroke(Color.black, lineWidth: 1)

                // Plot X^2 function for both positive and negative x-values
                Path { path in
                    for x in stride(from: -10, through: 10, by: 0.1) {
                        let y = pow(x, 2)
                        let point = CGPoint(x: (x + 10) * 10, y: geometry.size.height / 2 - CGFloat(y) * 10)
                        if x == -10 {
                            path.move(to: point)
                        } else {
                            path.addLine(to: point)
                        }
                    }
                }
                .stroke(Color.blue, lineWidth: 2)
            }
            .frame(width: geometry.size.width, height: geometry.size.height / 2)
            .navigationTitle("X^2 Plot")
        }
    }
}

