//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Василий Пронин on 04.09.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func updateViewColor(color: UIColor)
}

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.colorValue = view.backgroundColor
        settingsVC.delegate = self
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func updateViewColor(color: UIColor) {
        view.backgroundColor = color
    }
}
