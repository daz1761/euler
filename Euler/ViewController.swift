//
//  ViewController.swift
//  Euler
//
//  Created by Darryl Griffiths on 26/01/2018.
//  Copyright © 2018 Darryl Griffiths. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var myModel = model()

    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let answers = myModel.getMultiples()
        let sum = answers.reduce(0, +)
        answerLabel.text = String(sum)
    }

}

