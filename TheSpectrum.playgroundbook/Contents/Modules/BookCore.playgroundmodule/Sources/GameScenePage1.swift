//
//  GameScenePage1.swift
//  BookCore
//
//  Created by Juliana Prado on 18/03/21.
//
import SpriteKit
import PlaygroundSupport


public class GameScene: SKScene {
    
    public var label1 = SKSpriteNode(imageNamed: K.gameScene.firstLabel)
    public var label2 = SKSpriteNode(imageNamed: K.gameScene.secondLabel)
    
    public var person1 = SKSpriteNode(imageNamed: K.gameScene.andreasImage)
    public let person2 = SKSpriteNode(imageNamed: K.gameScene.jonasImage)
    public let person3 = SKSpriteNode(imageNamed: K.gameScene.sarahImage)
    
    public let iconGrey = SKSpriteNode(imageNamed: K.theSpectrumGrey)
    public var nextPage = SKSpriteNode(imageNamed: K.nextPageGrey)
    
    public override func didMove(to view: SKView) {
        //background color
        self.backgroundColor = .white
        
        iconGrey.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2 )
        iconGrey.size = CGSize(width: 276, height: 276)
        addChild(iconGrey)
        
        nextPage.position = CGPoint(x: frame.size.width / 2 + frame.size.width * 0.36, y: frame.size.height / 2 - frame.size.height * 0.22)
        nextPage.size = CGSize(width: 70, height: 14.504504504505)
        nextPage.name = "nextPage"
        addChild(nextPage)
    }
    
    
    public func setUpLabels(label: SKSpriteNode, secondLabel: Bool){
        if (secondLabel){
            label.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2 )
            label.size = CGSize(width: 321, height: 66)
            label.alpha = 0
        } else{
            label.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2 + frame.size.width * 0.15)
            label.size = CGSize(width: 506.4, height: 78)
        }
        
        self.addChild(label)
        
   }
    
    public func beginPlaygrounds(){
        //adding three images
        self.removeChildren(in: [nextPage, iconGrey])
        addToNode(person: person1, withSize: CGSize(width: 160.20571428571, height: 195.6), where: "left", name: K.gameScene.andreasImage)
        addToNode(person: person2, withSize: CGSize(width: 171.6, height: 189.8), where: "centre", name: K.gameScene.jonasImage)
        addToNode(person: person3, withSize: CGSize(width: 149.06, height: 194.59), where: "right", name: K.gameScene.sarahImage)
        
        //adding first label
        setUpLabels(label: label1, secondLabel: false)
    }
    
    public func addToNode(person node: SKSpriteNode, withSize size: CGSize, where direction: String, name: String){
        node.name = name
        if (direction == "left"){
            node.position = CGPoint(x: frame.size.width * 0.2, y: frame.size.height / 2 - frame.size.width * 0.15)
        } else if (direction == "centre"){
            node.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2 - frame.size.width * 0.15)
        } else if (direction == "right"){
            node.position = CGPoint(x: frame.size.width / 2 + frame.size.width * 0.3, y: frame.size.height / 2 - frame.size.width * 0.15)
        } else{
            exit(0)
        }
       
        node.size =  size
        self.addChild(node)
    }
    

    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
       
        if touchedNode.name == "nextPage"{
            beginPlaygrounds()
        }
        
        if touchedNode.name == K.gameScene.andreasImage{
            touchedNodeDisplay(touchedNode)
            let seconds = 1.7
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    let newScene = pickedAndreas(size: CGSize(width: K.view.width, height: K.view.height))
                    newScene.scaleMode = .aspectFill
                    let transition = SKTransition.fade(with: SKColor.black, duration: 0.5)
                    self.view?.presentScene(newScene, transition: transition)
                }
        } else if touchedNode.name == K.gameScene.jonasImage {
            touchedNodeDisplay(touchedNode)
            let seconds = 1.7
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    let newScene = pickedJonas(size: CGSize(width: K.view.width, height: K.view.height))
                    newScene.scaleMode = .aspectFill
                    let transition = SKTransition.fade(with: SKColor.black, duration: 0.5)
                    self.view?.presentScene(newScene, transition: transition)
                }
        } else if touchedNode.name == K.gameScene.sarahImage {
            touchedNodeDisplay(touchedNode)
            let seconds = 1.7
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    let newScene = pickedSarah(size: CGSize(width: K.view.width, height: K.view.height))
                    newScene.scaleMode = .aspectFill
                    let transition = SKTransition.fade(with: SKColor.black, duration: 0.5)
                    self.view?.presentScene(newScene, transition: transition)
                }
        } else{
            print("unknown node.")
        }
        
    }
    
    public func touchedNodeDisplay(_ node: SKNode){
        node.alpha = 1
        let seconds = 0.4
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.removeAllChildren()
            self.setUpLabels(label: self.label2, secondLabel: true)
            let fadeIn = SKAction.fadeIn(withDuration: 0.5)
            self.label2.run(fadeIn)
            
        }
    }
}

public class LiveViewControllerPage1: LiveViewController{
    
    var scene:GameScene!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let sceneView = SKView(frame: K.view.viewFrame)
        
        let gameScene = GameScene(size: CGSize(width: K.view.width, height: K.view.height))
        gameScene.scaleMode = .aspectFill
        sceneView.presentScene(gameScene)
        self.view = sceneView
    }
    
    public override func receive(_ message: PlaygroundValue) {
        
    }
}
