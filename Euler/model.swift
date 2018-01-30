//
//  model.swift
//  Euler
//
//  Created by Darryl Griffiths on 26/01/2018.
//  Copyright © 2018 Darryl Griffiths. All rights reserved.
//

import Foundation

class model {
    
    var multiple_arr = [Int]()
    var multiples = [Int]()
    let three = 3
    let five = 5
    let total = 4000000 // 4,000,000,00 (4 million)
    var fib = [Int]()
    
    init() {
        self.multiple_arr += 1...999 // populate the array using the "range operator" from 1 to 999
    }
    
    func getMultiples() -> Array<Int> {
        
        for num in multiple_arr {
            
            if( (num % self.three == 0) || (num % self.five == 0) ) {
                self.multiples.append(num)
            }
            
        }
        
        return multiples
    }
    
    func fibonacciSequence() -> Array<Int> {
        
        var num = 0
        
        for i in 0...30 {
      
            if(i==0) {
                fib.append(1)
                num = fib[i] + fib[i]
                fib.append(num)
            }
            if(i>0) {
                num = fib[i-1] + fib[i]
                fib.append(num)
            }
        }
        
        
        // 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
        // my answer : [1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]
        
        return fib
    }
    
}
