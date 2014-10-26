//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Brian Yingling on 10/26/14.
//  Copyright (c) 2014 Brian Yingling. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var goNumber = 1
    
    var winner = 0
    
    
    // 0 = empty, 1 = nought, 2 = cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [
        [0,1,2], [3,4,5], [6,7,8],
        [0,3,6], [1,4,7], [2,5,8],
        [0,4,8], [2,4,6]
    ]

    @IBOutlet weak var button0: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var playAgain: UIButton!
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        // reset variables
        goNumber = 1
        winner = 0
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        // hide results elements
        label.center = CGPointMake(label.center.x - 400, label.center.y)
        playAgain.alpha = 0
        
        var button : UIButton
        
        for var i = 0; i < 9; i++ {
            button = view.viewWithTag(i) as UIButton
            button.setImage(nil, forState:.Normal)
        }
    
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if (gameState[sender.tag] == 0 && winner == 0) {
            
            var image = UIImage()
            
            winner = 0
        
            if (goNumber % 2 == 0) {
                image = UIImage(named:"cross.png")!
                gameState[sender.tag] = 2
            }
            else {
                image = UIImage(named:"nought.png")!
                gameState[sender.tag] = 1
            }
            
            // check if there is a winner
            for combination in winningCombinations {
                if (gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] &&
                    gameState[combination[0]] != 0) {
                    
                    winner = gameState[combination[0]]
                    
                
                }
            }
            
            if (winner != 0) {
                
                if (winner == 1) {
                    label.text = "Nought has won"
                }
                else {
                    label.text = "Crosses has won"
                }
                
                UIView.animateWithDuration(0.4, animations: {
                    
                    self.label.center = CGPointMake(self.label.center.x + 400, self.label.center.y)
                    
                    self.playAgain.alpha = 1

                })
                
            }
            
        
            sender.setImage(image, forState: .Normal)
        
            goNumber++
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        if (winner == 0) {
            label.center = CGPointMake(label.center.x - 400, label.center.y)
            
            playAgain.alpha = 0
        }
    }

}

