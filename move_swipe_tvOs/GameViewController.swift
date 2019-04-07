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
            self.scnView.allowsCameraControl = false
            self.scnView.showsStatistics = true
            //self.scnView.backgroundColor = UIColor.black
        }
    }
    private func setupScene() {
        self.scnScene = SCNScene()
        self.scnView.scene = self.scnScene
        self.scnScene.background.contents = UIImage(named: "background")
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
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "tube")
        self.tube = SCNTube(innerRadius: 0.25, outerRadius: 0.5, height: 5.0)
        let node = SCNNode(geometry: self.tube)
        node.physicsBody = SCNPhysicsBody(type: .static, shape: nil)
        node.position = SCNVector3(x: 0.0, y: -2.5, z: 12)
        node.eulerAngles = SCNVector3Make(-80, 0, 0);
        self.tube.materials = [material]
        self.scnScene.rootNode.addChildNode(node)
    }
    private func setupTable() {
        guard let tableNode = SCNScene.loadSceneNode(sceneName: "table.scn", nodeName: "table") else { return }
        tableNode.physicsBody = SCNPhysicsBody(type: .static, shape: nil)
        tableNode.position = SCNVector3(x: 0.0, y: -5, z: -5)
        tableNode.rotation = SCNVector4(1, 0, 0, 20)
        self.scnScene.rootNode.addChildNode(tableNode)
    }
    @objc
    func handleTap(_ gestureRecognize: UIGestureRecognizer) {
    
    }
    
}
