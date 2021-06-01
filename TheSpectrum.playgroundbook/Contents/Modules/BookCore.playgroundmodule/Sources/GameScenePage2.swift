//
//  GameScene2.swift
//  BookCore
//
//  Created by Juliana Prado on 11/04/21.
//

import SpriteKit
import PlaygroundSupport


public class pickedAndreas: SKScene {
    
    public var nextPageCounter = 0
    
    
    public var label1 = SKSpriteNode(imageNamed: K.gameScene2.firstLabel)
    
    let person1 = SKSpriteNode(imageNamed: K.gameScene.andreasImage)

    
    
    let label2 = SKSpriteNode(imageNamed: K.gameScene2.secondLabel)
    let label3 = SKSpriteNode(imageNamed: K.gameScene2.thirdLabel)
    let label4 = SKSpriteNode(imageNamed: K.gameScene2.forthLabel)
    let label5 = SKSpriteNode(imageNamed: K.gameScene2.fithLabel)

    
    public var nextPageText = SKSpriteNode(imageNamed: K.nextPageText)
    public var nextPageArrow = SKSpriteNode(imageNamed: K.nextPageArrow)
    
    public override func didMove(to view: SKView) {
        releaseConfetti(view: self.view!)
        self.backgroundColor = .white
        setUpLabels(label: label1)
        
        let seconds = 2.8
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.setUpNextPage(text: self.nextPageText, arrow: self.nextPageArrow)
        }
        
    }
    
    //Setup common labels
    public func setUpLabels(label: SKSpriteNode){
        label.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2 )
        label.size = CGSize(width: 321, height: 66)
        self.addChild(label)
   }

    
    //Setup next page text and arrow
    public func setUpNextPage(text: SKSpriteNode, arrow: SKSpriteNode){
        
        //setup next page text
        text.position = CGPoint(x: frame.size.width / 2 + frame.size.width * 0.27, y: frame.size.height / 2 - frame.size.height * 0.22)
        text.size = CGSize(width: K.nextPageTextWidth, height: K.nextPageTextHeight)
        text.name = "nextPageTextNode"
        self.addChild(text)
        
        //setup next page arrow
        arrow.position = CGPoint(x: frame.size.width / 2 + frame.size.width * 0.27 +  CGFloat(K.nextPageTextWidth) / 2 + 25, y: frame.size.height / 2 - frame.size.height * 0.22)
        arrow.size = CGSize(width: K.nextPageArrowWidth, height: K.nextPageArrowHeight)
        arrow.name = "nextPageArrowNode"
        self.addChild(arrow)
    }
    
    
    //Touches Began
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if touchedNode.name == "nextPageTextNode" || touchedNode.name == "nextPageArrowNode"{
            if nextPageCounter == 0{
                self.removeAllChildren()
                nextPageAndreas()
                nextPageCounter += 1
            } else if nextPageCounter == 1 {
                nextPageAndreas()
                nextPageCounter += 1
            } else if nextPageCounter == 2{
                PlaygroundPage.current.navigateTo(page: .next)
            }
        }
            
    }
    
    public func nextPageAndreas(){
        if nextPageCounter == 0{
            person1.position = CGPoint(x: frame.size.width / 2 + frame.size.width * 0.28, y: frame.size.height / 2)
            person1.size = CGSize(width: 216, height: 263.72093023256)
            addChild(person1)
            
            label2.position = CGPoint(x: frame.size.width / 2 - frame.size.width * 0.20, y: frame.size.height / 2)
            label2.size = CGSize(width: 216, height: 46.017391304348)
            addChild(label2)
            
            setUpNextPage(text: self.nextPageText, arrow: self.nextPageArrow)
        } else if nextPageCounter == 1{
            self.removeChildren(in: [label2])
           
            label3.position = CGPoint(x: frame.size.width / 2 - frame.size.width * 0.20, y: frame.size.height / 2)
            label3.size = CGSize(width: 216, height: 51.637139807898)
            addChild(label3)
    
        } else {
            self.removeChildren(in: [label3, person1])
            
            label4.position = CGPoint(x: frame.size.width / 2 - frame.size.width * 0.04 , y: frame.size.height / 2 + 50)
            label4.size = CGSize(width: 500, height: 164.64032421479)
            addChild(label4)
            
            label5.position = CGPoint(x: frame.size.width / 2 - frame.size.width * 0.04 , y: frame.size.height / 2 - 100)
            label5.size = CGSize(width: 500, height: 63.191153238547)
            addChild(label5)
        }
    }
    
}

