//
//  IntegerFactorization.swift
//  leCalc
//
//  Created by Martin Čech on 22.11.2023.
//

import Foundation
import SwiftUI

struct IntegerFactorization: View {
    @State var showingDetails = false
    @State private var compositeNumber: String = ""
    
    var body: some View {
        VStack{
            Text("Integer Factorization")
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
                Text("Integer factorization also known as 'Prime decomposition. In number theory, integer factorization is the decomposition of a positive integer into a product of integers. Every positive integer greater than 1 is either the product of two or more integer factors, in which case it is called a composite number, or it is not, in which case it is called a prime number.")
                    .lineLimit(.bitWidth)
                    .frame(height: 100)
                    .font(.system(size: 10))
            }
        }
        
        VStack{
            TextField(text: $compositeNumber, prompt: Text("composite number")){
                Text("composite number")
            }
                .frame(width:280)
                .multilineTextAlignment(.center)
                .keyboardType(.numbersAndPunctuation)
            Text(getIntegerFactorization(compositeNumber))
                .frame(alignment: .center)
            
        }
        MathView(equation: presentWithExponents(getIntegerFactorization(compositeNumber)))
            .frame(width: 100, height: 40)
        Spacer()
    }
    
    func isInt(_ string: String) -> Bool {
            return Int(string) != nil
        }
    
    func isValidForIntegerFactorization(_ num: Int) -> Bool {
        return num > 1
    }
    
    func getIntegerFactorization(_ cNum: String) -> String {
        var answer = ""
        if isInt(cNum) == false {
            return "please insert composite number"
        }
        let numOri = Int(cNum)!
        if isValidForIntegerFactorization(numOri) == false {
            return "please use Integer > 1"
        }
        var num = numOri
        
        var i = 2
        while i <= numOri {
            if num % i == 0 {
                if i == numOri {
                    return "\(numOri) is prime number"
                }
                var j = 2
                var isPrime = true
                while j < i && isPrime == true {
                    if i % j == 0 { isPrime = false }
                    j += 1
                }
                i = 1
                if isPrime == true { answer += "\(j) \n"}
                num = num / j
            }
            i += 1
        }
        
        
        return answer
    }
    
    func presentWithExponents(_ primes: String) -> String {
        var equation = ""
        var x =  primes.components(separatedBy:" \n")
        
        return equation
    }
}


 
