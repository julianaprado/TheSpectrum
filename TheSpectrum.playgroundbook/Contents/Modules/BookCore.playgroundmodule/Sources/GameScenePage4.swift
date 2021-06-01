//
//  LiveViewControllerPage3.swift
//  BookCore
//
//  Created by Juliana Prado on 15/04/21.
//

import SpriteKit
import PlaygroundSupport

public class lastScene: SKScene {

    
    public let iconGrey = SKSpriteNode(imageNamed: K.theSpectrumGrey)
    public let iconColor = SKSpriteNode(imageNamed: K.theSpectrum)
    
    public var nextPageText = SKSpriteNode(imageNamed: K.nextPageText)
    public var nextPageArrow = SKSpriteNode(imageNamed: K.nextPageArrow)

    
    public override func didMove(to view: SKView) {
        self.backgroundColor = .white
        
        iconGrey.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2 )
        iconGrey.size = CGSize(width: 276, height: 276)
        iconGrey.name = "iconGrey"
        iconGrey.zPosition = 10
        addChild(iconGrey)
        
        iconColor.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2 )
        iconColor.size = CGSize(width: 276, height: 276)
        iconColor.name = "iconColor"
        iconColor.zPosition = 1
        addChild(iconColor)
        
        setUpNextPage(text: nextPageText, arrow: nextPageArrow)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
      
        if touchedNode.name == "nextPageTextNode" || touchedNode.name == "nextPageArrowNode" {
            self.removeChildren(in: [nextPageText,nextPageArrow])
            let fadeOut = SKAction.fadeOut(withDuration: 0.5)
            self.iconGrey.run(fadeOut)
            
            releaseConfetti(view: self.view!)
        }
    }
    //
    
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

public class ViewControllerPage3: LiveViewController {
    var scene:lastScene!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let sceneView = SKView(frame: K.view.viewFrame)
        
        let gameScene = lastScene(size: CGSize(width: K.view.width, height: K.view.height))
        gameScene.scaleMode = .aspectFill
        sceneView.presentScene(gameScene)
        self.view = sceneView
    }
    
    public override func receive(_ message: PlaygroundValue) {
        
    
    }
}
