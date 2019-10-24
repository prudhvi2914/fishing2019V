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
    
    
    var bgsky: SKSpriteNode!
    var ship: SKSpriteNode!
    var hook: SKSpriteNode!
    var ocean: SKSpriteNode!
    var gameIsRunnig = false
    var oceanmoving:String = ""
    var numloops = 0
    
    
    //-----------------
    var background: SKSpriteNode!
    var backgroundYpos = 0
    var backgroundUpSide = 0
    
    
//    var backgroundSpeed: CGFloat = 80.0 // speed may vary as you like
//    var deltaTime: TimeInterval = 0
//    var lastUpdateTimeInterval: TimeInterval = 0
    //------------------------
    let HANGER_SPEED:CGFloat = 1
    let ALLFISH_SPEED:CGFloat = 80
    let SPRITE_SPEED:CGFloat = 3

    

    //----------------
    //func setUpBackgrounds() {
    //add background

//    for i in 0..<3 {
//        // add backgrounds, my images were namely, bg-0.png, bg-1.png, bg-2.png
//
//        let background = SKSpriteNode(imageNamed: "ocean1")
//        background.anchorPoint = CGPoint.zero
//        background.position = CGPoint(x: CGFloat(i) * size.height, y: 650)
//        background.size = self.size
//        background.zPosition = -5
//        background.name = "Background"
//        self.addChild(background)
//
//    }
//
//    for i in 0..<3 {
//        // I have used one ground image, you can use 3
//        let ground = SKSpriteNode(imageNamed: "ocean2")
//        ground.anchorPoint = CGPoint(x: 0, y: 0)
//        ground.size = CGSize(width: self.size.width, height: ground.size.height)
//        ground.position = CGPoint(x: CGFloat(i) * size.width, y: 0)
//        ground.zPosition = 1
//        ground.name = "ground"
//        self.addChild(ground)
//
//    }
 //   }
    
    
    
    //----moving backgrounds
//    func updateBackground() {
//        self.enumerateChildNodes(withName: "Background") { (node, stop) in
//
//            if let back = node as? SKSpriteNode {
//                let move = CGPoint(x: -self.backgroundSpeed * CGFloat(self.deltaTime), y: 0)
//                back.position += move
//
//                if back.position.x < -back.size.width {
//                    back.position += CGPoint(x: back.size.width * CGFloat(3), y: 0)
//                }
//            }
//
//        }
//    }
//
//    func updateGroundMovement() {
//        self.enumerateChildNodes(withName: "ground") { (node, stop) in
//
//            if let back = node as? SKSpriteNode {
//                let move = CGPoint(x: -self.backgroundSpeed * CGFloat(self.deltaTime), y: 0)
//                back.position += move
//
//                if back.position.x < -back.size.width {
//                    back.position += CGPoint(x: back.size.width * CGFloat(3), y: 0)
//                }
//            }
//
//        }
//    }
//    //-------
    //-------
//MARK: didmove
    override func didMove(to view: SKView) {
        createGrounds()
       // setUpBackgrounds()
        self.ocean = self.childNode(withName: "ocean") as! SKSpriteNode
        self.ship = self.childNode(withName: "ship") as! SKSpriteNode
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.hook = self.childNode(withName: "hook") as! SKSpriteNode
        self.bgsky = self.childNode(withName: "bgsky") as! SKSpriteNode
        }
    //MARK: collision detect when collision occurs
     func didBegin(_ contact: SKPhysicsContact) {
         print("didbegin called")

         let nodeA = contact.bodyA.node
         let nodeB = contact.bodyB.node

         if (nodeA == nil || nodeB == nil) {
             return
         }
         if (nodeA!.name == "ship" && nodeB!.name == "hook") {
             // player die
             print("ship and hook collied")
//            let move = SKAction.moveBy(x: 0, y: 9, duration: 1)
//            for (int i = 0 ; i < fish.size ; i++ ){
//
//                fish f = fish.get(i)
//                f.run(move)
//
//            }
        
        }
         if (nodeA!.name == "hook" && nodeB!.name == "ship") {
            print("hook and ship are collided")
             // player die
            // restartPlayer()
         }

                print("COLLISION DETECTED")
                print("Sprite 1: \(nodeA!.name)")
                print("Sprite 2: \(nodeB!.name)")
                print("------")

     }
    
    
    func throwfish(){
        
        
        
        
    }
    //MARK: spawn fish method
     var fish:[SKSpriteNode] = []
     func spawnfish() {
     let fish = ["img0","img1","img2","img3","img4","img5","img6","img7","img8"]
     let random = Int.random(in: 0...8)
     let jelly:SKSpriteNode = SKSpriteNode(imageNamed: fish[random])

            // generate a random x position
     let randomXPos = CGFloat.random(in: -400 ... -300)
     let randomYPos = CGFloat.random(in: -900 ... 0)
     jelly.position = CGPoint(x:randomXPos, y:randomYPos)
     print("fish\([random])")

               // add the cat to the screen
     addChild(jelly)
               // add the cat to the array
     self.fish.append(jelly)

           }
    
    func createGrounds(){
        for i in 0...5{
            let ground = SKSpriteNode(imageNamed: "backimg")
         //   let ground2 = SKSpriteNode(imageNamed: "wave")

            ground.name = "sky"
            //height 33
//            ground.size = CGSize(width: (self.scene?.size.width)!, height: 33)
//            ground.anchorPoint = CGPoint(x: 0.5, y: -21.5 )
            ground.size = CGSize(width: (self.scene?.size.width)!, height: 3000)
            ground.anchorPoint = CGPoint(x: 0.5, y: 0.5 )
            ground.zPosition = -5
            ground.position = CGPoint(x: CGFloat(i) * ground.size.width, y: -(self.frame.size.height/2))
            
            self.addChild(ground)
            
        }
    }
    
    func moveGrounds(){
        self.enumerateChildNodes(withName: "sky", using: ({
            
        (node, error) in
            node.position.x -= 2
            if node.position.x < -((self.scene?.size.width)!){
                node.position.x += (self.scene?.size.width)! * 5
            }
            
        }))
    }
    override func update(_ currentTime: TimeInterval) {
        numloops = numloops + 1;
        if(numloops % 50 == 0){
        spawnfish()
        }
        
    }



    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {


         let mouseTouch = touches.first
                      if(mouseTouch==nil){
                          return
                      }
         let location = mouseTouch!.location(in: self)
         let nodeTouched = atPoint(location).name
          if (nodeTouched == "hook"){
          gameIsRunnig = true
            
            oceanmoving = "up"
            
            
           
        }
    }
        }
        

    
    
    
