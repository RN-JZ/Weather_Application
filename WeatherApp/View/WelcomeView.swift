//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Furqan on 29/11/2022.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var locationManger:LocationManager
    var body: some View
    {
        VStack {
            VStack(spacing:20)
            {
                Text("Welcome to the App Weather App")
                    .font(.title)
                    .bold()
                Text("please share your current location")
                    .padding()
            }
            .multilineTextAlignment(.center)
        .padding()
            
            Button(action: {
                locationManger.requesrLocation()
                
            })
            {
                Rounded_Button(text: "Share Current Location")
                .padding()
                    
            }
            
        }.frame(maxWidth: .infinity, maxHeight:.infinity)
            
      
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(LocationManager())
            
    }
}
