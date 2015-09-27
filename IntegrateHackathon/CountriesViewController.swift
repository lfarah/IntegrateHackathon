//
//  CountriesViewController.swift
//  IntegrateHackathon
//
//  Created by Lucas Farah on 9/26/15.
//  Copyright © 2015 Lucas Farah. All rights reserved.
//

import UIKit
import Alamofire
class CountriesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
  
  
  var array: NSMutableArray = []
  @IBOutlet weak var table: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    
    self.server()
    
    navigationController?.setNavigationBarHidden(navigationController?.navigationBarHidden == false, animated: true) //or animated: false

    
  }
  
  override func prefersStatusBarHidden() -> Bool {
    return navigationController?.navigationBarHidden == true
  }
  
  override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
    return UIStatusBarAnimation.Fade
  }
  
  
  func json()
  {
  }
  
  func server()
  {
    
    
    
    Alamofire.request(.GET, "http://travelwithus.eu-gb.mybluemix.net/country/3da8a74f-9a7d-42a8-9386-d815903aa450")
      .response { request, response, data, error in
        
        let sds = NSString(data: data!, encoding: NSUTF8StringEncoding)
        do
        {
          let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSArray
          
          print(jsonResult)
          
          for placeName in jsonResult
          {
            
            if let path = NSBundle.mainBundle().pathForResource("places", ofType: "json")
            {
              do
              {
                let jsonData = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                let jsonResult = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as! NSArray
                
                let dic = NSMutableDictionary()
                for place in jsonResult
                {
                  if let pName = place["City"] as! String?
                  {
                    if pName == placeName as! String
                    {
                      print(pName)
                      if let description = place["description"] as! String?
                      {
                        print(description)
                        print("---------")
                        
                        dic["name"] = pName
                        dic["description"] = description
                        
                        if let image = place[""] as! String?
                        {
                          dic["image"] = image
                        }
                        self.array.addObject(dic)
                      }
                    }
                  }
                }
                self.table.reloadData()
                
                //        print(jsonResult)
              }
              catch
              {
                
              }
              
            }
            
          }
        }
        catch
        {
          print(error)
        }
        
        
    }
    
  }
  
  
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return self.array.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
  {
    var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! TableViewCell!
    if !(cell != nil)
    {
      cell = TableViewCell(style:.Default, reuseIdentifier: "cell")
    }
    // setup cell without force unwrapping it
    let item = array[indexPath.row]
    cell.name.text = item["name"] as? String
    cell.img.image = UIImage(data: NSData(contentsOfURL: NSURL(string: item["image"] as! String)!)!)
    return cell
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
  {
   self.performSegueWithIdentifier("show", sender: self)
  }
}

/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
// Get the new view controller using segue.destinationViewController.
// Pass the selected object to the new view controller.
}
*/


