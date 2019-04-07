//
//  GameViewController.swift
//  move_swipe_tvOs
//
//  Created by Paloma Bispo on 06/04/19.
//  Copyright © 2019 Paloma Bispo. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    
    var scnView: SCNView!
    var scnScene: SCNScene!
    var cameraNode: SCNNode!
    var tube: SCNTube!
    var table: SCNPlane!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupScene()
        setupCamera()
        setupTube()
        setupTable()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.scnView.addGestureRecognizer(tapGesture)
    }
    private func setupView(){
        if  let scnView = self.view as? SCNView {
            self.scnView = scnView
            self.scnView.scene = self.scnScene
            self.scnView.allowsCameraControl = true
            self.scnView.showsStatistics = true
            self.scnView.backgroundColor = UIColor.black
        }
    }
    private func setupScene() {
        self.scnScene = SCNScene()
        self.scnView.scene = self.scnScene
    }
    private func setupCamera() {
        self.cameraNode = SCNNode()
        self.cameraNode.camera = SCNCamera()
        self.cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
        self.cameraNode.camera?.fieldOfView = 90
        self.cameraNode.eulerAngles = SCNVector3Make(0, 0, 0);
        self.scnScene.rootNode.addChildNode(self.cameraNode)
    }
    private func setupTube() {
        self.tube = SCNTube(innerRadius: 0.25, outerRadius: 0.5, height: 5.0)
        let node = SCNNode(geometry: self.tube)
        node.physicsBody = SCNPhysicsBody(type: .static, shape: nil)
        node.position = SCNVector3(x: 0.0, y: -2.5, z: 12)
        node.eulerAngles = SCNVector3Make(-80, 0, 0);
        self.scnScene.rootNode.addChildNode(node)
    }
    private func setupTable() {
        let widthScreen = UIScreen.main.bounds.width
        self.table = SCNPlane(width: 20, height: 20)
        let node = SCNNode(geometry: self.table)
        node.physicsBody = SCNPhysicsBody(type: .static, shape: nil)
        node.position = SCNVector3(x: 0.0, y: 0.0, z: 12)
        node.eulerAngles = SCNVector3Make(0, 0, 0);
        self.scnScene.rootNode.addChildNode(node)
    }
    @objc
    func handleTap(_ gestureRecognize: UIGestureRecognizer) {
    
    }
    
}
