//
//  WeatherButton.swift
//  WeatherApp-SwiftUI
//
//  Created by Elizabeth Nikolova on 10/23/23.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .font(.system(size: 18, weight: .medium))
            .foregroundColor(textColor)
            .background(backgroundColor.gradient)
            .cornerRadius(100)
    }
}

struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButton(title: "Test",
                      textColor: .white,
                      backgroundColor: .blue)
    }
}
