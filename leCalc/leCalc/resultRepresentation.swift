//
//  resultRepresentation.swift
//  leCalc
//
//  Created by Martin Čech on 18.11.2023.
//

import Foundation
import SwiftUI

struct ResultRepresentation: View {
    let result: [String]
//    var equation = result[0]
  //  var rootOne = result[1]
    //var rootTwo = result[2]
    
    var body: some View {
        VStack {
            MathView(equation: result[0])
                .frame(width: 100, height: 40)
            MathView(equation: result[1])
                .frame(width: 100, height: 35)
            MathView(equation: result[2])
                .frame(width: 100, height: 35)
        }
    }
}
