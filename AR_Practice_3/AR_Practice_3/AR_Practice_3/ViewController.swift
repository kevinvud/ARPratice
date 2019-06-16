//
//  ViewController.swift
//  AR_Practice_3
//
//  Created by DevOS on 6/16/19.
//  Copyright © 2019 DevOS. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    let scnView: ARSCNView = {
        let scn_view = ARSCNView()
        return scn_view
    }()
    
    let configuration = ARWorldTrackingConfiguration()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

