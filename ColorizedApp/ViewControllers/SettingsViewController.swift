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

    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorFieldView.layer.cornerRadius = 20
        
        redValueLabel.text = getString(from: redSlider)
        greenValueLabel.text = getString(from: greenSlider)
        blueValueLabel.text = getString(from: blueSlider)
        
        updateValue(for: redValueLabel, greenValueLabel, blueValueLabel)
        
        redTextField.text = getString(from: redSlider)
        greenTextField.text = getString(from: greenSlider)
        blueTextField.text = getString(from: blueSlider)
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        redSlider.minimumTrackTintColor = .systemRed
        greenSlider.minimumTrackTintColor = .systemGreen
        
        updateColor()
    }
    
    @IBAction func intensifyRGB(_ sender: UISlider) {
        updateColor()
        
        switch sender {
        case redSlider:
            redValueLabel.text = getString(from: redSlider)
            redTextField.text = getString(from: redSlider)
        case greenSlider:
            greenValueLabel.text = getString(from: greenSlider)
            greenTextField.text = getString(from: greenSlider)
        default:
            blueValueLabel.text = getString(from: blueSlider)
            blueTextField.text = getString(from: blueSlider)
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

extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let convertibleText = Float(textField.text ?? "") else { return }
        
        switch textField {
        case redTextField:
            redSlider.value = convertibleText
        case greenTextField:
            greenSlider.value = convertibleText
        default:
            blueSlider.value = convertibleText
        }
        
        updateColor()
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if textField == redTextField {
//            greenTextField.becomeFirstResponder()
//        } else if {
//            textField == greenTextField {
//                blueTextField.becomeFirstResponder()
//            }
//        } else {
//            logIn()
//            performSegue(withIdentifier: "SegueOne", sender: nil)
//        }
//        return true
//    }
}

