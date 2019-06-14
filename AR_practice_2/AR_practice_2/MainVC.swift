//
//  MainVC.swift
//  AR_practice_2
//
//  Created by DevOS on 6/8/19.
//  Copyright © 2019 DevOS. All rights reserved.
//

import UIKit
import ARKit

class MainVC: UIViewController {
    
    let SCNView: ARSCNView = {
        let scn_view = ARSCNView()
        return scn_view
    }()

    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUpUILayout()
        SCNView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        SCNView.session.run(configuration, options: [])
        SCNView.autoenablesDefaultLighting = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        let earth = SCNNode()
        earth.geometry = SCNSphere(radius: 0.2)
        earth.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "earth_daymap")
        earth.position = SCNVector3(0, 0, -1)
        self.SCNView.scene.rootNode.addChildNode(earth)
        
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(Int(360).degreeToRadian), z: 0, duration: 15)
        let repeat_forever = SCNAction.repeatForever(action)
        earth.runAction(repeat_forever)
    }
    
    func SetUpUILayout() {
        view.addSubview(SCNView)
        SCNView.anchor_v2(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
}
