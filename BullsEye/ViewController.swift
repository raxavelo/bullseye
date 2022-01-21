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
    
    let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
    slider.setThumbImage(thumbImageNormal, for: .normal)
    
    let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
    slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
    
    let insets = UIEdgeInsets(
      top: 0,
      left: 14,
      bottom: 0,
      right: 14)
    
    let trackLeftImage = UIImage(named: "SliderTrackLeft")!
    let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
    slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
    
    let trackRightImage = UIImage(named: "SliderTrackRight")!
    let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
    slider.setMinimumTrackImage(trackRightResizable, for: .normal)
    
    startNewGame()
  }

  @IBAction func showAlert() {
    let difference = abs(currentValue - targetValue)
    var points = 100 - difference
    
    let title: String
    switch difference {
    case 0:
      title = "Perfect!"
      points += 100
    case 1..<5:
      title = "You almost had it!"
      points += 50
    case 5..<10:
      title = "Pretty good!"
    default:
      title = "Not even close..."
    }
    score += points
    
    let message = "You scored \(points) points"
    
    let alert = UIAlertController(
      title: title,
      message: message,
      preferredStyle: .alert)
    
    let action = UIAlertAction(
    title: "OK",
    style: .default) { _ in
      self.startNewRound()
    }
    
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
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
  
  @IBAction func startNewGame() {
    score = 0
    round = 0
    startNewRound()
  }
}

