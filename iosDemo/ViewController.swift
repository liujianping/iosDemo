//
//  ViewController.swift
//  iosDemo
//
//  Created by Jay Liu on 2/7/2019.
//  Copyright © 2019 GitDiG. All rights reserved.
//

import UIKit
import Golib


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // gRPC client
        let client = Helloworld_GreeterServiceClient(address: ":50051", secure: false)
        var req = Helloworld_HelloRequest()
        req.name = "JayL"
        do {
            let resp = try client.sayHello(req)
            print("resp: \(resp.message)")
        } catch {
            print("error: \(error.localizedDescription)")
        }
        
        // golib
        let reply = GolibGreetings("JayL")
        print("golib reply: \(reply)")

        // golib error
        var err1: NSError?
        var num: Int = 0
        GolibNumberError(11, &num, &err1)
//        print("golib num: \(num), err: \(err1)")
        
        // golib directory walk
        var err2: NSError?
        GolibWalkDirectory(NSHomeDirectory(), &err2)
//        print("golib walk directory err: \(err2)")
     
        // golib sqlite
        var err3: NSError?
        GolibSqliteCrud(FileManager.default.temporaryDirectory.absoluteString, &err3)
//        print("golib sqlite err: \(err3)")
    }

}

