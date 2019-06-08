//
//  ViewController.swift
//  AR_practice_1
//
//  Created by DevOS on 6/3/19.
//  Copyright © 2019 DevOS. All rights reserved.
//

import UIKit
import ARKit

class ARMainViewController: UIViewController {
    
    let SCNView: ARSCNView = {
       let scn_view = ARSCNView()
        
        return scn_view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

