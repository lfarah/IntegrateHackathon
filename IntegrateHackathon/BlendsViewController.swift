//
//  BlendsViewController.swift
//  IntegrateHackathon
//
//  Created by Lucas Farah on 9/26/15.
//  Copyright © 2015 Lucas Farah. All rights reserved.
//

import UIKit
import Alamofire
class BlendsViewController: UIViewController {

  @IBOutlet weak var txtTitle1: UILabel!
  @IBOutlet weak var txtTitle2: UILabel!
  
  @IBOutlet weak var txt1: UITextView!
  @IBOutlet weak var txt2: UITextView!
  
  
  @IBOutlet weak var imgv1: UIImageView!
  @IBOutlet weak var imgv2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
      self.server()
    }
  func server()
  {
    
    Alamofire.request(.GET, "http://travelwithus.eu-gb.mybluemix.net/index/3da8a74f-9a7d-42a8-9386-d815903aa450")
      .response { request, response, data, error in
        do
        {
          let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
          
          let blend = jsonResult["personality_blend"] as! NSDictionary
          let type1 = blend["personality_type_1"] as! NSDictionary
          let badge1 = type1["badge"] as! NSDictionary
          let image1 = badge1["image_medium"] as! String
          
          let type2 = blend["personality_type_2"] as! NSDictionary
          let badge2 = type2["badge"] as! NSDictionary
          let image2 = badge2["image_medium"] as! String
          
          self.txt1.text = blend["description"] as! String
          self.txtTitle1.text = blend["name"] as? String
          
          self.imgv1.image = UIImage(data: NSData(contentsOfURL: NSURL(string: image1)!)!)
          self.imgv2.image = UIImage(data: NSData(contentsOfURL: NSURL(string: image2)!)!)

        }
        catch
        {
          
        }
    }
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
