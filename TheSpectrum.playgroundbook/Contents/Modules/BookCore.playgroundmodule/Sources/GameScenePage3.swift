//
//  GameScenePage3.swift
//  BookCore
//
//  Created by Juliana Prado on 15/04/21.
//

import SpriteKit
import PlaygroundSupport

public class presentingSofie: SKScene {
    
    var pageCounter = 1
    
    //first page
    let person1 = SKSpriteNode(imageNamed: K.gameScene.sofieImage)
    let label1 = SKSpriteNode(imageNamed: K.gameScene3.firstLabel)
    let label2 = SKSpriteNode(imageNamed: K.gameScene3.secondLabel)
    
    //second page
    let person2 = SKSpriteNode(imageNamed: K.gameScene3.sofieImage2)
    let label3 = SKSpriteNode(imageNamed: K.gameScene3.thirdLabel)
    let label4 = SKSpriteNode(imageNamed: K.gameScene3.fourthLabel)
    
    //third page
    let person3 = SKSpriteNode(imageNamed: K.gameScene3.sofieAndI)
    let label5 = SKSpriteNode(imageNamed: K.gameScene3.fithLabel)

    //fourth page
    let person4 = SKSpriteNode(imageNamed: K.gameScene3.sofieYoung)
    let label6 = SKSpriteNode(imageNamed: K.gameScene3.sixthLabel)
    let label7 = SKSpriteNode(imageNamed: K.gameScene3.seventhLabel)
    
    
    public var nextPageText = SKSpriteNode(imageNamed: K.nextPageText)
    public var nextPageArrow = SKSpriteNode(imageNamed: K.nextPageArrow)
    
    public override func didMove(to view: SKView) {
        self.backgroundColor = .white
        setUpNextPage(text: nextPageText, arrow: nextPageArrow)
        
        person1.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        person1.size = CGSize(width: 216, height: 293.4)
        addChild(person1)
        
        label1.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2 + 208)
        label1.size = CGSize(width: 222, height: 28)
        addChild(label1)
        
        label2.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2 - 208)
        label2.size = CGSize(width: 383, height: 58)
        addChild(label2)
    }
    
    
    
    public func nextPage(){
        if pageCounter == 1{
            self.removeChildren(in: [person1, label1, label2])
            person2.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
            person2.size = CGSize(width: 497, height: 362)
            addChild(person2)
            
            label3.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2 + 248)
            label3.size = CGSize(width: 437, height: 67)
            addChild(label3)
            
            label4.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2 - 248)
            label4.size = CGSize(width: 423, height: 98)
            addChild(label4)
        } else if pageCounter == 2{
            self.removeChildren(in: [person2, label3, label4])
            person3.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2 - 100)
            person3.size = CGSize(width: 414, height: 388)
            addChild(person3)
            
            label5.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2 + 208)
            label5.size = CGSize(width: 411, height: 129)
            addChild(label5)

        } else if pageCounter == 3{
            self.removeChildren(in: [person3, label5])
            person4.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
            person4.size = CGSize(width: 500, height: 360.83333333333)
            addChild(person4)
            
            label6.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2 + 258)
            label6.size = CGSize(width: 460, height: 38)
            addChild(label6)
            
            label7.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2 - 268)
            label7.size = CGSize(width: 350, height: 88)
            addChild(label7)

        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if touchedNode.name == "nextPageTextNode" || touchedNode.name == "nextPageArrowNode"{
            if pageCounter == 1{
                nextPage()
                pageCounter += 1
            } else if pageCounter == 2{
                nextPage()
                pageCounter += 1
            } else if pageCounter == 3{
                nextPage()
                pageCounter += 1
            } else {
                PlaygroundPage.current.navigateTo(page: .next)
            }
            
    }
}
    
    //Setup next page text and arrow
    public func setUpNextPage(text: SKSpriteNode, arrow: SKSpriteNode){
        
        //setup next page text
        text.position = CGPoint(x: frame.size.width / 2 + frame.size.width * 0.25, y: frame.size.height / 2 - frame.size.height * 0.45)
        text.size = CGSize(width: K.nextPageTextWidth, height: K.nextPageTextHeight)
        text.name = "nextPageTextNode"
        self.addChild(text)
        
        //setup next page arrow
        arrow.position = CGPoint(x: frame.size.width / 2 + frame.size.width * 0.25 +  CGFloat(K.nextPageTextWidth) / 2 + 25, y: frame.size.height / 2 - frame.size.height * 0.45)
        arrow.size = CGSize(width: K.nextPageArrowWidth, height: K.nextPageArrowHeight)
        arrow.name = "nextPageArrowNode"
        self.addChild(arrow)
    }
    
}

public class LiveViewControllerPage2: LiveViewController{
    
    var scene:presentingSofie!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let sceneView = SKView(frame: K.view.viewFrame)
        
        let gameScene = presentingSofie(size: CGSize(width: K.view.width, height: K.view.height))
        gameScene.scaleMode = .aspectFill
        sceneView.presentScene(gameScene)
        self.view = sceneView
    }
    
    public override func receive(_ message: PlaygroundValue) {
        
    }
}


