//
//  SettingsViewController.swift
//  ColorizedApp
//
//  Created by Василий Пронин on 20.08.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var colorFieldView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorFieldView.layer.cornerRadius = 20
        
        redValueLabel.text = getString(from: redSlider)
        greenValueLabel.text = getString(from: greenSlider)
        blueValueLabel.text = getString(from: blueSlider)
        
        redSlider.minimumTrackTintColor = .systemRed
        greenSlider.minimumTrackTintColor = .systemGreen
        
        updateColor()
        updateValue(for: redValueLabel, greenValueLabel, blueValueLabel)
    }
    
    @IBAction func intensifyRGB(_ sender: UISlider) {
        updateColor()
        
        switch sender {
        case redSlider:
            redValueLabel.text = getString(from: redSlider)
        case greenSlider:
            greenValueLabel.text = getString(from: greenSlider)
        default:
            blueValueLabel.text = getString(from: blueSlider)
        }
    }
    
    private func getString(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func updateColor() {
        colorFieldView.backgroundColor = UIColor(
            displayP3Red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }

    private func updateValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redValueLabel:
                redValueLabel.text = getString(from: redSlider)
            case greenValueLabel:
                greenValueLabel.text = getString(from: greenSlider)
            default:
                blueValueLabel.text = getString(from: blueSlider)
            }
        }
    }
}

