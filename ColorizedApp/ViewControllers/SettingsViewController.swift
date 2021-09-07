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
    
    @IBOutlet var doneButton: UIButton!
    
    var colorValue: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorFieldView.backgroundColor = colorValue
        colorFieldView.layer.cornerRadius = 20
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        redSlider.minimumTrackTintColor = .systemRed
        greenSlider.minimumTrackTintColor = .systemGreen
        
        doneButton.titleLabel?.adjustsFontSizeToFitWidth = true
        doneButton.titleLabel?.minimumScaleFactor = 0.5
        doneButton.tintColor = .white
        
        updateSliders()
        updateValue(for: redValueLabel, greenValueLabel, blueValueLabel)
        updateValue(for: redTextField, greenTextField, blueTextField)
    }
    
    @IBAction func intensifyRGB(_ sender: UISlider) {
        switch sender {
        case redSlider:
            updateValue(for: redValueLabel)
            updateValue(for: redTextField)
        case greenSlider:
            updateValue(for: greenValueLabel)
            updateValue(for: greenTextField)
        default:
            updateValue(for: blueValueLabel)
            updateValue(for: blueTextField)
        }
        
        updateColor()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.updateViewColor(color: colorFieldView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}


extension SettingsViewController {
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
    
    private func updateSliders() {
        let ciColor = CIColor(color: colorValue)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
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
    
    private func updateValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTextField:
                redTextField.text = getString(from: redSlider)
            case greenTextField:
                greenTextField.text = getString(from: greenSlider)
            default:
                blueTextField.text = getString(from: blueSlider)
            }
        }
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
        
        // Очистить текстовое поле после неправильного ввода
    }
}


extension SettingsViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField {
            case redTextField:
                redSlider.setValue(currentValue, animated: true)
                updateValue(for: redValueLabel)
            case greenTextField:
                greenSlider.setValue(currentValue, animated: true)
                updateValue(for: greenValueLabel)
            default:
                blueSlider.setValue(currentValue, animated: true)
                updateValue(for: blueValueLabel)
            }
            
            updateColor()
            return
        }
        showAlert(title: "Wrong format!", message: "Please use only numbers")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        textField.inputAccessoryView = toolbar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDone)
        )
        
        let spaceBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        toolbar.items = [spaceBarButton, doneButton]
        
        // Добавить кнопки перехода из одного текстового поля в другое
        // Добавить точку
    }
}

