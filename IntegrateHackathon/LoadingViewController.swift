//
//  LoadingViewController.swift
//  IntegrateHackathon
//
//  Created by Lucas Farah on 9/27/15.
//  Copyright © 2015 Lucas Farah. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      var timer = NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector: "update", userInfo: nil, repeats: true)
  }
  
  // must be internal or public.
  func update() {
    // Something cool
    self.performSegueWithIdentifier("loaded", sender: self)
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
