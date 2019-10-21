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
    
    
    
    var ship: SKSpriteNode!
    var hook: SKSpriteNode!
    var gamerunning = false
    var numloops = 0
    
    

    
    override func didMove(to view: SKView) {
        
        self.hook = self.childNode(withName: "hook") as! SKSpriteNode
        self.ship = self.childNode(withName: "ship") as! SKSpriteNode
        
        
    }
     var fish:[SKSpriteNode] = []
            func spawnfish() {
            let cat:SKSpriteNode = SKSpriteNode(imageNamed: "one")
               
               // generate a random x position
               let randomXPos = CGFloat.random(in: -700 ... 0)
               let randomYPos = CGFloat.random(in: 100 ... size.height/2-50)
               cat.position = CGPoint(x:randomXPos, y:randomYPos)
            
               
               // add the cat to the screen
               addChild(cat)
               
               // add the cat to the array
               self.fish.append(cat)
               
           }
    
    override func update(_ currentTime: TimeInterval) {
        numloops = numloops + 1;
        if(numloops % 200 == 0){
        spawnfish()
        }
       
       
        
    }
    
 
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let mousePosition = touches.first?.location(in: self) else {
                   return
               }
               // MARK: Middle of the screen
               let middleOfScreenWidth = self.size.width/2
               let middleOfScreenHeight = self.size.height/2
               if (mousePosition.x < middleOfScreenWidth ) {
                   print("Move Left")
               }
               else  if (mousePosition.x > middleOfScreenWidth ){
                   print("Move right")
               }
               
               let mouseTouch = touches.first
                      if(mouseTouch==nil){
                          return
                      }
                      
                      let location = mouseTouch!.location(in: self)
                      
                      let nodeTouched = atPoint(location).name
               
                  
                
                  }
               
               
               
           }
        
        
        
        }
        

    
    
    
