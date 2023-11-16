//
//  ContentView.swift
//  leCalc
//
//  Created by Martin Čech on 16.11.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "bicycle.circle.fill")
                .imageScale(.large)
                .font(.system(size: 150))
                .foregroundStyle(.blue)
                .tint(.blue)
                .foregroundColor(Color(.systemRed))
            Text("Hello, world!")
        }
    }
}

#Preview {
    ContentView()
}
