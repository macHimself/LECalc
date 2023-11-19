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
                    .frame(height: 135)
            }
        }
            VStack {
                MathView(equation: ltxEquation)
                    .frame(width: 100, height: 35)
                    .shadow(color: .red, radius: 5, x: 10, y: 10)
            }
            //  MathView(equation:presentFunction(a,b,c))
            VStack{
                HStack{
                        HStack{
                            Spacer()
                            TextField(text: $a, prompt: Text("a const")){
                                Text("a")
                            }.frame(width:75)
                                .multilineTextAlignment(.center)
                                .keyboardType(.numbersAndPunctuation)
                            TextField(text: $b, prompt: Text("b const")) {
                                Text("b")
                            }.frame(width:75)
                                .multilineTextAlignment(.center)
                                .keyboardType(.numbersAndPunctuation)
                            TextField(text: $c, prompt: Text("c const")) {
                                Text("c")
                            }.frame(width:75)
                                .multilineTextAlignment(.center)
                                .keyboardType(.numbersAndPunctuation)
                            Spacer()
                        }.shadow(color: .gray, radius: 10, x: 1, y: 2)
                }
            }
            //.frame(height: 80)
            //.background(.white)
        VStack{
            ResultRepresentation(result: presentFunction(a,b,c))
            NavigationView {
                VStack {
                    NavigationLink(destination: HasGraph()) {
                        Text("Go to Plot View")
                    }
                }
               // .navigationTitle("Home")
            }
        }
        Spacer()
       // ScrollView{
           
            //     .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 170)
            //AnimatingLine(isOverview: true)
            //.frame(width:100, height: 170)
      //  }
    }
    func hasGraph() -> Bool {return true}
    
    func presentFunction(_ a: String, _ b: String, _ c: String) -> [String] {
        var equation = ""
        var rootOne = ""
        var rootTwo = ""
        var rootY = ""
        var v = ""
        if isInt(a) && isInt(b) && isInt(c) {
            var aa = Double(a)!
            var bb = Double(b)!
            var cc = Double(c)!
            if aa == 0 {
                if bb != 0 {
                    if -cc/bb == 0 {
                        rootOne = "x=0"
                        rootY = "[x,y]=[0,\(fNum(cc))]"
                    } else {
                        rootOne = "x=\(fNum(-cc/bb))"
                        rootY = "[x,y]=[0,\(fNum(cc))]"
                    }
                } else if bb == 0 {
                    if cc > 0 {
                        rootOne = "x\\in\\emptyset"
                    }
                }
            } else {
                //TODO: add ignore for 1 in fornt of variable x or x^2
                let D = (bb * bb) - (4 * aa * cc)
                if D > 0 {
                    let xOne = ( -bb + sqrt(D))/(2*aa)
                    let xTwo = ( -bb - sqrt(D))/(2*aa)
                    rootOne = "x_{1}=\(fNum(xOne))"
                    rootTwo = "x_{2}=\(fNum(xTwo))"
                    rootY = "[x,y]=[0,\(fNum(cc))]"
                    let vx = (xOne + xTwo)/2
                    let vy = (aa * vx * vx) + (bb * vx) + cc
                    v = "V[x,y]=[\(fNum(vx)),\(fNum(vy))]"
                } else if D == 0 {
                    let xOnly = ( -bb + sqrt(D))/(2*aa)
                    rootOne = "x_{1|2}=\(fNum(xOnly))"
                    rootY = "[x,y]=[0,\(fNum(cc))]"
                    let vx = xOnly
                    let vy = (aa * vx * vx) + (bb * vx) + cc
                    v = "V[x,y]=[\(fNum(vx)),\(fNum(vy))]"
                } else if D < 0 {
                    rootOne = "x\\in\\emptyset"
                }
            }
            if aa != 0 {
                if aa == 1 {
                    equation += "x^2"
                } else if aa == -1 {
                    equation += "-x^2"
                } else {
                    equation += "\(fNum(aa))x^2"
                }
            }
            if bb != 0 {
                if bb == 1 && aa != 0 {
                    equation += "+x"
                } else if bb == 1 && aa == 0 {
                    equation += "x"
                } else if bb == -1 {
                    equation += "-x"
                } else if bb < 0 {
                    equation += "\(fNum(bb))x"
                } else if aa != 0 {
                    equation += "+\(fNum(bb))x"
                } else {
                    equation += "\(fNum(bb))x"
                }
            }
            if cc != 0 {
                if cc < 0 {
                    equation += "\(fNum(cc))"
                } else if cc > 0 && (aa != 0 || bb != 0) {
                    equation += "+\(fNum(cc))"
                } else if cc > 0 && aa == 0 && bb == 0 {
                    equation += "\(fNum(cc))"
                } else if cc == 0 {
                    equation += ""
                }
            }
            if aa == 0 && bb == 0 && cc == 0 {
                equation = "\\emptyset"
            }else {
                equation += "=0"
            }
        }
        return [equation,rootOne,rootTwo,rootY,v]
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
}

