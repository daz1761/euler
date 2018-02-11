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
        
        return fib
    }
    
    func prime(num : UInt64) -> UInt64? {
        
        var ans : UInt64?
        var A = num
        var B : UInt64 = 2
        
        while A != B {
            if(A % B == 0) {
                A = A/B
                B = 2
            } else {
                B = B + 1
            }
        }
        
        ans = A
        return ans
    }
    
    func palindrome() {
        
    }
    
    private func reverse(_ x: Int) -> Int {
        guard x >= Int(Int32.min), x <= Int(Int32.max) else {
            return 0
        }
        if x > -10 && x < 10 {
            return x
        }
        var number = abs(x)
        var reverseNumber = 0
        while number > 0 {
            let reminder = number % 10
            reverseNumber = reverseNumber * 10 + reminder
            if reverseNumber > Int(Int32.max) {
                return 0
            }
            number = number / 10
        }
        return x < 0 ? -reverseNumber : reverseNumber
    }
    
}
