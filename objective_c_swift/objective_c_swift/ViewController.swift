//
//  ViewController.swift
//  objective_c_swift
//
//  Created by Gaurav Sara on 10/01/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var labelView: UILabel!
    var soundID: SystemSoundID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let soundURL = Bundle.main.url(forResource: "Cat", withExtension: "wav") {
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundID)
        }
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        labelView.isHidden = false
        
        AudioServicesPlaySystemSound(soundID)
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(hideLabel), userInfo: nil, repeats: false)
    }
    
    @objc func hideLabel() {
        labelView.isHidden = true
    }
}

