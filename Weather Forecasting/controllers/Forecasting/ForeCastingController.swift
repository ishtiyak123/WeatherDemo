//
//  ForeCastingController.swift
//  Weather Forecasting
//
//  Created by MD ISHTIYAK on 24/05/19.
//  Copyright © 2019 MD ISHTIYAK. All rights reserved.
//

import UIKit

class ForeCastingController: UIViewController, FetchList {

    
    @IBOutlet weak var tblForcasting: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    var listDetails = [List]()
    var latttude  = ""
    var longitude = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calllistApi()
        if Keys.cityTitle != ""{
            lblTitle.text = Keys.cityTitle
        }
    }
    
    func calllistApi(){
        
        DBProvider.Instance.delegate = self
        DBProvider.Instance.getAllDataFromApi(lat: Keys.lat, lon: Keys.long)
    }
   
    
    //MARK: DELEGATE METHODS
    func dataReceivedLists(list: [List]) {
        listDetails = list
        tblForcasting.reloadData()
    }
    

}

extension ForeCastingController: UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return weeks.days.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if listDetails.count > 0{
            if section == 0{
                return 4
            }else  if section == 1{
                return 5
            }else  if section == 2{
                return 5
            }else  if section == 3{
                return 5
            }else  if section == 4{
                return 5
            }
            return listDetails[0].lists.count
        }else{
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1")
        let imgWeather = cell?.viewWithTag(1000) as? UIImageView
        let lblTime = cell?.viewWithTag(2000) as? UILabel
        let lbldes  = cell?.viewWithTag(3000) as? UILabel
        let lblCel   = cell?.viewWithTag(4000) as? UILabel
        
        
        if listDetails.count > 0{
            if indexPath.section == 0{
                if let wind = listDetails[0].lists[indexPath.row].value(forKey: "weather") as? [NSDictionary]{
                    
                    if let icon = wind[0].value(forKey: "icon") as? String{
                        
                        imgWeather?.downloaded(from: Urls.imgUrl + "\(icon)" + ".png")
                        
                    }
                    
                    if let main = wind[0].value(forKey: "main") as? String{
                        
                        lbldes?.text = main
                        
                    }
                    
                    if let time = listDetails[0].lists[indexPath.row].value(forKey: "dt_txt") as? String{
                        
                        let timeOnly = String(time.dropFirst(11))
                        
                        lblTime!.text = String(timeOnly.dropLast(3))
                        
                    }
                    
                }
                
                
                if let main = listDetails[0].lists[indexPath.row].value(forKey: "main") as? NSDictionary{
                    
                    if let temp = main.value(forKey: "temp") as? Double{
                        
                        lblCel!.text = String(format: "%.0f", temp - 273.15)
                        
                    }
                    
                }
                
                
                
                return cell!
            }else  if indexPath.section == 1{
                if let wind = listDetails[0].lists[indexPath.row + 5].value(forKey: "weather") as? [NSDictionary]{
                    
                    if let icon = wind[0].value(forKey: "icon") as? String{
                        
                        imgWeather?.downloaded(from: Urls.imgUrl + "\(icon)" + ".png")
                        
                    }
                    
                    if let main = wind[0].value(forKey: "main") as? String{
                        
                        lbldes?.text = main
                        
                    }
                    
                    if let time = listDetails[0].lists[indexPath.row + 5].value(forKey: "dt_txt") as? String{
                        
                        let timeOnly = String(time.dropFirst(11))
                        
                        lblTime!.text = String(timeOnly.dropLast(3))
                        
                    }
                    
                }
                
                
                if let main = listDetails[0].lists[indexPath.row + 5].value(forKey: "main") as? NSDictionary{
                    
                    if let temp = main.value(forKey: "temp") as? Double{
                        
                        lblCel!.text = String(format: "%.0f", temp - 273.15)
                        
                    }
                    
                }
                
                
                
                return cell!
            }else  if indexPath.section == 2{
                if let wind = listDetails[0].lists[indexPath.row + 10].value(forKey: "weather") as? [NSDictionary]{
                    
                    if let icon = wind[0].value(forKey: "icon") as? String{
                        
                        imgWeather?.downloaded(from: Urls.imgUrl + "\(icon)" + ".png")
                        
                    }
                    
                    if let main = wind[0].value(forKey: "main") as? String{
                        
                        lbldes?.text = main
                        
                    }
                    
                    if let time = listDetails[0].lists[indexPath.row + 10].value(forKey: "dt_txt") as? String{
                        
                        let timeOnly = String(time.dropFirst(11))
                        
                        lblTime!.text = String(timeOnly.dropLast(3))
                        
                    }
                    
                }
                
                
                if let main = listDetails[0].lists[indexPath.row + 10].value(forKey: "main") as? NSDictionary{
                    
                    if let temp = main.value(forKey: "temp") as? Double{
                        
                        lblCel!.text = String(format: "%.0f", temp - 273.15)
                        
                    }
                    
                }
                
                
                
                return cell!
            }else  if indexPath.section == 3{
                if let wind = listDetails[0].lists[indexPath.row + 15].value(forKey: "weather") as? [NSDictionary]{
                    
                    if let icon = wind[0].value(forKey: "icon") as? String{
                        
                        imgWeather?.downloaded(from: Urls.imgUrl + "\(icon)" + ".png")
                        
                    }
                    
                    if let main = wind[0].value(forKey: "main") as? String{
                        
                        lbldes?.text = main
                        
                    }
                    
                    if let time = listDetails[0].lists[indexPath.row + 15].value(forKey: "dt_txt") as? String{
                        
                        let timeOnly = String(time.dropFirst(11))
                        
                        lblTime!.text = String(timeOnly.dropLast(3))
                        
                    }
                    
                }
                
                
                if let main = listDetails[0].lists[indexPath.row + 15].value(forKey: "main") as? NSDictionary{
                    
                    if let temp = main.value(forKey: "temp") as? Double{
                        
                        lblCel!.text = String(format: "%.0f", temp - 273.15)
                        
                    }
                    
                }
                
                
                
                return cell!
            }else  if indexPath.section == 4{
                if let wind = listDetails[0].lists[indexPath.row].value(forKey: "weather") as? [NSDictionary]{
                    
                    if let icon = wind[0].value(forKey: "icon") as? String{
                        
                        imgWeather?.downloaded(from: Urls.imgUrl + "\(icon)" + ".png")
                        
                    }
                    
                    if let main = wind[0].value(forKey: "main") as? String{
                        
                        lbldes?.text = main
                        
                    }
                    
                    if let time = listDetails[0].lists[indexPath.row].value(forKey: "dt_txt") as? String{
                        
                        let timeOnly = String(time.dropFirst(11))
                        
                        lblTime!.text = String(timeOnly.dropLast(3))
                        
                    }
                    
                }
                
                
                if let main = listDetails[0].lists[indexPath.row].value(forKey: "main") as? NSDictionary{
                    
                    if let temp = main.value(forKey: "temp") as? Double{
                        
                        lblCel!.text = String(format: "%.0f", temp - 273.15)
                        
                    }
                    
                }
                
                
                
                return cell!
            }
            
        }
        
        return UITableViewCell()
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 56
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = Bundle.main.loadNibNamed("headerViewTableViewCell", owner: self, options: nil)?.first as? headerViewTableViewCell
        
       headerView?.lblTitle.text = weeks.days[section]
        
       return headerView
        
    }
    
    
    
}
