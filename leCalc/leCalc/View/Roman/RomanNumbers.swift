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
  //  var isValid = true
  //  var ltxEquation: String = "ax^2 + bx + c = 0"
    
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
                Text("Roman numerals are a numeral system that originated in ancient Rome and remained the usual way of writing numbers throughout Europe well into the Late Middle Ages. Numbers are written with combinations of letters from the Latin alphabet, each letter with a fixed integer value. Modern style uses only these seven: I = 1 .. V = 5 .. X = 10 .. L = 50 .. C = 100 .. D = 500 .. M = 1000")
                    .lineLimit(.bitWidth)
                    .frame(height: 100)
                    .font(.system(size: 10))
            }
        }
        Spacer()
            TextField(text: $arabicNum, prompt: Text("arabic number")){
                Text("arabic number")
            }
                .frame(width:280)
                .multilineTextAlignment(.center)
#if os(iOS)
                .keyboardType(.numbersAndPunctuation)
#endif
            Text(getRomanNumber(arabicNum))
            .font(.system(size: 18, weight: .black))
                //.font(Font.custom("RobotoMono-Bold", size: 18))
            Spacer()
            TextField(text: $romanNum, prompt: Text("roman number")) {
                Text("roman number")
                    
            }
                .frame(width:180)
                .multilineTextAlignment(.center)
#if os(iOS)
                .keyboardType(.numbersAndPunctuation)
#endif
                .font(.system(size: 18, weight: .black))
            Text(getArabicNumber(romanNum))
            .strikethrough(!validateInput(text: romanNum.uppercased()))
           // .foregroundColor(validateInput(text: romanNum.uppercased()) ? .black : .red)
            Spacer()
            Spacer()
    }
    

    func isInt(_ string: String) -> Bool {
            return Int(string) != nil
        }
    
    func getRomanNumber(_ num: String) -> String {
        var romanNumber = ""
        if isInt(num) {
            var iNum = Int(num)!
            if iNum > 3999 || iNum < 0 {
                return "please, insert number 0-3999"
            } else {
                for _ in 0...iNum {
                    if iNum / 1000 != 0 {
                        romanNumber += "M"
                        iNum = iNum - 1000
                    } else if iNum / 900 != 0 {
                        romanNumber += "CM"
                        iNum = iNum - 900
                    } else if iNum / 500 != 0 {
                        romanNumber += "D"
                        iNum = iNum - 500
                    } else if iNum / 400 != 0 {
                        romanNumber += "CD"
                        iNum = iNum - 400
                    } else if iNum / 100 != 0 {
                        romanNumber += "C"
                        iNum = iNum - 100
                    } else if iNum / 90 != 0 {
                        romanNumber += "XC"
                        iNum = iNum - 90
                    } else if iNum / 50 != 0 {
                        romanNumber += "L"
                        iNum = iNum - 50
                    } else if iNum / 40 != 0 {
                        romanNumber += "XL"
                        iNum = iNum - 40
                    } else if iNum / 10 != 0 {
                        romanNumber += "X"
                        iNum = iNum - 10
                    } else if iNum / 9 != 0 {
                        romanNumber += "IX"
                        iNum = iNum - 9
                    } else if iNum / 5 != 0 {
                        romanNumber += "V"
                        iNum = iNum - 5
                    } else if iNum / 4 != 0 {
                        romanNumber += "IV"
                        iNum = iNum - 4
                    } else if iNum / 1 != 0 {
                        romanNumber += "I"
                        iNum = iNum - 1
                    }
                }
            }
        } else {
            return "please, insert number 0-3999"
        }
        return romanNumber
    }
    
    func validateInput(text: String) -> Bool {
        do {
            let regexPattern = #"^(?=[MDCLXVI])M{0,3}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$"#
            let regex = try NSRegularExpression(pattern: regexPattern)
            let range = NSRange(location: 0, length: text.utf16.count)
            let matches = regex.numberOfMatches(in: text, options: [], range: range)
            return matches > 0
        } catch {
            return false
        }
    }
    
    func getArabicNumber(_ num: String) -> String {
        var arabicNum = 0
        var answer = ""
        let arr = Array(num.uppercased())
        if validateInput(text: num.uppercased()) == false {
            answer += "!!!"
        }
        if arr.count > 0 {
            for index in 0...arr.count-1 {
                switch arr[index] {
                case "M":
                    arabicNum += 1000
                case "D":
                    arabicNum += 500
                case "C":
                    
                    if index+1 < arr.count && (arr[index+1] == "M" || arr[index+1] == "D") {
                        arabicNum += -100
                    } else {
                        arabicNum += 100
                    }
                case "L":
                    arabicNum += 50
                case "X":
                    if index+1 < arr.count && (arr[index+1] == "C" || arr[index+1] == "L") {
                        arabicNum += -10
                    } else {
                        arabicNum += 10
                    }
                case "V":
                    arabicNum += 5
                case "I":
                    if index+1 < arr.count && (arr[index+1] == "X" || arr[index+1] == "V") {
                        arabicNum += -1
                    } else {
                        arabicNum += 1
                    }
                default:
                    arabicNum += 0
                }
            }
        }
        return answer + "\(arabicNum)" + answer
    }
}

