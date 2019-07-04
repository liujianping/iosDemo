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
        let client = Helloworld_GreeterServiceClient(address: ":50051", secure: false)
        var req = Helloworld_HelloRequest()
        req.name = "JayL"
        do {
            let resp = try client.sayHello(req)
            print("resp: \(resp.message)")
        } catch {
            print("error: \(error.localizedDescription)")
        }
    }


}

