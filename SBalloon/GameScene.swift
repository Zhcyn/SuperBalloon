//
//  GameScene.swift
//  SBalloon
//
//  Created by phuong on 7/5/16.
//  Copyright (c) 2016 phuong. All rights reserved.
//

import SpriteKit


enum GameState {
    case Title, Ready, Playing, Pause, GameOver
}

/* Game management */
var state: GameState = .Title

class GameScene: SKScene {
    
    let spawnDuration = TimeInterval(0)
    var currentNumberOfBalloons : Int?
    var numberOfBalloons = Int(arc4random() % 15)
    var yCord = Int(arc4random() % 229) + 41
    var randomBalloon = Int(arc4random() % 15)
    var scoreLabel: SKLabelNode!
    var healthBar: SKSpriteNode!
    var playButton: MSButtonNode!
    var pauseButton: MSButtonNode!
    var resumeButton: MSButtonNode!
    var time = 0
    var index = 0
    var background: SKSpriteNode!
    var timeUp: SKLabelNode!
    
    var score: Int = highscore {
        didSet {
            scoreLabel.text = String(score)
        }
    }
    
    /* scaled health bar to 150% because health bar has been scaled up */
    var health: CGFloat = 1.5 {
        didSet {
            healthBar.xScale = health
        }
        
    }
    
    override func didMove(to view: SKView) {
        
        state = .Playing
        
        //balloon = childNodeWithName("//balloon") as! SKSpriteNode
        scoreLabel = childNode(withName: "scoreLabel") as? SKLabelNode
        healthBar = childNode(withName: "healthBar") as? SKSpriteNode
        playButton = childNode(withName: "playButton") as? MSButtonNode
        pauseButton = childNode(withName: "pauseButton") as? MSButtonNode
        resumeButton = childNode(withName: "resumeButton") as? MSButtonNode
        background = childNode(withName: "background") as? SKSpriteNode
        timeUp = childNode(withName: "timeUp") as? SKLabelNode
        
        playButton.selectedHandler = {
            
            
            /* Grab reference to the SpriteKit view */
//            let skView = self.view! as SKView
//
//            /* Load Game scene */
//            let scene = GameScene(fileNamed:"GameScene")
//
//            /* Ensure correct aspect mode */
//            scene?.scaleMode = .aspectFill
//
//            /* Restart GameScene */
//            skView.presentScene(scene)
            
//            highscore = 0
            
            let skView = self.view! as SKView
            
            let gameSceneTemp = GameScene(fileNamed: "GameScene")
            
            skView.scene?.scaleMode = .aspectFill
//            scene?.scaleMode = .aspectFill
           
            
            skView.scene?.view?.presentScene(gameSceneTemp!, transition: SKTransition.fade(withDuration: 1))
            
            highscore = 0
            
        }
        
        pauseButton.selectedHandler = {
            
            state = .Pause
            self.resumeButton.zPosition = 5
            
        }
        
        resumeButton.selectedHandler = {
            state = .Playing
            self.scene!.view!.isPaused = false
            
            self.resumeButton.zPosition = -10
            
        }
        
//        background.position = CGPointMake(284 , 160)
        
    }
    
    override func update(_ currentTime: CFTimeInterval) {
        
        if state == .Pause {
            scene!.view!.isPaused = true
        }
        
        if state == .Playing {

        /* Limits the amount of balloons drifting into the scene */
            if time % 9 == 0 {
                balloonInterval()
            }     
            
            currentNumberOfBalloons = Int(arc4random() % 15)
            
            scoreLabel.text = String(highscore)
            
            health -= 0.002
            
            /* Check whether player runs out of health */
            if health < 0 { gameOver() }
            
            time += 1
        }
        
    }
    
    func balloonInterval() {
        
        //if state != .Playing { return }
        
        let resourcePath = Bundle.main.path(forResource: "balloon", ofType: "sks")
        let balloon = MSReferenceNode(url: NSURL (fileURLWithPath: resourcePath!) as URL)
        
        if index < randomBalloon {
            addChild(balloon)
            
            balloon.balloon.position = CGPoint(x: 600, y: yCord)
            index += 1
            
        }
        yCord = Int(arc4random() % 229) + 41
        randomBalloon = 16000 //Int(arc4random() % 16000)
        
        balloon.run(SKAction.move(by: CGVector(dx: -700, dy: 0), duration: 3 ))
        
        
    }
    
    func gameOver() {
        /* Game over! */
        
        state = .GameOver
        
        /* brings up the times up text */
        timeUp.zPosition = 10
        /* set the health bar to zero */
        healthBar.xScale = 0
        
        
    }
    
}


