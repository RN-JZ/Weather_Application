//
//  Rounded Button.swift
//  WeatherApp
//
//  Created by Furqan on 29/11/2022.
//

import SwiftUI

struct Rounded_Button: View {
    var text = " "
    var body: some View {
        ZStack
        {
          
                 RoundedRectangle(cornerRadius: 30)
                .frame(height: 50)
                .padding()
               
                 Label(text, systemImage: "location")
                .foregroundColor(.white)
        }
        
    }
}

struct Rounded_Button_Previews: PreviewProvider {
    static var previews: some View {
        Rounded_Button(text:"Hello")
            .previewLayout(.sizeThatFits)
    }
}