//MARK: - pickedJonas GameScene

public class pickedJonas: SKScene{
    
    
    public var label1 = SKSpriteNode(imageNamed: K.gameScene2.firstLabel)
    public let person2 = SKSpriteNode(imageNamed: K.gameScene.jonasImage)

    public var label8 = SKSpriteNode(imageNamed: K.gameScene2.eithLabel)
    public var label9 = SKSpriteNode(imageNamed: K.gameScene2.ninthLabel)
    
    public var nextPageCounter = 0
    public var nextPageText = SKSpriteNode(imageNamed: K.nextPageText)
    public var nextPageArrow = SKSpriteNode(imageNamed: K.nextPageArrow)
    
    public override func didMove(to view: SKView) {
        releaseConfetti(view: self.view!)
        self.backgroundColor = .white
        setUpLabels(label: label1)
        
        let seconds = 2.8
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.setUpNextPage(text: self.nextPageText, arrow: self.nextPageArrow)
        }
        
    }
    
    //Setup common labels
    public func setUpLabels(label: SKSpriteNode){
        label.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2 )
        label.size = CGSize(width: 321, height: 66)
        self.addChild(label)
   }

    
    //Setup next page text and arrow
    public func setUpNextPage(text: SKSpriteNode, arrow: SKSpriteNode){
        
        //setup next page text
        text.position = CGPoint(x: frame.size.width / 2 + frame.size.width * 0.27, y: frame.size.height / 2 - frame.size.height * 0.22)
        text.size = CGSize(width: K.nextPageTextWidth, height: K.nextPageTextHeight)
        text.name = "nextPageTextNode"
        self.addChild(text)
        
        //setup next page arrow
        arrow.position = CGPoint(x: frame.size.width / 2 + frame.size.width * 0.27 +  CGFloat(K.nextPageTextWidth) / 2 + 25, y: frame.size.height / 2 - frame.size.height * 0.22)
        arrow.size = CGSize(width: K.nextPageArrowWidth, height: K.nextPageArrowHeight)
        arrow.name = "nextPageArrowNode"
        self.addChild(arrow)
    }
    
    
    //Touches Began
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if touchedNode.name == "nextPageTextNode" || touchedNode.name == "nextPageArrowNode"{
            if nextPageCounter == 0{
                self.removeAllChildren()
                nextPageJonas()
                nextPageCounter += 1
            } else if nextPageCounter == 1 {
                nextPageJonas()
                nextPageCounter += 1
            } else if nextPageCounter == 2{
                PlaygroundPage.current.navigateTo(page: .next)
            }
        }
            
    }
    
    public func nextPageJonas(){
        if nextPageCounter == 0{
            
            person2.position = CGPoint(x: frame.size.width / 2 + frame.size.width * 0.28, y: frame.size.height / 2)
            person2.size = CGSize(width: 216, height: 238.90909090909)
            addChild(person2)
            
            label8.position = CGPoint(x: frame.size.width / 2 - frame.size.width * 0.20, y: frame.size.height / 2)
            label8.size = CGSize(width: 216, height: 46.017391304348)
            addChild(label8)
            
            setUpNextPage(text: self.nextPageText, arrow: self.nextPageArrow)
        } else if nextPageCounter == 1{
            self.removeChildren(in: [label8])
           
            label9.position = CGPoint(x: frame.size.width / 2 - frame.size.width * 0.20, y: frame.size.height / 2)
            label9.size = CGSize(width: 216, height: 51.637139807898)
            addChild(label9)
    
        }
    }
    
}

