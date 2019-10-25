//
//  Gameover.swift
//  Ridiculousfishing
//
//  Created by satram prudhvi on 2019-10-24.
//  Copyright © 2019 satram prudhvi. All rights reserved.
//


import Foundation
import SpriteKit

class Gameover:SKScene {
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func didMove(to view: SKView) {
        // SPRITE SETUP
        let background = SKSpriteNode(imageNamed:"hi")
        // put backgound in the middle of screen
        background.position = CGPoint(x:size.width/2, y:size.height/2)
        addChild(background)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // when person touches screen, show the main screen
        let mainGameScreen = GameScene(size:self.size)
        self.view?.presentScene(mainGameScreen)
    }
    
    
}


