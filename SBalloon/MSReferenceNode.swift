//
//  MSPhysicsNode.swift
//  SBalloon
//
//  Created by phuong on 15/03/2016.
//  Copyright © 2016 phuong. All rights reserved.
//

import SpriteKit

class MSReferenceNode: SKReferenceNode {
    
    /* Avatar node connection */
    var balloon: Balloon!
    
    override func didLoad(_ node: SKNode?) {
        /* Set reference to avatar node */
        balloon = childNode(withName: "//balloon") as? Balloon
    }
}
