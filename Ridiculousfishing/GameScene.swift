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
    
    
    
    var boatnode: SKSpriteNode!
    var hook: SKSpriteNode!
  
    

    
    override func didMove(to view: SKView) {
        
        self.hook = self.childNode(withName: "hook") as! SKSpriteNode
               self.boatnode = self.childNode(withName: "boat") as! SKSpriteNode
        
        
    }


           }
   
    
    override func update(_ currentTime: TimeInterval) {
  
        
        }
    
 
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     
        
        
        
        }
        

    
    
    
