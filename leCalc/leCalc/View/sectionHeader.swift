//
//  sectionHeader.swift
//  leCalc
//
//  Created by Martin Čech on 18.11.2023.
//
//https://ondrej-kvasnovsky.medium.com/how-to-make-a-collapsable-and-expandable-list-in-swiftui-c968c479ee14

import Foundation
import SwiftUI

struct SectionHeader: View {
  
  @State var title: String
  @Binding var isOn: Bool
  @State var onLabel: String
  @State var offLabel: String
  
  var body: some View {
    Button(action: {
      withAnimation {
        isOn.toggle()
      }
    }, label: {
      if isOn {
        Text(onLabel)
      } else {
        Text(offLabel)
      }
    })
    .font(Font.caption)
    .foregroundColor(.accentColor)
    .frame(maxWidth: .infinity, alignment: .trailing)
    .overlay(
      Text(title),
      alignment: .center
    )
  }
}
