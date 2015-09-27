//
//  UserViewController.swift
//  IntegrateHackathon
//
//  Created by Lucas Farah on 9/27/15.
//  Copyright © 2015 Lucas Farah. All rights reserved.
//

import UIKit
import Alamofire
class UserViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
  @IBOutlet weak var table: UITableView!
  
  var arr: NSMutableArray = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    Alamofire.request(.GET, "http://travelwithus.eu-gb.mybluemix.net/listusers/Rio").response
      {
        request, response, data, error in
        
        let sds = NSString(data: data!, encoding: NSUTF8StringEncoding)
        do
        {
          let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSArray
          
          print(jsonResult)
          
          
          for user in jsonResult
          {
            if let path = NSBundle.mainBundle().pathForResource("people", ofType: "json")
            {
              do
              {
                let jsonData = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                let jsonResult = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as! NSArray
                
                let dic = NSMutableDictionary()
                for name in jsonResult
                {
                  if let pName = name["name"] as! String?
                  {
                    if pName == user as! String
                    {
                      dic["name"] = pName
                      if let picture = name["picture"] as! String?
                      {
                        dic["picture"] = picture
                      }
                      if let email = name["email"] as! String?
                      {
                        dic["email"] = email
                      }
                      if let nationality = name["nationality"] as! String?
                      {
                        dic["nationality"] = nationality
                      }
                      self.arr.addObject(dic)
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
          //          self.arr = (jsonResult.mutableCopy() as? NSMutableArray)!
          self.table.reloadData()
        }
        catch
        {
          
        }
        //        print(jsonResult)
        
    }
    
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return self.arr.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
  {
    var cell = tableView.dequeueReusableCellWithIdentifier("cell2") as! TableViewCell2!
    if !(cell != nil)
    {
      cell = TableViewCell2(style:.Default, reuseIdentifier: "cell2")
    }
    // setup cell without force unwrapping it
    let object = arr.objectAtIndex(indexPath.row) as! NSDictionary
    cell.lbl.text = object["name"] as? String
    
    cell.img.layer.cornerRadius = cell.img.frame.size.height / 2
    cell.img.layer.masksToBounds = true
    cell.img.layer.borderWidth = 0;

    cell.img.image = UIImage(data: NSData(contentsOfURL: NSURL(string: object["picture"] as! String)!)!)
    cell.img.backgroundColor = UIColor.purpleColor()

    return cell
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
  {
    
  }
  
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
