import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultDisplayLabel: UILabel!
    
    private var isFinishedTyping = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func mathCalcPressed(_ sender: UIButton) {
        isFinishedTyping = true
        guard let number = Double(resultDisplayLabel.text ?? "") else {
            fatalError("Cannot convert display label to Double")
        }
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                resultDisplayLabel.text = String(number * -1)
            } else if calcMethod == "AC" {
                resultDisplayLabel.text = "0"
            } else if calcMethod == "%" {
                resultDisplayLabel.text = String(number * 0.01)
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTyping {
                resultDisplayLabel.text = numValue
                isFinishedTyping = false
            } else {
                if numValue == "." {
                    guard let currentDisplayResult = Double(resultDisplayLabel.text!) else {
                        return
                    }
                    let isInt = floor(currentDisplayResult) == currentDisplayResult
                    if !isInt {
                        return
                    }
                }
                resultDisplayLabel.text = resultDisplayLabel.text! + numValue
            }
        }
    }
}

