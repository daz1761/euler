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
    
    func palindrome() -> Array<Int> {
        
        var A = [Int]()
        A += 1...999
        var B = 800 // more efficient than starting at 1
        var ans = [Int]()
        
        while(B <= 999) {
            
            for a in A {
                
                if((a*B) == reverse(a*B)) {
                    ans.append(a*B)
                }
            }
            
            B = B + 1
            
        }
        
        return ans // 906609, 9009
        
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
    
    func smallestMultiple() -> Int? {
        
        
        var num = 2520 // start from the smallest multiple from 1 ... 10
        var counter = 0
        var index = 0
        var ans : Int?
        
        let divisors = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]  // could not be bothered using the range operator
        
        while(true) {
            
            if(num % divisors[index] == 0) {
                counter = counter + 1
                index = index + 1
            } else {
                counter = 0
                index = 0
                num = num + 1
            }
            
            if(counter == divisors.count) {
                ans = num
                break
            }
            
        }
        
        return ans
    }
    
    func sumSquareDifference() -> Int? {
        
        let power = 2
        var numbers = [Int]()
        numbers += 1...100
        var ans01 = [Int]()
        var diff : Int?
        
        for num in numbers {
            ans01.append(Int(pow(Double(num), Double(power)))) // sqr each element
        }
        let sumSqr = ans01.reduce(0, +) // sum squared of numbers
        let sqrSum = Int(pow(Double(numbers.reduce(0, +)), Double(power))) // squared sum of numbers
        
        diff = sqrSum - sumSqr
        
        return diff
    }
    
    func primeNumbers() -> Int {
        
        // Sieve of Eratosthenes - could not do this way!
        
        var numOfPrimes = 0
        var num = 2
        let limit = 10001
        
        //let b = isPrime(num: 10)
        //print(b) false!
        
        while(numOfPrimes != limit) {
            if(isPrime(num: num)) {
                numOfPrimes = numOfPrimes + 1
                print("\(num) is prime")
            }
            num = num + 1
        }
        
        return num - 1 // 104743  ....  if we dont add "-1" we get 104744, which is PRIME!!!!!
    }
    
    private func isPrime(num : Int) -> Bool {
        
        for i in 2..<num {
            if(num % i == 0) {
                return false
            }
        }
        return true
    }
    
}
