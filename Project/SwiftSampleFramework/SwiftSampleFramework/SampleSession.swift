//
//  SampleSession.swift
//  SwiftSampleFramework
//
//  Created by ao2-y on 2016/05/16.
//  Copyright © 2016年 ao2-y. All rights reserved.
//

import UIKit

class SampleSession: NSObject {
    
    var session:NSURLSession!;
    class var sharedInstance : SampleSession {
        struct Static {
            static let instance : SampleSession = SampleSession();
        }
        return Static.instance
    }
    
    private override init() {
        let config:NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration();
        session = NSURLSession(configuration: config)
    }
    
    func loading(url:NSURL!, completionHandler:(data:NSData?, response:NSURLResponse?, error:NSError?)->Void) {
        let task:NSURLSessionTask = session.dataTaskWithURL(url, completionHandler: completionHandler);
        task.resume();
    }
}

protocol SampleObjectDelegte:class {
    func loadFinishCallback(result:NSDictionary?);
    func loadErrorCallback(error:NSError?);
}

public class SampleObject: NSObject {
    
    weak var delegate:SampleObjectDelegte?;
    
    public var limit:Int! = 10;
    public var country:String! = "jp";
    
    init(delegate:SampleObjectDelegte!) {
        self.delegate = delegate;
    }
    
    public func load() -> Bool {
        let string:String = "https://itunes.apple.com/" + country + "/rss/topgrossingapplications/limit=" + String(limit) + "/json";
        SampleSession.sharedInstance.loading(NSURL(string:string), completionHandler: handler);
        return true;
    }
    
    func handler(data:NSData?, response:NSURLResponse?, error:NSError?) {
        if error != nil || data == nil {
            delegate!.loadErrorCallback(error);
            return;
        }
        do {
            let object:NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! NSDictionary
            delegate!.loadFinishCallback(object);
        } catch let jsonError as NSError {
            delegate!.loadErrorCallback(jsonError);
        }
    }
    
}