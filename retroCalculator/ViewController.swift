//
//  ViewController.swift
//  retroCalculator
//
//  Created by Home on 2016-04-25.
//  Copyright © 2016 Farshid Palad. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Substract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    @IBOutlet weak var outputLabel: UILabel!
    
//    var buttonSound: AVAudioPlayer!
    
    var runningNumber = ""
    var leftValString = ""
    var rightValString = ""
    var currentOperation: Operation = Operation.Empty
    var result = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
//        let soundUrl = NSURL(fileURLWithPath:path!)
//        
//        do {
//           try buttonSound = AVAudioPlayer(contentsOfURL: soundUrl)
//           buttonSound.prepareToPlay()
//        } catch let err as NSError {
//            print(err.debugDescription)
//        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func numberPressed(sender: UIButton!) {
//        playSound()
        
        runningNumber = runningNumber + "\(sender.tag)"
        outputLabel.text = runningNumber
    }

    @IBAction func onDividePressed(sender: AnyObject) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }

    @IBAction func onSubstractPressed(sender: AnyObject) {
        processOperation(Operation.Substract)
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(Operation.Add)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(currentOperation)
    }
    
    func processOperation(op: Operation) {
//        playSound()
        if currentOperation != Operation.Empty {
            //Run some math
            
            //A user selected an operator, but then selected another operator without
            //first entering a number
            
            if runningNumber != "" {
                rightValString = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValString)! * Double(rightValString)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValString)! / Double(rightValString)!)"
                } else if currentOperation == Operation.Substract {
                    result = "\(Double(leftValString)! - Double(rightValString)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftValString)! + Double(rightValString)!)"
                }
                
                leftValString = result
                outputLabel.text = result
            }
            
            currentOperation = op
            
            
        } else {
            //This is the first time an operator has been pressed
            leftValString = runningNumber
            runningNumber = ""
            currentOperation = op
        }
    }
    
//    func playSound(){
//        if buttonSound.playing {
//            buttonSound.stop()
//        }
//        
//        buttonSound.play()
//    }
}

