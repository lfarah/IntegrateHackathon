//
//  ViewController.swift
//  IntegrateHackathon
//
//  Created by Lucas Farah on 9/26/15.
//  Copyright © 2015 Lucas Farah. All rights reserved.
//

import UIKit
import Alamofire


extension Dictionary {
  
  func toURLString() -> String {
    var urlString = ""
    
    for (paramNameObject, paramValueObject) in self {
      var paramNameEncoded = (paramNameObject as! String).URLString
      var paramValueEncoded = (paramValueObject as! String).URLString
      
      var oneUrlPiece = paramNameEncoded + "=" + paramValueEncoded
      
      urlString = urlString + (urlString == "" ? "" : "&") + oneUrlPiece
    }
    
    return urlString
  }
  
}

class ViewController: UIViewController {
  
  @IBOutlet weak var strCaption: UILabel!
  @IBOutlet weak var image: UIImageView!
  @IBOutlet weak var web: UIWebView!
  var currentID: String?
  var objectArray: Array<NSDictionary> = []
  var index: Int?
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    //    self.web.loadRequest(NSURLRequest(URL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("test", ofType: "html")!)))
    
    Alamofire.request(.GET, "https://api-sandbox.traitify.com/v1/assessments/3da8a74f-9a7d-42a8-9386-d815903aa450/slides?authorization=467r7d360863if6j03hqt2rao").response { request, response, data, error in
      //        print(request)
      let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
//      print(string)
      self.jsonify(data!)
      
      //        print(response)
      //        print(error)
      
      
    }
    navigationController?.setNavigationBarHidden(navigationController?.navigationBarHidden == false, animated: true) //or animated: false

  }
  
  override func prefersStatusBarHidden() -> Bool {
    return navigationController?.navigationBarHidden == true
  }
  
  override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
    return UIStatusBarAnimation.Fade
  }
  
  func jsonify(jsonData: NSData)
  {
    do
    {
      let jsonResult = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as! NSArray
      
      
      self.currentID = jsonResult[0]["id"] as? String
      let img = jsonResult[0]["image_desktop"] as! String
      
      self.image.image = UIImage(data: NSData(contentsOfURL: NSURL(string: img)!)!)
      self.strCaption.text = jsonResult[0]["caption"] as? String
      self.objectArray = (jsonResult as? Array)!
      index = 0
    }
    catch
    {
      
    }
  }
  
  func post(url: String, params: Dictionary<String, AnyObject>){
    let URL = NSURL(string: url)!
    let req = NSMutableURLRequest(URL: URL)
    req.HTTPMethod = "PUT"
    //    req.setValue("Authorization", forHTTPHeaderField: "Basic 467r7d360863if6j03hqt2rao:x")
    do
    {
      req.HTTPBody = try NSJSONSerialization.dataWithJSONObject(params, options: .PrettyPrinted)
      params.toURLString().dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
      Alamofire.request(req).response
        {
          request, response, data, error in
          let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
          let asd = NSString(data: (request?.HTTPBody!)!, encoding: NSUTF8StringEncoding)
//          print(str)
          
      }
    }
    catch
    {
      
    }
  }
  
  @IBAction func butMeTouched(sender: AnyObject)
  {
    if let id = self.currentID as String!
    {
      self.post("https://api-sandbox.traitify.com/v1/assessments/3da8a74f-9a7d-42a8-9386-d815903aa450/slides/\(id)?authorization=467r7d360863if6j03hqt2rao", params: ["id":"\(id)","response":"true","time_taken":"300"])
      
    }
    if index! + 1 <= 5
    {
      
      self.index = self.index! + 1
      let obj = self.objectArray[index!]
      self.currentID = obj["id"] as? String
      let img = obj["image_desktop"] as! String
      
      self.image.image = UIImage(data: NSData(contentsOfURL: NSURL(string: img)!)!)
      self.strCaption.text = obj["caption"] as? String
      
    }
    else
    {
      self.performSegueWithIdentifier("finished", sender: self)
    }
  }
  
  
  @IBAction func butNotMeTouched(sender: AnyObject)
  {
    if let id = self.currentID as String!
    {
      self.post("https://api-sandbox.traitify.com/v1/assessments/3da8a74f-9a7d-42a8-9386-d815903aa450/slides/\(id)?authorization=467r7d360863if6j03hqt2rao", params: ["id":"\(id)","response":"false","time_taken":"300"])
      
    }
    
    if index! + 1 <= 5
    {
      self.index = self.index! + 1
      let obj = self.objectArray[index!]
      self.currentID = obj["id"] as? String
      let img = obj["image_desktop"] as! String
      
      self.image.image = UIImage(data: NSData(contentsOfURL: NSURL(string: img)!)!)
      self.strCaption.text = obj["caption"] as? String
      
    }
    else
    {
      self.performSegueWithIdentifier("finished", sender: self)
    }
  }
}
