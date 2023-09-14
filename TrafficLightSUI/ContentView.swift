//
//  ContentView.swift
//  TrafficLightSUI
//
//  Created by Кирилл on 11.09.2023.
//

import SwiftUI

private enum CurrentLight {
    case off, red, yellow, green
}

struct ContentView: View {
    
    @State private var buttonTitle = "START"
    @State private var currentLight: CurrentLight = .off
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                
                CircleView(
                    color: .red,
                    opacity: currentLight == .red ? 1 : 0.2
                )
                CircleView(
                    color: .yellow,
                    opacity: currentLight == .yellow ? 1 : 0.2
                )
                    .padding(20)
                CircleView(
                    color: .green,
                    opacity: currentLight == .green ? 1 : 0.2
                )
                
                Spacer()
                
                ButtonView(title: buttonTitle) {
                    if buttonTitle == "START" {
                        buttonTitle = "NEXT"
                    }
                    changeLightColor()
                }
            }
            .padding()
        }
    }
    
    private func changeLightColor() {
        switch currentLight {
        case .off: currentLight = .red
        case .red: currentLight = .yellow
        case .yellow: currentLight = .green
        case .green: currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
