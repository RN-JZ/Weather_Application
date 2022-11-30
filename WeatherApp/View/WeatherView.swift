//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Furqan on 30/11/2022.
//

import SwiftUI

struct WeatherView: View {
    var weather:ResponseBody
    var body: some View {
        ZStack(alignment: .leading )
        {
            VStack {
                VStack(alignment: .leading, spacing: 5)
                {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Text("Today \(Date().formatted(.dateTime .month().day().hour().minute()))")
                        .fontWeight(.light)
                        .foregroundColor(.white)
               }
                .frame(maxWidth: .infinity, alignment: .leading)
                VStack{
                     HStack{
                        VStack{
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            Text("\(weather.weather[0].main)")}
                         Spacer()
                         
                         Text("\(weather.main.feels_like.roundDouble())°")
                             .font(.system(size: 50))
                             .fontWeight(.bold)
                             .padding()
                             
                         
                     }
                    
                }
                
                Spacer()
                    .frame(height: 80)
                
                AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 350)
                                    } placeholder: {
                                        ProgressView()
                                    }
                
                Spacer()
                     
            }
            .padding()
            .frame( maxWidth: .infinity, maxHeight: .infinity)
            
          
            
        }
        
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather:weatherPreview)
    }
}
