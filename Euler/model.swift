//
//  model.swift
//  Euler
//
//  Created by Darryl Griffiths on 26/01/2018.
//  Copyright © 2018 Darryl Griffiths. All rights reserved.
//

import Foundation

class model {
    
    var arr = [Int]()
    var multiples = [Int]()
    let three = 3
    let five = 5
    var sum : Int?
    
    init() {
        self.arr += 1...999 // populate the array using the "range operator" from 1 to 999
        //print(arr)
    }
    
    func getMultiples() -> Array<Int> {
        
        for num in arr {
            
            if( (num % self.three == 0) || (num % self.five == 0) ) {
                self.multiples.append(num)
            }
            
        }
        //self.sum = self.answer.reduce(0, +)
        
        //return sum
        return multiples
    }
    
}
