//
//  GameScene.swift
//  Ridiculousfishing
//
//  Created by satram prudhvi on 2019-10-20.
//  Copyright © 2019 satram prudhvi. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    
    var play: SKSpriteNode!
    var hanger: SKSpriteNode!
    
    
    

    
    override func didMove(to view: SKView) {
        
          self.hook = self.childNode(withName: "hook") as! SKSpriteNode
                    self.boatnode = self.childNode(withName: "boatnode") as! SKSpriteNode
        
        
    }
     var fish:[SKSpriteNode] = []
            func spawnfish() {
            let cat:SKSpriteNode = SKSpriteNode(imageNamed: "img")
               
               // generate a random x position and y pos
               let randomXPos = CGFloat.random(in: -700 ... 0)
               let randomYPos = CGFloat.random(in: 500 ... size.height/2-50)
               cat.position = CGPoint(x:randomXPos, y:randomYPos)
               
               // add the cat to the screen
               addChild(cat)
               
               // add the cat to the array
               self.fish.append(cat)
               
           }
    
    override func update(_ currentTime: TimeInterval) {
    }
    
 
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
               
           }
        
        
        
        }
        

    
    
    
