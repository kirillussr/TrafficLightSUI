//
//  ContentView.swift
//  TrafficLightSUI
//
//  Created by Кирилл on 11.09.2023.
//

import SwiftUI

private enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {
    
    @State private var buttonTitle = "START"
    
    @State private var redLight = 0.2
    @State private var yellowLight = 0.2
    @State private var greenLight = 0.2
    
    @State private var currentLight = CurrentLight.red
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                
                CircleView(color: .red, opacity: redLight)
                CircleView(color: .yellow, opacity: yellowLight)
                    .padding(20)
                CircleView(color: .green, opacity: greenLight)
                
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
        
        let lightIsOn = 1.0
        let lightIsOff = 0.2
        
        switch currentLight {
        case .red:
            redLight = lightIsOn
            greenLight = lightIsOff
            currentLight = .yellow
        case .yellow:
            yellowLight = lightIsOn
            redLight = lightIsOff
            currentLight = .green
        case .green:
            greenLight = lightIsOn
            yellowLight = lightIsOff
            currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
