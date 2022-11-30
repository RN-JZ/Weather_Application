//
//  ContentView.swift
//  WeatherApp
//
//  Created by Furqan on 29/11/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManger = LocationManager()
    var weatherManager = WeatherManger()
    @State var weather:ResponseBody?
    var body: some View {
        VStack
        {
            if let value = locationManger.Location
            {
                if let weatherval = weather
                {
                   WeatherView(weather:weatherval)
                }
                else
                {
                ProgressView().task {
                    do
                    {
                      weather = try await weatherManager.getWeatherAPI(lantitude: value.latitude, longitude: value.longitude)
                    }
                    catch
                    {
                        print("Fatal error \(error)")
                    }
                }
                }
                
            }
            else
            {
            if locationManger.isLoading
            {
                ProgressView()
            }
            else
            {
              WelcomeView()
            }
            }
        }
        .environmentObject(locationManger)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
