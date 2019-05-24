//
//  ViewController.swift
//  Weather Forecasting
//
//  Created by MD ISHTIYAK on 23/05/19.
//  Copyright © 2019 MD ISHTIYAK. All rights reserved.
//

import UIKit
import CoreLocation

class TodayController: UIViewController,CLLocationManagerDelegate, FetchList {

    
    @IBOutlet weak var lblCounrtryName: UILabel!
    @IBOutlet weak var lblTamprature: UILabel!
    @IBOutlet weak var lblRain: UILabel!
    @IBOutlet weak var lblSnow: UILabel!
    @IBOutlet weak var lblC: UILabel!
    @IBOutlet weak var lblWind: UILabel!
    @IBOutlet weak var lblWatch: UILabel!
    
    
    
     var locationManager:CLLocationManager!
     var listDetails = [List]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        determineMyCurrentLocation()
    }
    
    //MARK: DELEGATE METHODS
    func dataReceivedLists(list: [List]) {
        listDetails = list
        
        if listDetails.count > 0{
            populateDetails()
        }
    }
    
    
    func populateDetails(){
        
        if let name = listDetails[0].city.value(forKey: "name") as? String{
            
            if let country = listDetails[0].city.value(forKey: "country") as? String{
                
                lblCounrtryName.text = name + ", " + country
                Keys.cityTitle       = name
            }
            
        }
        
   
        
        if let wind = listDetails[0].lists[0].value(forKey: "wind") as? NSDictionary{
            
            if let speed = wind.value(forKey: "speed") as? Double{
                
                lblWind.text = String(format: "%.1f", speed * 1.61) + " kph"
                
            }
  
        }
        
    
        
        if let wind = listDetails[0].lists[0].value(forKey: "main") as? NSDictionary{
            
            if let temp = wind.value(forKey: "temp") as? Double{
                
                lblC.text = String(format: "%.0f", temp - 273.15)
                
                if let weather = listDetails[0].lists[0].value(forKey: "weather") as? [NSDictionary]{
                    
                    if let des = weather[0].value(forKey: "description") as? String{
                        
                        lblTamprature.text = String(format: "%.0f", temp - 273.15) + " | " + des
                    
                        
                    }
                    
                }
 
                
            }
            
        }
        
        
        if let rainPercentage = listDetails[0].lists[0].value(forKey: "clouds") as? NSDictionary{
            
            if let temp = rainPercentage.value(forKey: "all") as? Int{
                
                lblRain.text = "\(temp)" + " %"
                
            }
            
        }
        
        if let rainMilimiter = listDetails[0].lists[0].value(forKey: "rain") as? NSDictionary{
            
            if let temp1 = rainMilimiter.value(forKey: "3h") as? Double{
                
                lblSnow.text = "\(temp1)" + " mm"
                
            }
            
        }
        
        if let windDegree = listDetails[0].lists[0].value(forKey: "wind") as? NSDictionary{
            
            if let heading = windDegree.value(forKey: "deg") as? Double{
                let directions = ["N", "NE", "E", "SE", "S", "SW", "W", "NW"]
                let index = Int((heading / 45).rounded()) % 8
                lblWatch.text = directions[index]
            }
            
        }
        
      
        
        if let wind = listDetails[0].lists[0].value(forKey: "main") as? NSDictionary{
            
            if let temp = wind.value(forKey: "temp") as? Double{
                
                lblC.text = String(format: "%.0f", temp - 273.15)
                
            }
            
        }
        
        
        
        
    }
    
    
    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
         manager.stopUpdatingLocation()
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        Keys.lat = "\(userLocation.coordinate.latitude)"
        print("user longitude = \(userLocation.coordinate.longitude)")
        Keys.long = "\(userLocation.coordinate.longitude)"
        
        DBProvider.Instance.delegate = self
        DBProvider.Instance.getAllDataFromApi(lat: "\(userLocation.coordinate.latitude)", lon: "\(userLocation.coordinate.longitude)")
        
       
       
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
    
}

