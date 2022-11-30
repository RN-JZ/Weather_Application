//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Furqan on 29/11/2022.
//

import Foundation
import CoreLocation

class LocationManager:NSObject , ObservableObject , CLLocationManagerDelegate
{
    let manager = CLLocationManager()
    @Published var Location:CLLocationCoordinate2D?
    @Published var isLoading:Bool = false
    override init() {
        super.init()
        manager.delegate = self
        
    }
    func requesrLocation()
    {
        isLoading = true
        Location = CLLocationCoordinate2D(latitude: 37.785834, longitude: -122.406417)
        manager.requestLocation()
    }
    
    func locationManager
    (_ manger:CLLocationManager, didUpdateLocations loc: [CLLocation])
    {
        Location = loc.first?.coordinate
        isLoading = false
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        
        print("Error getting location" , error)
        isLoading = false
    }
}
