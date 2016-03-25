//
//  ViewController.swift
//  SampleAppForSwift
//
//  Created by ao2-y on 2016/03/26.
//  Copyright © 2016年 ao2-y. All rights reserved.
//

import UIKit
import SwiftSampleFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        SampleClass.test()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

