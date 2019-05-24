//
//  ForeCastingController.swift
//  Weather Forecasting
//
//  Created by MD ISHTIYAK on 24/05/19.
//  Copyright © 2019 MD ISHTIYAK. All rights reserved.
//


import Foundation

//MARK:CREATE LIST DELEGATE METHODS
protocol FetchList: class {
    func dataReceivedLists(list: [List])
}



class DBProvider{
    
    private static let _instance = DBProvider();
    
    weak var delegate               : FetchList?
   
    
    private init() {}
    
    static var Instance: DBProvider {
        return _instance;
    }
    
    
    //MARK: GET ALL DATA FROM API
    func getAllDataFromApi(lat: String, lon: String){
        
         var ListData      =   [List]()
        
        let url = Urls.mainUrl + "lat=\(lat)&lon=\(lon)&APPID=\(Ids.AppId)"
        
        WebService.callWebServices(url: url, methodName: Methods.GET, parameters: "", showLoader: true, message: "Loading...") { (returnJson) in
            
            
            if let status     =   returnJson.value(forKey: "cod") as? String{
                if status   ==  "200" {
                   
                    if let list = returnJson.value(forKey: "list") as? [NSDictionary]{
                        
                        if let city = returnJson.value(forKey: "city") as? NSDictionary{
                            
                            
                            let allData = List(list: list, city: city)
                            
                            ListData.append(allData)
                            
                            if list.count == ListData[0].lists.count{
                                
                                 self.delegate?.dataReceivedLists(list: ListData)
                                
                            }
    
                        }
                        
                    }
                    
                }
            }
        }
    }

    
}
