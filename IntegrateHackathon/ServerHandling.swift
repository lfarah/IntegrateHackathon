//
//  ServerHandling.swift
//  tweetStalk
//
//  Created by Lucas Farah on 6/3/15.
//  Copyright (c) 2015 Lucas Farah. All rights reserved.
//

import UIKit
import Alamofire

class ServerHandling: NSObject
{
  
  func server()
  {
    Alamofire.request(.GET, "http://httpbin.org/get")
      .response { request, response, data, error in
        print(request)
        print(response)
        print(error)
    }
  }
  
}


//  static func changeTweet(tweet:String)
//  {
//    let data = NSMutableData()
//    let urlPath: String = "http://127.0.0.1:5000/registerword?word=\(tweet)"
//    var url: NSURL = NSURL(string: urlPath)!
//    var request = NSMutableURLRequest(URL: url)
//    var request1: NSURLRequest = NSURLRequest(URL: url)
//    var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?
//    >=nil
//    var dataVal: NSData =  NSURLConnection.sendSynchronousRequest(request1, returningResponse: response, error:nil)!
//    var err: NSErrorPointer
//    let string = NSString(data: dataVal, encoding: NSUTF8StringEncoding)
//    if let str = string
//    {
//      println("Server Response: \(str)")
//    }
//  }
//  static func checkText(text:String) -> String
//  {
//    let data = NSMutableData()
//    
//    var finalWord = ""
//    
//    for letter in text
//    {
//      if letter == " "
//      {
//        finalWord += "+"
//      }
//      else
//      {
//        finalWord += "\(letter)"
//      }
//    }
//    println(finalWord)
//    
//    let urlPath: String = "http://127.0.0.1:5000/analysis?analysis=\(finalWord)"
//    if var url: NSURL = NSURL(string: urlPath)
//    {
//      var request = NSMutableURLRequest(URL: url)
//      var request1: NSURLRequest = NSURLRequest(URL: url)
//      var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?
//      >=nil
//      var dataVal: NSData =  NSURLConnection.sendSynchronousRequest(request1, returningResponse: response, error:nil)!
//      var err: NSErrorPointer
//      let string = NSString(data: dataVal, encoding: NSUTF8StringEncoding)
//      if let str = string
//      {
//        println("Server Response: \(str)")
//        return str as String
//      }
//
//    }
//    return "nope"
//     }
//  
//  private func makeRequest(request: NSMutableURLRequest) {
//    var err:NSError?
//    var session = NSURLSession.sharedSession()
//    let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
//        
//      var err:NSError?
//      var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as? NSDictionary
//      println(json)
//      // Did the JSONObjectWithData constructor return an error? If so, log the error to the console
//          })
//    
//    task.resume()
//  }

 
