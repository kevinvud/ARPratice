//
//  ARMainViewController.swift
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
    
    let addButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 20
        button.setTitle("Add", for: .normal)
        button.addTarget(self, action: #selector(addButtonTouchUpAction), for: .touchUpInside)
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 20
        button.setTitle("Reset", for: .normal)
        button.addTarget(self, action: #selector(resetButtonTouchUpAction), for: .touchUpInside)
        return button
    }()
    
    let configuration = ARWorldTrackingConfiguration()
    
    @objc func addButtonTouchUpAction(){
        let random_x = Float.random(in: -0.3 ..< 0.3)
        let random_y = Float.random(in: -0.5 ..< 0.5)
        let random_z = Float.random(in: -0.8 ..< -0.1)
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        node.geometry?.firstMaterial?.specular.contents = UIColor.white
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        self.SCNView.scene.rootNode.addChildNode(node)
        node.position = SCNVector3(random_x, random_y, random_z)
        print("Touch")
    }
    
    @objc func resetButtonTouchUpAction(){
        self.SCNView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        self.SCNView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUpUILayout()
        SCNView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        SCNView.session.run(configuration, options: [])
        SCNView.autoenablesDefaultLighting = true
    }
    
    func SetUpUILayout() {
        
        view.addSubview(SCNView)
        SCNView.addSubview(addButton)
        SCNView.addSubview(resetButton)
        SCNView.anchor_v2(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        addButton.anchor_v2(top: nil, leading: SCNView.leadingAnchor, bottom: SCNView.bottomAnchor, trailing: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 32, paddingRight: 0, width: 100, height: 40)
        resetButton.anchor_v2(top: nil, leading: nil, bottom: SCNView.bottomAnchor, trailing: SCNView.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 32, paddingRight: 16, width: 100, height: 40)
    }
}
