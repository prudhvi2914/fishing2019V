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
    var coi: SKSpriteNode!

    var hook: SKSpriteNode!
    var ocean: SKSpriteNode!
    var gameIsRunnig = false
    var oceanmoving:String = ""
    var numloops = 0
    var scoreLabel:SKLabelNode!
    var coinsLabel:SKLabelNode!
    var highscoreLabel:SKLabelNode!


        
    //-----------------
    var background: SKSpriteNode!
    var backgroundYpos = 0
    var backgroundUpSide = 0
    
    var score = 0
    var coins = 0
    var highscore = 1000
//    var backgroundSpeed: CGFloat = 80.0 // speed may vary as you like
//    var deltaTime: TimeInterval = 0
//    var lastUpdateTimeInterval: TimeInterval = 0
    //------------------------
    let HANGER_SPEED:CGFloat = 1
    let ALLFISH_SPEED:CGFloat = 80
    let SPRITE_SPEED:CGFloat = 3
    let randomX = CGFloat.random(in: -400 ... -300)
               let randomY = CGFloat.random(in: -1000 ... -200)
    
//MARK: didmove
    override func didMove(to view: SKView) {
        
        
        
      //  createGrounds()
       // setUpBackgrounds()
        self.ocean = self.childNode(withName: "ocean") as! SKSpriteNode
        self.ship = self.childNode(withName: "ship") as! SKSpriteNode
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.hook = self.childNode(withName: "hook") as! SKSpriteNode
        self.bgsky = self.childNode(withName: "bgsky") as! SKSpriteNode
//
//        self.coi = self.childNode(withName: "coin") as? SKSpriteNode
//
//          self.coi.position = CGPoint(x: randomX, y: randomY)
//          addChild(coi)
        
            // Add a score label
            self.scoreLabel = SKLabelNode(text: "Score: \(self.score)")
            self.scoreLabel.position = CGPoint(x:100, y:600)
            self.scoreLabel.fontColor = UIColor.green
            self.scoreLabel.zPosition = 3
            self.scoreLabel.fontSize = 65
            self.scoreLabel.fontName = "Avenir"
            addChild(self.scoreLabel)
        // Add a score label
                   self.highscoreLabel = SKLabelNode(text: "HighScore: \(self.highscore)")
                   self.highscoreLabel.position = CGPoint(x:100, y:500)
        self.highscoreLabel.fontColor = UIColor.yellow
                   self.highscoreLabel.zPosition = 3
                   self.highscoreLabel.fontSize = 65
                   self.highscoreLabel.fontName = "Avenir"
                   addChild(self.highscoreLabel)
        // Add a score label
               self.coinsLabel = SKLabelNode(text: ": \(self.coins)")
               self.coinsLabel.position = CGPoint(x:-200, y:555)
               self.coinsLabel.fontColor = UIColor.orange
               self.coinsLabel.zPosition = 3
               self.coinsLabel.fontSize = 60
               self.coinsLabel.fontName = "Avenir"
               addChild(self.coinsLabel)
        
        }
  
    
    
    
    //MARK: spawn fish method
     var fish:[SKSpriteNode] = []
     func spawnfish() {
     let fish = ["img0","img1","img2","img3","img4","img5","img6","img7","img8"]
     let random = Int.random(in: 0...8)
     let jelly:SKSpriteNode = SKSpriteNode(imageNamed: fish[random])

            // generate a random x position
     let randomXPos = CGFloat.random(in: -400 ... -300)
     let randomYPos = CGFloat.random(in: -1000 ... -200)
     jelly.position = CGPoint(x:randomXPos, y:randomYPos)
     print("fish\([random])")

               // add the cat to the screen
     addChild(jelly)
               // add the cat to the array
     self.fish.append(jelly)

           }
    
    var badfish:[SKSpriteNode] = []
              func spawnbadfish() {
              let fish = ["bad","bad"]
              let random = Int.random(in: 0...1)
              let octopus:SKSpriteNode = SKSpriteNode(imageNamed: fish[random])

                     // generate a random x position
              let randomXPos = CGFloat.random(in: -400 ... -300)
              let randomYPos = CGFloat.random(in: -1000 ... -200)
              octopus.position = CGPoint(x:randomXPos, y:randomYPos)

                        // add the cat to the screen
              addChild(octopus)
                        // add the cat to the array
              self.badfish.append(octopus)

                    }
    
    
    
    var goodfish:[SKSpriteNode] = []
      func spawngoodfish() {
      let fish = ["good","coin"]
      let random = Int.random(in: 0...1)
      let orangefishes:SKSpriteNode = SKSpriteNode(imageNamed: fish[random])

             // generate a random x position
      let randomXPos = CGFloat.random(in: -400 ... -300)
      let randomYPos = CGFloat.random(in: -1000 ... -200)
     orangefishes.position = CGPoint(x:randomXPos, y:randomYPos)

                // add the cat to the screen
      addChild(orangefishes)
                // add the cat to the array
      self.goodfish.append(orangefishes)

            }
    
    
