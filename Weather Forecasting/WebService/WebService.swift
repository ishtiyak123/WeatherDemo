//
//  ForeCastingController.swift
//  Weather Forecasting
//
//  Created by MD ISHTIYAK on 24/05/19.
//  Copyright © 2019 MD ISHTIYAK. All rights reserved.
//


import Foundation

typealias complition_dictDAta = (_ data: NSDictionary) -> Void
typealias CompletionHandler = (_ dictData: NSDictionary) -> Void
typealias Completion = (_ success: Bool, _ jsonData: NSDictionary) -> Void

class WebService: NSObject {
    
    public override init() {
    }
    
    
    
    //MARK: CALLING WEB SERVICES
    class func callWebService(url: String, methodName: String, parameters: String, showLoader: Bool, message: String, completion: @escaping Completion){
        
        var url_param = url
        
        if showLoader{
            let newMessage = message == "" ? "" : message
            
            if newMessage == "forgotPassword"{
                KVNProgress.show()
            }else{
                KVNProgress.show(withStatus: newMessage)
            }
            
        }
        
        if(methodName == "GET" && parameters != "")
        {
            url_param = url_param + "?" + parameters
        }
        
        var request = URLRequest(url: URL(string: url_param)!)
        request.httpMethod = methodName
        
        if(methodName == "POST" && parameters != "")
        {
            let postString = parameters
            request.httpBody = postString.data(using: .utf8)
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print("error = \(String(describing: error))")
                return
            }
            
            if let httpsStatus = response as? HTTPURLResponse, httpsStatus.statusCode != 200 {
                print("Status Code should be 200, but it is \(httpsStatus.statusCode)")
                print("response = \(String(describing: response))")
                
                completion(false, NSDictionary())
            }
            
            do {
                let dictData = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSDictionary
                
                
                DispatchQueue.main.async {
                    print("Json Result :\(dictData)")
                    
                    //onlyFor this app
                    
                    if message == "forgotPassword"{
                        
                    }else{
                        KVNProgress.dismiss()
                    }
                    
                    completion(true, dictData)
                }
                
            } catch {
                KVNProgress.dismiss()
                completion(false, NSDictionary())
                print("error is : \(error)")
            }
        }
        task.resume()
    }
    
    //MARK: CALLING WEB SERVICES
    class func callWebServices(url: String, methodName: String, parameters: String, showLoader: Bool, message: String, completion: @escaping CompletionHandler){
        
        var url_param = url
        
        if showLoader{
            let newMessage = message == "" ? "" : message
            KVNProgress.show(withStatus: newMessage)
        }
        
        if(methodName == "GET" && parameters != "")
        {
           url_param = url_param + "?" + parameters
        }
        
        var request = URLRequest(url: URL(string: url_param)!)
        request.httpMethod = methodName
        
        if(methodName == "POST" && parameters != "")
        {
            let postString = parameters
            request.httpBody = postString.data(using: .utf8)
        }
      
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print("error = \(String(describing: error))")
                return
            }
            
            if let httpsStatus = response as? HTTPURLResponse, httpsStatus.statusCode != 200 {
                print("Status Code should be 200, but it is \(httpsStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            
            do {
                let dictData = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSDictionary
                
                
                DispatchQueue.main.async {
                    print("Json Result :\(dictData)")
                    KVNProgress.dismiss()
                    completion(dictData)
                }
                
            } catch {
                KVNProgress.dismiss()
                print("error is : \(error)")
            }
        }
        task.resume()
    }
    
    
    

    //MARK : CALLING WEB SEVICES WITH JSON
    class func callWebServicesWithJson(url: String, methodName: String, parameters: NSDictionary, showLoader: Bool, completion: @escaping CompletionHandler){
        
        if showLoader{
  //          KVNProgress.show()
        }
        
        //create the url with URL
        let url = URL(string: url)! //change the url
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = methodName //set http method as POST
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else { return }
            guard let data = data else { return }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSDictionary {
                    
                    //#if DEBUG
                        
                        print(json)
                        
                    //#endif
                    
                    DispatchQueue.main.async {
         //                KVNProgress.dismiss()
                        completion(json)
                    }
                }
                
            } catch let error {
       //          KVNProgress.dismiss()
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
    
    
    //MARK: Download Data From Url
    class func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
}
