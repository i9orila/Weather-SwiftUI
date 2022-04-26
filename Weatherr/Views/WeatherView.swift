//
//  WeatherView.swift
//  Weatherr
//
//  Created by I9orila T on 07.12.2021.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.system(size:50))
                    
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack (spacing: 20) {
                            Image (systemName: "thermometer.sun")
                                .font(.system(size: 50))
                            
                            Text(weather.weather[0].main)
                            
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike
                            .roundDouble() + "°")
                        .font(.system(size: 100))
                        .fontWeight(.bold)
                        .padding()
                    }
                    Spacer()
                    CircleImage()
                        .frame(height:  350)
                    
                    
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                .padding()
                .frame(maxWidth: .infinity)
            }
            .edgesIgnoringSafeArea(.bottom)
            .background(LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.5049468875, green: 0.4051938653, blue: 0.3524135947, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.1854858696, green: 0.1183751002, blue: 0.3153337538, alpha: 1)), location: 1)]),
                startPoint: UnitPoint(x: 0.9999999999999999, y: 0),
                endPoint: UnitPoint(x: 1.4901160749758446e-8, y: 0.999999985098839)))
            .preferredColorScheme(.dark)
        }
    }
    
    struct WeatherView_Previews: PreviewProvider {
        static var previews: some View {
            WeatherView(weather: previewWeather)
            
        }
    }
}
