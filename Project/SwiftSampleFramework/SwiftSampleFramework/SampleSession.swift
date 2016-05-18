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

@objc public protocol SampleObjectDelegte {
   func loadFinishCallback(result:NSDictionary!);
   func loadErrorCallback(error:NSError?);
}

public class SampleObject: NSObject {
    
    var delegate:SampleObjectDelegte!;
    
    public var limit:Int! = 10;
    public var country:String! = "jp";
    
    public init(delegate:SampleObjectDelegte) {
        super.init();
        self.delegate = delegate;
    }
    
    @available(*, unavailable, message="init is unavailable, use initWithDelegate")
    override init() {
        // @available(*, unavailable, message="init is unavailable, use initWithDelegate")で抑止しているが、
        // Frameworkにすると抑止できないため、エラーメッセージを表示しクラッシュさせることで使用禁止とさせる
        fatalError("init is unavailable, use initWithDelegate")
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
    
    func successCallback(result:NSDictionary) {
        dispatch_async(dispatch_get_main_queue(), {
            self.delegate.loadFinishCallback(result);
        });
    }
    func errorCallback(error:NSError) {
        dispatch_async(dispatch_get_main_queue(), {
            self.delegate.loadErrorCallback(error);
        });
    }
    
}