//
//  ViewController.swift
//  iosDemo
//
//  Created by Jay Liu on 2/7/2019.
//  Copyright © 2019 GitDiG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let client = Hello_HelloServiceServiceClient(address: ":8833", secure: false)
        var req = Hello_HelloRequest()
        req.greeting = "JayL"
        do {
            let resp = try client.sayHello(req)
            print("resp: \(resp.reply)")
        } catch {
            print("error: \(error.localizedDescription)")
        }
    }


}

