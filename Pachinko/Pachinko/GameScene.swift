//
//  GameScene.swift
//  Pachinko
//
//  Created by Ruter on 16/4/20.
//  Copyright (c) 2016年 Ruter. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
      let background = SKSpriteNode(imageNamed: "background.jpg")
      background.position = CGPoint(x: 512, y: 384)
      background.blendMode = .Replace
      background.zPosition = -1
      
      makeBouncerAt(CGPoint(x: 0, y: 0))
      makeBouncerAt(CGPoint(x: 256, y: 0))
      makeBouncerAt(CGPoint(x: 512, y: 0))
      makeBouncerAt(CGPoint(x: 768, y: 0))
      makeBouncerAt(CGPoint(x: 1024, y: 0))
      
      addChild(background)
      
      physicsBody = SKPhysicsBody(edgeLoopFromRect: frame)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
      if let touch = touches.first {
        let location = touch.locationInNode(self)
        let ball = SKSpriteNode(imageNamed: "ballRed")
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.0)
        ball.physicsBody!.restitution = 0.4
        ball.position = location
        
        addChild(ball)
      }
    }
  
  func makeBouncerAt(position: CGPoint) {
    let bouncer = SKSpriteNode(imageNamed: "bouncer")
    bouncer.position = position
    bouncer.physicsBody = SKPhysicsBody(circleOfRadius: bouncer.size.width / 2.0)
    bouncer.physicsBody!.dynamic = false
    
    addChild(bouncer)
  }
  
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
