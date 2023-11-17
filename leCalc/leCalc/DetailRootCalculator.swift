//
//  DetailRootCalculator.swift
//  leCalc
//
//  Created by Martin Čech on 17.11.2023.
//

import Foundation
import SwiftUI

struct RootCalculator: View {
    @State private var a: String = ""
    @State private var b: String = ""
    @State private var c: String = ""
    
    
    
    var body: some View {
        VStack{
            Text("Root Calculator:")
                .padding()
                   //.shadow(color: .red, radius: 3)
                .shadow(color: .red, radius: 5, x: 10, y: 10)
                 //  .border(.red, width: 4)
        }
        VStack {
            
            Text("This calculator is meant to gave you the easy and quick anser, where are the roots for quadratic funtion. Just provide here the constants numbers a,b and c from the equation: \"ax^2 + bx + c\"")
                .lineLimit(.bitWidth)
        }
        VStack{
            HStack{
                TextField("a - the constant by x^2", text: $a)
                    
                TextField("b - the constant by x^1", text: $b)
                TextField("c - the constant by no x, x^0", text: $c)
            }
            
        }
    }
}
