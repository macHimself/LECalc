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
    @State var showingDetails = false
    
    var ltxEquation: String = "ax^2 + bx + c = 0"
    
    var body: some View {
        VStack{
            Text("Root Calculator:")
                .padding()
                .shadow(color: .red, radius: 5, x: 10, y: 10)
        }
        VStack {
            MathView(equation: ltxEquation)
                .frame(width: 100, height: 35)
            Section(
                    header: SectionHeader(
                      title: "...",
                      isOn: $showingDetails,
                      onLabel: "<<<",
                      offLabel: ">>>"
                    )
            ) {
                if showingDetails {
                    Text("\nThis calculator is meant to gave you the easy and quick answer, what are the roots for quadratic funtion. Just provide here the constants numbers a,b and c from the equation:")
                        .lineLimit(.bitWidth)
                }
            }
        }
      //  MathView(equation:presentFunction(a,b,c))
        ResultRepresentation(result: presentFunction(a,b,c))
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 110)
        VStack{
            HStack{
                Form {
                    HStack{
                        TextField(text: $a, prompt: Text("a const")) {
                            Text("a")
                        }
                        TextField(text: $b, prompt: Text("b const")) {
                            Text("b")
                        }
                        TextField(text: $c, prompt: Text("c const")) {
                            Text("c")
                        }
                    }
                }
            }
        }
    }
}

func presentFunction(_ a: String, _ b: String, _ c: String) -> [String] {
    var equation = ""
    var rootOne = ""
    var rootTwo = ""
    if isInt(a) && isInt(b) && isInt(c) {
        equation = "wrong input"
        let aa = Double(a)!
        let bb = Double(b)!
        let cc = Double(c)!
        if aa == 0 && bb == 0 && cc == 0 {
            equation = "0=0"
            
        } else if aa == 0 && bb == 0 && cc != 0 {
            equation = "\(fNum(cc))=0"
            rootOne = "\\emptyset" // rootOne = "\\mathbb{R}"
        } else if aa == 0 && bb != 0 && cc != 0 {
            equation = "\(fNum(bb))x + \(fNum(cc)) = 0"
            rootOne = "x = \(fNum(-cc/bb))"
        } else if aa != 0 && bb != 0 && cc != 0 {
            equation = "\(fNum(aa))x^2 + \(fNum(bb))x + \(fNum(cc)) = 0"
        } else if aa != 0 && bb == 0 && cc != 0 {
            equation = "\(fNum(aa)) x^2 + \(fNum(cc)) = 0"
            if cc < 0 {
                rootOne = "x_1 = \(fNum(sqrt(-cc/aa)))"
                rootTwo = "x_2 = - \(fNum(sqrt(-cc/aa)))"
            } else {
                rootOne = "x_{1|2} \\in \\mathbb{C}"
                rootTwo = "x_{1|2} = \\pm\(fNum(sqrt(cc/aa)))i"
            }
        } else if aa != 0 && bb != 0 && cc == 0 {
            equation = "\(fNum(aa)) x^2 + \(fNum(bb))"
            rootOne = "x = 0"
            rootTwo = "x = \(fNum(-bb/aa))"
            
        } else if aa != 0 && bb == 0 && cc == 0 {
            equation = "\(fNum(aa)) x^2 = 0"
            rootOne = "x_{1|2} = 0"
        }
        
    }
    
    
    
    return [equation,rootOne,rootTwo]
}

func isInt(_ num: String) -> Bool {
    if let a = Double(num) {
        return true
    }
    return false
}

func fNum(_ num: Double) -> String {
    if isInteger(num) {
        return "\(String(format: "%.0f",num))"
    } else {
        return "\(String(format: "%.3f",num))"
    }
}

func isInteger (_ num: Double) -> Bool { return floor(num) == num }
