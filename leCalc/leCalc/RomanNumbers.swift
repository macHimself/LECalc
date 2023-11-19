//
//  RomanNumbers.swift
//  leCalc
//
//  Created by Martin Čech on 19.11.2023.
//

import Foundation
import SwiftUI
import SwiftMath

struct RomanNumbers: View {
    @State private var arabicNum: String = ""
    @State private var romanNum: String = ""
    @State var showingDetails = false
    var ltxEquation: String = "ax^2 + bx + c = 0"
    
    var body: some View {
        VStack{
            Text("Roman Numbers:")
                .padding()
                .shadow(color: .red, radius: 5, x: 10, y: 10)
        }
        Section(
            header: SectionHeader(
                title: "...",
                isOn: $showingDetails,
                onLabel: "<<<",
                offLabel: ">>>"
            ))
        {
            if showingDetails {
                Text("I = 1 **I** = 4000\nV = 5\nX = 10\nL = 50\nC = 100\nD = 500\nM = 1000")
                    .lineLimit(.bitWidth)
                    .frame(height: 170)
            }
        }
        Spacer()
            TextField(text: $arabicNum, prompt: Text("arabic number")){
                Text("arabic number")
            }
                .frame(width:180)
                .multilineTextAlignment(.center)
                .keyboardType(.numbersAndPunctuation)
            Text(getRomanNumber(arabicNum))
            Spacer()
            TextField(text: $romanNum, prompt: Text("roman number")) {
                Text("roman number")
            }
                .frame(width:180)
                .multilineTextAlignment(.center)
                .keyboardType(.numbersAndPunctuation)
            Text(getArabicNumber(romanNum))
            Spacer()
    }
    
    func getRomanNumber(_ num: String) -> String {
        var romanNumber = ""
        
        return romanNumber
    }
    
    func getArabicNumber(_ num: String) -> String {
        var arabicNum = 0
        let arr = Array(num)
        if arr.count > 0 {
            for index in 0...arr.count-1 {
                switch arr[index] {
                case "M":
                    arabicNum += 1000
                case "D":
                    arabicNum += 500
                case "C":
                    if index+1 < arr.count-1 && (arr[index+1] == "M" || arr[index+1] == "D") {
                        arabicNum += -100
                    } else {
                        arabicNum += 100
                    }
                case "L":
                    arabicNum += 50
                case "X":
                    if index+1 < arr.count-1 && (arr[index+1] == "C" || arr[index+1] == "L") {
                        arabicNum += -10
                    } else {
                        arabicNum += 10
                    }
                case "V":
                    arabicNum += 5
                case "I":
                    if index+1 < arr.count-1 && (arr[index+1] == "X" || arr[index+1] == "V") {
                        arabicNum += -1
                    } else {
                        arabicNum += 1
                    }
                default:
                    arabicNum += 0
                }
            }
        }
        return "\(arabicNum)"
    }
}

