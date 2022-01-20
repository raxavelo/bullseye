//
//  ViewController.swift
//  BullsEye
//
//  Created by Grzegorz Zadkowski on 20/01/2022.
//

import UIKit

class ViewController: UIViewController {
  var targetValue = 0
  var currentValue = 50
  var score = 0
  var round = 0
  @IBOutlet var slider: UISlider!
  @IBOutlet var targetLabel: UILabel!
  @IBOutlet var scoreLabel: UILabel!
  @IBOutlet var roundLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    startNewRound()
  }

  @IBAction func showAlert() {
    let difference = abs(currentValue - targetValue)
    let points = 100 - difference
    
    score += points
    
    let message = "You scored \(points) points"
    
    let alert = UIAlertController(
      title: "Hello, World",
      message: message,
      preferredStyle: .alert)
    
    let action = UIAlertAction(
    title: "OK",
    style: .default,
    handler: nil)
    
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    startNewRound()
  }
  
  @IBAction func sliderMoved(_ slider: UISlider) {
    currentValue = lroundf(slider.value)
  }
  
  func startNewRound() {
    targetValue = Int.random(in: 1...100)
    currentValue = 50
    slider.value = Float(currentValue)
    round += 1
    updateLabels()
  }
  
  func updateLabels() {
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(score)
    roundLabel.text = String(round)
  }
}

