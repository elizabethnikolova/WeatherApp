//
//  ContentView.swift
//  WeatherApp-SwiftUI
//
//  Created by Elizabeth Nikolova on 10/22/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Sofia")
                
                CurrentWeatherView(imageName: isNight ? "cloud.sun.rain.fill" : "moon.stars.fill",
                                   temperature: 15)
                
                HStack(spacing: 20) {
                    WeekDayView(dayOfWeek: "MON",
                                imageName: "cloud.sun.fill",
                                temperature: 17)
                    
                    WeekDayView(dayOfWeek: "TUE",
                                imageName: "sun.max.fill",
                                temperature: 20)
                    
                    WeekDayView(dayOfWeek: "WED",
                                imageName: "wind",
                                temperature: 19)
                    
                    WeekDayView(dayOfWeek: "THU",
                                imageName: "cloud.sun.bolt.fill",
                                temperature: 16)
                    
                    WeekDayView(dayOfWeek: "FRI",
                                imageName: "cloud.bolt.rain.fill",
                                temperature: 13)
                }
                Spacer()
                
                Button (action: {
                    isNight.toggle()
                }, label: {
                    WeatherButton(title: "Switch Day Time",
                                  textColor: Color("tealBlue"),
                                  backgroundColor: Color(.white))
                    
                })
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeekDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 15) {
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            Text("\(temperature)°")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: (Gradient(colors: [isNight ? Color("darkTealBlue") : .black,
                                                    isNight ? Color("tealBlue") : .black,
                                                    isNight ? Color("lightTealBlue") : .gray])),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(.top, 20)
            .padding(.bottom, 20)
    }
}

struct CurrentWeatherView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 60)
    }
}
