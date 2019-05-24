//
//  ViewController.swift
//  Weather Forecasting
//
//  Created by MD ISHTIYAK on 23/05/19.
//  Copyright © 2019 MD ISHTIYAK. All rights reserved.
//

import Foundation


//MARK: Model for List
class List{
    
     //MARK: Required parameters
     private var  _list             =    [NSDictionary]()
     private var _city              =    NSDictionary()
     
     
     
     //MARK: Initializing required parameters
     init(list: [NSDictionary], city: NSDictionary){
     
     _list                  =       list
     _city                  =       city
     
     }
     
     
    //MARK: Return All Required Parameters
    var lists: [NSDictionary]{
        get{
            return _list
        }
    }
    
    var city: NSDictionary{
        get{
            return _city 
        }
    }
    
}






