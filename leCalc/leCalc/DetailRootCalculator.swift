//
//  DetailRootCalculator.swift
//  leCalc
//
//  Created by Martin Čech on 17.11.2023.
//

import Foundation
import SwiftUI
import SwiftMath

struct RootCalculator: View {
    @State private var a: String = ""
    @State private var b: String = ""
    @State private var c: String = ""
    
    var ltxEquation: String = "ax^2 + bx + c = 0"
    
    var body: some View {
        VStack{
            Text("Root Calculator:")
                .padding()
                .shadow(color: .red, radius: 5, x: 10, y: 10)
        }
        VStack {
            MathView(equation: ltxEquation)
                .frame(width: 100, height: 30)
            Text("This calculator is meant to gave you the easy and quick answer, what are the roots for quadratic funtion. Just provide here the constants numbers a,b and c from the equation:")
                .lineLimit(.bitWidth)
            

        }
        Text(presentFunction(a,b,c))
        VStack{
            HStack{
                Form {
                    HStack{
                        TextField(text: $a, prompt: Text("a constant")) {
                            Text("a")
                        }
                        TextField(text: $b, prompt: Text("b constnat")) {
                            Text("b")
                        }
                        TextField(text: $c, prompt: Text("c constant")) {
                            Text("c")
                        }
                    }
                }
     
            }

        }
    }
}

func presentFunction(_ a: String, _ b: String, _ c: String) -> String {
    var equation = ""
    if isInt(a) && isInt(b) && isInt(c) {
        equation = "you gave numbers!"
        let aa = Double(a)!
        let bb = Double(b)!
        let cc = Double(c)!
        if aa == 0 && bb == 0 && cc == 0 {
            equation = "you gave no  relevant numbers"
        } else if aa == 0 && bb == 0 && cc != 0 {
            equation = "this is not valid"
        } else if aa == 0 && bb != 0 && cc != 0 {
            equation = "it is linear eqation \(bb)x + \(cc) = 0 \nx = \(-cc/bb)"
        } else if aa != 0 && bb != 0 && cc != 0 {
            //discriminant to use
        } else if aa != 0 && bb == 0 && cc != 0 {
            equation = "\(aa) x^2 + \(cc) = 0 \n x1|2 = +/-\(sqrt(-cc/aa))"
        } else if aa != 0 && bb != 0 && cc == 0 {
            equation = "\(aa) x^2 + \(bb) x = 0 \n x = 0 \n x = \(-bb/aa) "
            
        }
        
    }
    
    
    
    return equation
}

func isInt(_ num: String) -> Bool {
    if let a = Double(num) {
        return true
    }
    return false
}
