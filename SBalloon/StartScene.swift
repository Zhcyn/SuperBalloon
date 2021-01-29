//
//  GameScene.swift
//  SBalloon
//
//  Created by phuong on 7/7/16.
//  Copyright (c) 2016 phuong. All rights reserved.
//

import SpriteKit

class StartScene: SKScene {
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        scene?.scaleMode = .aspectFill
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        

        
        let gameSceneTemp = GameScene(fileNamed: "GameScene")
        
        scene?.scaleMode = .aspectFill
       
        
        self.scene?.view?.presentScene(gameSceneTemp!, transition: SKTransition.fade(withDuration: 1))
        
        
    }
    
    
    override func update(_ currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
