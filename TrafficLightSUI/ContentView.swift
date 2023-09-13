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
    
    @State private var redLight = CircleView(color: .red)
    @State private var yellowLight = CircleView(color: .yellow)
    @State private var greenLight = CircleView(color: .green)
    
    @State private var currentLight = CurrentLight.red
    
    private let lightIsOn = 1.0
    private let lightIsOff = 0.2
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                
                redLight
                yellowLight
                    .padding(20)
                greenLight
                Spacer()
                                
                Button(action: {
                    buttonTitle = "NEXT"
                    changeLightColor()
                }) {
                    Text("\(buttonTitle)")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding()
                }
                .frame(width: 250)
                .background(Color.blue)
                .cornerRadius(15)
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white,lineWidth: 5))
            }
            .padding()
        }
    }
    
    private func changeLightColor() {
        switch currentLight {
        case .red:
            redLight.backlighting = lightIsOn
            greenLight.backlighting = lightIsOff
            currentLight = .yellow
        case .yellow:
            yellowLight.backlighting = lightIsOn
            redLight.backlighting = lightIsOff
            currentLight = .green
        case .green:
            greenLight.backlighting = lightIsOn
            yellowLight.backlighting = lightIsOff
            currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
