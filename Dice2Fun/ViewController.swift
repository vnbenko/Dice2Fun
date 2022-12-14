import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var leftDiceImageView: UIImageView?
    @IBOutlet weak var rightDiceImageView: UIImageView?
    
    let dices = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        animateDices(start: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.animateDices(start: false)
            self.leftDiceImageView?.image = self.dices[Int.customRandom(max: 5)]
            self.rightDiceImageView?.image = self.dices[Int.random(in: 0...5)]
        }

    }
    
    func animateDices(start: Bool) {
        if start == true {
            leftDiceImageView?.animationImages = dices
            rightDiceImageView?.animationImages = dices
            leftDiceImageView?.animationDuration = 0.3
            rightDiceImageView?.animationDuration = 0.3
            leftDiceImageView?.startAnimating()
            rightDiceImageView?.startAnimating()
        } else {
            leftDiceImageView?.stopAnimating()
            rightDiceImageView?.stopAnimating()
        }
    }
    
}

extension Int {
    
    static func customRandom(max number: Int = 10) -> Int {
        var collection: Set<Int> = []
        var randomValue = 0
        
        for value in 0...number {
            collection.insert(value)
        }
        for value in collection {
            randomValue = value
        }
        return randomValue
    }
}