//    func alert(title: String , message: String){
//        let alert = UIAlertController(title: "yayy!!! congrats", message: String(score), preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//
//    }
 
    
    var caughtArray:[SKSpriteNode] = []

    override func update(_ currentTime: TimeInterval) {
        
        
        var defaults = UserDefaults()
        var highscore=defaults.integer(forKey: "highscore")

        if(score>highscore)
        {
            defaults.set(score, forKey: "highscore")
//            let alert = UIAlertController(title: "yayy!!! congrats", message: String(score), preferredStyle: .alert)
//                  alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
//                  alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
//
//                  self.present(alert, animated: true,compl)
        }
        var highscoreshow=defaults.integer(forKey: "highscore")

        highscoreLabel.text="HighSCORE: \(highscoreshow)"
     

        
        
        numloops = numloops + 1;
        if(numloops % 50 == 0){
        spawnfish()
        }
        if(numloops % 200 == 0){
        spawngoodfish()
        spawnbadfish()
        }
       //moving the fish to right
        for good in goodfish {
        good.position.x += 1
        }
        for bad in badfish {
        bad.position.x += 1
        }
        for alltypesoffish in fish {
        alltypesoffish.position.x += 1
        }
        
    
        if(oceanmoving == "up"){
        let move = SKAction.moveBy(x: 0, y: 2, duration: 1)
         self.bgsky.run(move)
         self.ocean.run(move)
         self.ship.run(move)
         self.hook.position.y =  self.hook.position.y + HANGER_SPEED
         }
        if(oceanmoving == "down"){
        let move = SKAction.moveBy(x: 0, y: -2, duration: 1)
        self.bgsky.run(move)
        self.ocean.run(move)
        self.ship.run(move)
        if(hook.frame.intersects(ship.frame)){
        oceanmoving = "stop"
        print("toched frames")
        }}
        if(oceanmoving == "stop"){
        ocean.position.x = -21.627
        ocean.position.y = -1139.267
        bgsky.position.x = 304.06
        bgsky.position.y = 878.291
        ship.position.x = -21.627
        ship.position.y = 283.573
            
        }
        
        
        
        let throwfish = SKAction.move(by: CGVector(dx: 300, dy: 600), duration: 7)
                
        for(index,gfish) in self.goodfish.enumerated(){
                       if(hook.frame.intersects(gfish.frame)){
                        
                        self.coinsLabel.text = ": \(self.coins)"

                        self.coins = self.coins + 1

                        gfish.position.x = hook.position.x
                        gfish.position.y = hook.position.y
                        self.hook.position.y =  self.hook.position.y + HANGER_SPEED
                        oceanmoving = "down"

                        if(hook.position.y > 100){
                        self.hook.position.y = 100
                        gfish.zPosition = 1

                gfish.physicsBody = SKPhysicsBody(circleOfRadius: gfish.size.width/2)
                gfish.run(throwfish)



                            }
                        gameIsRunnig = false
                    }
                        else if(gameIsRunnig == true){
                        if(hook.position.y > -500){

                        self.hook.position.y = self.hook.position.y - HANGER_SPEED
                        }
                        }

                        }
        
        
        
        
        ////-----------
        for (index, alltypesoffish) in self.fish.enumerated(){            if(hook.frame.intersects(alltypesoffish.frame)){
            self.scoreLabel.text = "Score: \(self.score)"

            self.score = self.score + 1

            alltypesoffish.position.x = hook.position.x
            alltypesoffish.position.y = hook.position.y
            self.hook.position.y =  self.hook.position.y + HANGER_SPEED
                oceanmoving = "down"

            if(hook.position.y > 100){
            self.hook.position.y = 100
            alltypesoffish.zPosition = 1

                alltypesoffish.physicsBody = SKPhysicsBody(circleOfRadius: alltypesoffish.size.width/2)
    alltypesoffish.run(throwfish)
               
                
                }
            gameIsRunnig = false
        }
            else if(gameIsRunnig == true){
            if(hook.position.y > -500){

            self.hook.position.y = self.hook.position.y - HANGER_SPEED
            }
            }
                
        }
        
        
//        moveGrounds()
        
        
//        if (score >= 1 ){
//          // SHOW LOSE SCREEN
//                    let loseScene = Gameover(size: self.size)
//                    let transitionEffect = SKTransition.flipHorizontal(withDuration: 2)
//        //            self.view?.presentScene(loseScene)
//                    self.view?.presentScene(loseScene, transition:transitionEffect)
//        }
        
        
             for(index,bfish) in self.badfish.enumerated(){
                               if(hook.frame.intersects(bfish.frame)){
                                self.score = 0
                     self.scoreLabel.text = "Score: \(self.score)"
//                                if(score > highscore){
//                                    self.highscore = self.score
//                                       }
                                
                                bfish.position.x = hook.position.x
                                bfish.position.y = hook.position.y
                                self.hook.position.y =  self.hook.position.y + HANGER_SPEED
                                oceanmoving = "down"

                                if(hook.position.y > 100){
                                self.hook.position.y = 100
                                bfish.zPosition = 1


                        bfish.physicsBody = SKPhysicsBody(circleOfRadius: bfish.size.width/2)
                        bfish.run(throwfish)



                                    }
                                gameIsRunnig = false
                            }
                                else if(gameIsRunnig == true){
                                if(hook.position.y > -500){

                                self.hook.position.y = self.hook.position.y - HANGER_SPEED
                                }
                                }

                                }
        
       
        
    }



    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {


         let mouseTouch = touches.first
                      if(mouseTouch==nil){
                          return
                      }
         let location = mouseTouch!.location(in: self)
        self.hook.position.x = location.x
         let nodeTouched = atPoint(location).name
          if (nodeTouched == "hook"){
          gameIsRunnig = true
            
            oceanmoving = "up"
            
            
           
        }
    }
        }
