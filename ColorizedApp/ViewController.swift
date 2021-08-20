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
        
        colorFieldView.layer.cornerRadius = 20
    }
    
    @IBAction func intensifyRed() {
    }
    
    @IBAction func intensifyGreen() {
    }
    
    @IBAction func intensifyBlue() {
    }
    
}

