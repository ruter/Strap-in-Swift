//
//  WhackSlot.swift
//  Whack-a-Penguin
//
//  Created by Ruter on 16/4/25.
//  Copyright © 2016年 Ruter. All rights reserved.
//

import SpriteKit
import UIKit

class WhackSlot: SKNode {
  
  func configureAtPosition(pos: CGPoint) {
    position = pos
    
    let sprite = SKSpriteNode(imageNamed: "whackHole")
    addChild(sprite)
  }
}
