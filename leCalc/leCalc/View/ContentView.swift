//
//  ContentView.swift
//  leCalc
//
//  Created by Martin Čech on 16.11.2023.
//

import SwiftUI

struct ContentView: View {
    let data = ["functions", "roots", "palindroms", "primes", "roman numbers", "pascals", "fibonnachis", "eulers", "goldenRate", "logarithms", "algorithms","functions", "roots", "palindroms", "primes", "roman numbers", "pascals", "fibonnachis", "eulers", "goldenRate", "logarithms", "algorithms"]
    var body: some View {
        NavigationStack{
            VStack {
                Image(systemName: "compass.drawing")
                    .imageScale(.large)
                    .font(.system(size: 100))
                    .foregroundStyle(.blue)
                    .tint(.blue)
                    .foregroundColor(Color(.systemRed))
                Text("Happy to help you today!")
            }
            List {
             //   ForEach(0..<data.count) { each in
                    NavigationLink{
                        RootCalculator()
                    } label: { Text("Roots")}
                    NavigationLink{
                        RomanNumbers()
                    } label: { Text("Roman Numbers")}
                  //} label: { Text(data[each])}
             //   }
            }
        }
        .navigationTitle("Extra Mathematic Functions")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
        }
    }
}

//#Preview {
//    ContentView()
//}
