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
            
            Text("This calculator is meant to gave you the easy and quick answer, what are the roots for quadratic funtion. Just provide here the constants numbers a,b and c from the equation: \n\n\"ax^2 + bx + c\"")
                .lineLimit(.bitWidth)
        }
        Text(presentFunction(a,b,c))
        VStack{
            HStack{
                Form {
                   // HStack{
                        TextField(text: $a, prompt: Text("a - the constant by x^2")) {
                            Text("a")
                        }
                        TextField(text: $b, prompt: Text("b - the constant by x^1")) {
                            Text("b")
                        }
                        TextField(text: $c, prompt: Text("c - the constant by no x, x^0")) {
                            Text("c")
                        }
                                
                        
                        
                        
                        //    TextField("a - the constant by x^2", text: $a)
                        //    TextField("b - the constant by x^1", text: $b)
                        //    TextField("c - the constant by no x, x^0", text: $c)
                 //   }
                    
                    
                    
                    
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
