//
//  GameViewController.swift
//  SBalloon
//
//  Created by phuong on 7/5/16.
//  Copyright (c) 2016 phuong. All rights reserved.
//



import SpriteKit

class MainScene: SKScene {
    
    /* UI Connections */
    var buttonPlay: MSButtonNode!
    
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        
        /* Set UI connections */
        buttonPlay = self.childNode(withName: "buttonPlay") as? MSButtonNode
        
        /* Setup restart button selection handler */
        buttonPlay.selectedHandler = {
            
            /* Grab reference to our SpriteKit view */
            let skView = self.view as SKView!
            
            /* Load Game scene */
            let scene = GameScene(fileNamed:"GameScene") as GameScene!
            
            /* Ensure correct aspect mode */
            scene?.scaleMode = .aspectFit
            
            /* Show debug */
            skView?.showsPhysics = false
            skView?.showsDrawCount = false
            skView?.showsFPS = false
            
            /* Start game scene */
            skView?.presentScene(scene)
        }
        
    }
    
}

