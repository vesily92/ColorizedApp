//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Василий Пронин on 20.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorFieldView: UIView!
    @IBOutlet var redIntensityLabel: UILabel!
    @IBOutlet var greenIntensityLabel: UILabel!
    @IBOutlet var blueIntensityLabel: UILabel!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Labels
        colorFieldView.layer.cornerRadius = 20
        
        redIntensityLabel.text = String(format: "%.2f", redColorSlider.value)
        greenIntensityLabel.text = String(format: "%.2f", greenColorSlider.value)
        blueIntensityLabel.text = String(format: "%.2f", blueColorSlider.value)
        
        // Sliders
        redColorSlider.minimumValue = 0
        redColorSlider.maximumValue = 1
        redColorSlider.minimumTrackTintColor = .red
        
        greenColorSlider.minimumValue = 0
        greenColorSlider.maximumValue = 1
        greenColorSlider.minimumTrackTintColor = .green
        
        blueColorSlider.minimumValue = 0
        blueColorSlider.maximumValue = 1
        blueColorSlider.minimumTrackTintColor = .blue
    }
    
    @IBAction func intensifyRed() {
        redIntensityLabel.text = String(format: "%.2f", redColorSlider.value)
    }
    
    @IBAction func intensifyGreen() {
        greenIntensityLabel.text = String(format: "%.2f", greenColorSlider.value)
    }
    
    @IBAction func intensifyBlue() {
        blueIntensityLabel.text = String(format: "%.2f", blueColorSlider.value)
    }
    
}

