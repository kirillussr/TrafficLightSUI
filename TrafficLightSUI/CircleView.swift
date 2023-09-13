//
//  CircleView.swift
//  TrafficLightSUI
//
//  Created by Кирилл on 11.09.2023.
//

import SwiftUI

struct CircleView: View {
    
    let color: Color
    var backlighting = 0.2
    
    
    var body: some View {
        Circle()
            .frame(width: 150, height: 150)
            .foregroundColor(color)
            .opacity(backlighting)
            .overlay(Circle().stroke(Color.white,lineWidth: 5))
            .shadow(radius: 10)
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(color: .red)
    }
}
