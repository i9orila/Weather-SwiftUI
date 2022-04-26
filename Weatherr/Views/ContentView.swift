//
//  ContentView.swift
//  Weatherr
//
//  Created by I9orila T on 07.12.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                    
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
                
            }
            
            
        }
        .background(LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.977581203, green: 0.7777563334, blue: 0.5469250679, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.01426716242, green: 0.06573378295, blue: 0.3208696842, alpha: 1)), location: 1)]),
            startPoint: UnitPoint(x: 0.9999999999999999, y: 0),
            endPoint: UnitPoint(x: 1.4901160749758446e-8, y: 0.999999985098839)))
        .preferredColorScheme(.dark)
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
        
    }
    
}

