//
//  GameScene.swift
//  Space Race
//
//  Created by Yohannes Wijaya on 10/4/15.
//  Copyright (c) 2015 Yohannes Wijaya. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    // MARK: - Stored Properties
    
    var starfield: SKEmitterNode!
    var player: SKSpriteNode!
    var scoreLabel: SKLabelNode!
    
    // MARK: - Property Observers
    
    var score: Int = 0 {
        didSet {
            self.scoreLabel.text = "Score: \(score)"
        }
    }
    
    // MARK: - Methods Override
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        self.backgroundColor = UIColor.blackColor()
        
        self.starfield = SKEmitterNode(fileNamed: "Starfield.sks")!
        self.starfield.position = CGPoint(x: 1024, y: 384)
        self.starfield.advanceSimulationTime(10)
        self.starfield.zPosition = -1
        self.addChild(self.starfield)
        
        self.player = SKSpriteNode(imageNamed: "player")
        self.player.position = CGPoint(x: 100, y: 384)
        self.player.physicsBody = SKPhysicsBody(texture: self.player.texture!, size: self.player.size)
        self.player.physicsBody!.contactTestBitMask = 1
        self.addChild(self.player)
        
        self.scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        self.scoreLabel.position = CGPoint(x: 16, y: 16)
        self.scoreLabel.horizontalAlignmentMode = .Left
        self.addChild(self.scoreLabel)
        
        self.score = 0
     
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsWorld.contactDelegate = self
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
