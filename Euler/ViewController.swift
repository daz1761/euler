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
    private var fib_array = [Int]()

    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // multiples
        let multiple_ans = myModel.getMultiples()
        let multiple_sum = multiple_ans.reduce(0, +)  // sum array
        answerLabel.text = String(multiple_sum)
        
        // fibonacci
        let fib_ans = myModel.fibonacciSequence()
        
        for fib in fib_ans {
            if fib % 2 == 0 {
                self.fib_array.append(fib)
                
            }
        }
        let fib_sum = fib_array.reduce(0, +)
        print(fib_sum)
    }

}

