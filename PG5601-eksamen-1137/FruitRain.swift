//
//  FruitRain.swift
//  PG5601-eksamen-1137
//
//  Created by Bruker on 24/11/2022.
//

import SpriteKit
import GameplayKit


class FruitRain: SKScene{
    override func sceneDidLoad(){
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        // anchor point..
        anchorPoint = CGPoint (x: 0.5, y: 1)
        // bg Color...
        backgroundColor = .clear
        // creating node and adding to scene...
        let node = SKEmitterNode (fileNamed: "FruitRainFall.sks")!
        addChild(node)
        // Full width...
        node.particlePositionRange.dx = UIScreen.main.bounds.width
    }
    
}
//class FruitRain: SKScene, SKPhysicsContactDelegate {
//    var backgroundColorCustom = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.2)
//
//    override func didMove(to view: SKView) {
//        setupGame()
//        self.backgroundColor = backgroundColorCustom
//    }
//
//    func setupGame() {
//      guard let view = self.view else { return }
//
//      // Create a ball that looks like a circle and acts like a circle to the physics engine
//      let ball = SKShapeNode(circleOfRadius: 10)
//      ball.physicsBody = SKPhysicsBody(circleOfRadius: 10)
//
//      // Put it in the center of the screen and make it white
//      ball.position = CGPoint(x: view.frame.midX, y: view.frame.midY)
//      ball.fillColor = .red
//
//      addChild(ball)
//
//      // Create the ground which looks and acts like a rectangle at the bottom of the screen
//      let groundHeight: CGFloat = 40
//      let size = CGSize(width: view.frame.size.width, height: groundHeight)
//      let ground = SKShapeNode(rectOf: size)
//      ground.physicsBody = SKPhysicsBody(rectangleOf: size)
//
//      // Put the ground on the bottom of the screen and make it brown
//      ground.position = CGPoint(x: view.frame.midX, y: groundHeight / 2)
//      ground.fillColor = .brown
//
//      // The ground is not affected by gravity and doesn't move
//      ground.physicsBody?.isDynamic = false
//
//      addChild(ground)
//    }
//}
