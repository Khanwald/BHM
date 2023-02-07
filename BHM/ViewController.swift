//
//  ViewController.swift
//  BHM
//
//  Created by 11k on 2/7/23.
//

import UIKit

class ViewController: UIViewController {

    var x = Int.random(in: 0...gameItems.count - 1)
    var person = gameItems[0]
    
    var state = State.waiting
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet var history:UILabel!
    @IBOutlet var guess:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        person = gameItems[x]
        image.image = person.image
    }

    @IBAction func submit(_ sender: Any) {
        if let text = guess.text{
            if text.lowercased() == person.name.lowercased(){
                if(gameItems.isEmpty){return}
                gameItems.remove(at: x)
                if(gameItems.isEmpty){return}
                
                x = Int.random(in: 0...gameItems.count - 1)
                person = gameItems[x]
                image.image = person.image
            }
        }
    }
    
}
enum State{
    case win
    case lose
    case waiting
}

struct Match{
    var name:String
    var image:UIImage
}

var gameItems = [Match(name: "Barack Obama", image: UIImage(named: "President_Barack_Obama")!), Match(name: "Rosa Parks", image: UIImage(named: "2-rosa-parks-scaled")!)]

