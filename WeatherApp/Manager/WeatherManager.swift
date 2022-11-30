

import Foundation
import CoreLocation
class WeatherManger
{
    func getWeatherAPI(lantitude:CLLocationDegrees , longitude:CLLocationDegrees)async throws ->ResponseBody
    {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lantitude)&lon=\(longitude)&appid=\("944c49726802f37e44c8250ef64da1b0")")
        else{
            fatalError("Missing URL")
            
        }
        let request =  URLRequest(url: url)
        let(data,renponse) = try await URLSession.shared.data(for: request)
        guard (renponse as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error Fetching data")
        }
        let decodedData = try JSONDecoder().decode(ResponseBody.self ,from: data)
        
        return decodedData
    }
}

struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}
