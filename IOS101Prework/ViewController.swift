//
//  ViewController.swift
//  IOS101Prework
//
//  Created by jesus santiago on 6/26/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var optionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var shouldAutoAdjustTextColor = true
    
    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        func changeColor() -> UIColor{

                let red = CGFloat.random(in: 0...1)
                let green = CGFloat.random(in: 0...1)
                let blue = CGFloat.random(in: 0...1)

                return UIColor(red: red, green: green, blue: blue, alpha: 0.5)
            }
        let randomColor = changeColor()
        view.backgroundColor = randomColor
        
        if shouldAutoAdjustTextColor {
            updateLabelTextColors(for: randomColor)
        }
        
    }
    
    func updateLabelTextColors(for backgroundColor: UIColor) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        backgroundColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        let brightness = (red * 299 + green * 587 + blue * 114) / 1000

        let textColor: UIColor = brightness < 0.5 ? .white : .black

        nameLabel.textColor = textColor
        schoolLabel.textColor = textColor
        jobLabel.textColor = textColor
        optionLabel.textColor = textColor
    }
    
    @IBAction func changeTextColor(_ sender: UISwitch) {
        shouldAutoAdjustTextColor = sender.isOn

        if !shouldAutoAdjustTextColor {
            let defaultColor = UIColor.black
            nameLabel.textColor = defaultColor
            schoolLabel.textColor = defaultColor
            jobLabel.textColor = defaultColor
            optionLabel.textColor = defaultColor
        } else {
            if let bgColor = view.backgroundColor {
                updateLabelTextColors(for: bgColor)
            }
        }
    }
    
}

