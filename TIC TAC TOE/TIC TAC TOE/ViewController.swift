//
//  ViewController.swift
//  TIC TAC TOE
//
//  Created by Manar Mahmalji on 8/20/17.
//  Copyright © 2017 Manar Mahmalji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
@IBOutlet weak var statusLabel: UILabel!
@IBOutlet weak var newGameButton: UIButton!
@IBOutlet weak var button1: UIButton!
@IBOutlet weak var button2: UIButton!
@IBOutlet weak var button3: UIButton!
@IBOutlet weak var button4: UIButton!
@IBOutlet weak var button5: UIButton!
@IBOutlet weak var button6: UIButton!
@IBOutlet weak var button7: UIButton!
@IBOutlet weak var button8: UIButton!
@IBOutlet weak var button9: UIButton!
    
    let winningCombinations = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9],
                               [1,5,9], [3,5,7]]
    var playerOneMoves = Set<Int>()
    var playerTwoMoves = Set<Int>()
    var possibleMove = Array<Int>()
    var playerTurn = 1
    
    
    @IBAction func newGameButtonClicked(_ sender: AnyObject) {
        newGame()
    }
    
    
    @IBAction func buttonClicked(_ sender: AnyObject) {
        if playerOneMoves.contains(sender.tag) || playerTwoMoves.contains(sender.tag) /* here i am checking if the move done by the player is done before or not*/  {
            statusLabel.text = "Space is occupied"
        }else{
            if playerTurn == 1  {
                playerOneMoves.insert(sender.tag)// here, i am adding the tag to playerOneMoves array
                sender.setTitle("X", for: UIControlState.normal)
                statusLabel.text = "PLayer two's turn"
                if isWinner(player: playerTurn) == 0 {
                    
                }
                
            }
        }
        
}
    
    
    
    
    
    func newGame(){
        // step 1: cleaning up
        playerOneMoves.removeAll()
        playerTwoMoves.removeAll()
        // step 2: changing the status and turn
        statusLabel.text = "Player one's turn"
        playerTurn = 1
        // step 3: 
        for index in 1...9 {
            let tile = self.view.viewWithTag(index) as! UIButton
            tile.isEnabled = true
        // here, i am saying that when the compiler loops for view with tag (index), it's a uibutton.So, i am connecting tiles to my tags.
        tile.setTitle("", for: UIControlState.normal)// i don"t undersatnd what this means
            }
    }
    
    func isWinner(player: Int) -> Int {
        
        var winner = 0
        var movesList = Set<Int>()
        if player == 1 {
            movesList = playerOneMoves
        }else{
            movesList = playerTwoMoves
        }
        
        for combination in winningCombinations{
            if movesList.contains(combination[0]) && movesList.contains(combination[1]) && movesList.contains(combination[2]) && movesList.count > 2 {
                winner = player
                statusLabel.text = "Player \(player) wins!"
                for index in 1...9{
                    let tile = self.view.viewWithTag(index) as! UIButton
                    tile.isEnabled = false
                }
            }
            
        }
        return winner
    }
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

