//
//  ViewController.swift
//  BullsEye
//
//  Created by Vinh Vu on 10/6/18.
//  Copyright © 2018 Vinh Vu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var sValue = 0
    var tValue = 0
    var score = 0
    var rounds = 0
    
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        sValue = Int(roundedValue)
        startNewGame()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func showAlert(){
        
        let difference = abs(tValue-sValue)
        var points = 100-difference
        if difference==0{
            points+=100
        }
        else if difference == 1{
            points+=50
        }
         score+=points
        
        let title: String
        if difference == 0{
            title = "Perfect!"
        }
        else if difference < 5 {
            title = "Almost had it!"
        }
        else if difference < 10  {
            title = "Pretty good"
        }
        else {
            title = "Not even close...."
        }
        
        
        let message = "You scored \(points)"
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle:  .alert)
        
        let action = UIAlertAction(title: "Awesome!", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
        
        
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        let roundedValue = slider.value.rounded()
        sValue = Int(roundedValue)
    }
    
    @IBAction func startNewGame(){
       score = 0
        rounds = 0
        startNewRound()
    }

    
    
    func startNewRound(){
        rounds+=1
        tValue = Int.random(in: 1...100)
        sValue = 50
        slider.value = Float(sValue)
        updateLabelValue()
    }
    
    func updateLabelValue(){
        targetLabel.text = String(tValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(rounds)
    }
    
    
    
}