//MARK: - pickedSarah GameScene

public class pickedSarah: SKScene{
    
    
    public var label1 = SKSpriteNode(imageNamed: K.gameScene2.firstLabel)
    
    let person3 = SKSpriteNode(imageNamed: K.gameScene.sarahImage)
    let label6 = SKSpriteNode(imageNamed: K.gameScene2.sixthLabel)
    let label7 = SKSpriteNode(imageNamed: K.gameScene2.seventhLabel)
    
    public var nextPageCounter = 0
    public var nextPageText = SKSpriteNode(imageNamed: K.nextPageText)
    public var nextPageArrow = SKSpriteNode(imageNamed: K.nextPageArrow)
    
    public override func didMove(to view: SKView) {
        releaseConfetti(view: self.view!)
        self.backgroundColor = .white
        setUpLabels(label: label1)
        
        let seconds = 2.8
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.setUpNextPage(text: self.nextPageText, arrow: self.nextPageArrow)
        }
        
    }
    
    //Setup common labels
    public func setUpLabels(label: SKSpriteNode){
        label.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2 )
        label.size = CGSize(width: 321, height: 66)
        self.addChild(label)
   }

    
    //Setup next page text and arrow
    public func setUpNextPage(text: SKSpriteNode, arrow: SKSpriteNode){
        
        //setup next page text
        text.position = CGPoint(x: frame.size.width / 2 + frame.size.width * 0.27, y: frame.size.height / 2 - frame.size.height * 0.22)
        text.size = CGSize(width: K.nextPageTextWidth, height: K.nextPageTextHeight)
        text.name = "nextPageTextNode"
        self.addChild(text)
        
        //setup next page arrow
        arrow.position = CGPoint(x: frame.size.width / 2 + frame.size.width * 0.27 +  CGFloat(K.nextPageTextWidth) / 2 + 25, y: frame.size.height / 2 - frame.size.height * 0.22)
        arrow.size = CGSize(width: K.nextPageArrowWidth, height: K.nextPageArrowHeight)
        arrow.name = "nextPageArrowNode"
        self.addChild(arrow)
    }
    
    
    //Touches Began
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if touchedNode.name == "nextPageTextNode" || touchedNode.name == "nextPageArrowNode"{
            if nextPageCounter == 0{
                self.removeAllChildren()
                nextPageSarah()
                nextPageCounter += 1
            } else if nextPageCounter == 1 {
                nextPageSarah()
                nextPageCounter += 1
            } else if nextPageCounter == 2{
                PlaygroundPage.current.navigateTo(page: .next)
            }
        }
            
    }
    
    public func nextPageSarah(){
        if nextPageCounter == 0{
        
            person3.position = CGPoint(x: frame.size.width / 2 + frame.size.width * 0.28, y: frame.size.height / 2)
            person3.size = CGSize(width: 216, height: 293.4)
            addChild(person3)
            
            label6.position = CGPoint(x: frame.size.width / 2 - frame.size.width * 0.20, y: frame.size.height / 2)
            label6.size = CGSize(width: 216, height: 46.017391304348)
            addChild(label6)
            
            setUpNextPage(text: self.nextPageText, arrow: self.nextPageArrow)
        } else if nextPageCounter == 1{
            // When it comes to people with Autism Spectrum Disorder (ASD)
            //It appears you have less gender bias toward women than MOST DOCTORS :D
            //touch for next page
            self.removeChildren(in: [label6])
           
            label7.position = CGPoint(x: frame.size.width / 2 - frame.size.width * 0.20, y: frame.size.height / 2)
            label7.size = CGSize(width: 216, height: 96.903039073806)
            addChild(label7)
    
        }
    }
        
    
}



