//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Василий Пронин on 20.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorFieldView: UIView!
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    private var redValue: String {
        String(format: "%.2f", redSlider.value)
    }
    
    private var greenValue: String {
        String(format: "%.2f", greenSlider.value)
    }
    
    private var blueValue: String {
        String(format: "%.2f", blueSlider.value)
    }
    
    private var valueRGB: UIColor {
        UIColor(
            displayP3Red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Labels
        colorFieldView.layer.cornerRadius = 20
        
        redValueLabel.text = redValue
        greenValueLabel.text = greenValue
        blueValueLabel.text = blueValue
        
        // Sliders
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.minimumTrackTintColor = .red
        
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.minimumTrackTintColor = .green
        
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.minimumTrackTintColor = .blue
    }
    
    override func viewWillLayoutSubviews() {
        colorFieldView.backgroundColor = valueRGB
        
    }
    
    @IBAction func intensifyRGB(_ sender: UISlider) {
        redValueLabel.text = redValue
        greenValueLabel.text = greenValue
        blueValueLabel.text = blueValue
        
        colorFieldView.backgroundColor = valueRGB
        
    }
}

