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
        
        while (A != B) { // B can be B/2 because to evenly divide, the divisor is half or less than the number!
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

        // Sieve of Eratosthenes - could not do it this way!

        var numOfPrimes = 0
        var num = 2
        let limit = 10001 // this is like a count var

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
    
    func pythagoreanTriplet() -> Int {
        
        var answer = 0
        let limit = 1000
        
        for a in 1..<limit {
            for b in (a+1)..<limit {
                let c = limit - a - b
            
                if(a*a + b*b == c*c) {
                    //print("a^2 + b^2 = \(a*a + b*b)")
                    //print("c^2 = \(c*c)")
                    answer = a*b*c
                    //print("Answer is \(answer)")
                }
            }
        }
        return answer
    }
    
    func sumOfPrimes() -> Int? {
        // Sieve of Eratosthenes (Algorithm for prime numbers)
        
        let limit = 1999999  // 1,999,999 (below 2,000,000) ...... i = 1414 (sqrt of 1999999)
        
        var numbers = [Int]()
        numbers += 2...limit
        
        var primes = [Int]()
       
        var num = 2  // remember, always start at 2!
        var ans: Int?
        var idx = 0
        
        for i in 2...1414 {
            print(i)
            num = numbers[idx]
            
            if(isPrime(num: num)) {
                
                primes = removeMultiplesOf(num: num, from: numbers)
                numbers = primes
            }
            
            idx = idx + 1
            
        }
        
        ans = numbers.reduce(0, +)
        return ans
        
    }
    
    private func removeMultiplesOf(num : Int, from array : [Int]) -> [Int]{
        
        return array.filter({ currentNum->Bool in
            //Only discard the number if it's a multiple of num, but it is not num
            if(currentNum % num == 0 && currentNum != num) {
                return false
            } else {
                return true
            }
        })
        // num = 2
        // testArray = [2,4,6,7,8,10,12]
        // return = [2,7]
    }
    
    private func hypotenuse(_ a: Double, _ b: Double) -> Double {
        return (a * a + b * b).squareRoot()
    }
    
    func LargestProduct() -> Array<Int> {
        
        var numbers = [7,3,1,6,7,1,7,6,5,3,1,3,3,0,6,2,4,9,1,9,2,2,5,1,1,9,6,7,4,4,2,6,5,7,4,7,4,2,3,5,5,3,4,9,1,9,4,9,3,4,9,6,9,8,3,5,2,0,3,1,2,7,7,4,5,0,6,3,2,6,2,3,9,5,7,8,3,1,8,0,1,6,9,8,4,8,0,1,8,6,9,4,7,8,8,5,1,8,4,3,8,5,8,6,1,5,6,0,7,8,9,1,1,2,9,4,9,4,9,5,4,5,9,5,0,1,7,3,7,9,5,8,3,3,1,9,5,2,8,5,3,2,0,8,8,0,5,5,1,1,1,2,5,4,0,6,9,8,7,4,7,1,5,8,5,2,3,8,6,3,0,5,0,7,1,5,6,9,3,2,9,0,9,6,3,2,9,5,2,2,7,4,4,3,0,4,3,5,5,7,6,6,8,9,6,6,4,8,9,5,0,4,4,5,2,4,4,5,2,3,1,6,1,7,3,1,8,5,6,4,0,3,0,9,8,7,1,1,1,2,1,7,2,2,3,8,3,1,1,3,6,2,2,2,9,8,9,3,4,2,3,3,8,0,3,0,8,1,3,5,3,3,6,2,7,6,6,1,4,2,8,2,8,0,6,4,4,4,4,8,6,6,4,5,2,3,8,7,4,9,3,0,3,5,8,9,0,7,2,9,6,2,9,0,4,9,1,5,6,0,4,4,0,7,7,2,3,9,0,7,1,3,8,1,0,5,1,5,8,5,9,3,0,7,9,6,0,8,6,6,7,0,1,7,2,4,2,7,1,2,1,8,8,3,9,9,8,7,9,7,9,0,8,7,9,2,2,7,4,9,2,1,9,0,1,6,9,9,7,2,0,8,8,8,0,9,3,7,7,6,6,5,7,2,7,3,3,3,0,0,1,0,5,3,3,6,7,8,8,1,2,2,0,2,3,5,4,2,1,8,0,9,7,5,1,2,5,4,5,4,0,5,9,4,7,5,2,2,4,3,5,2,5,8,4,9,0,7,7,1,1,6,7,0,5,5,6,0,1,3,6,0,4,8,3,9,5,8,6,4,4,6,7,0,6,3,2,4,4,1,5,7,2,2,1,5,5,3,9,7,5,3,6,9,7,8,1,7,9,7,7,8,4,6,1,7,4,0,6,4,9,5,5,1,4,9,2,9,0,8,6,2,5,6,9,3,2,1,9,7,8,4,6,8,6,2,2,4,8,2,8,3,9,7,2,2,4,1,3,7,5,6,5,7,0,5,6,0,5,7,4,9,0,2,6,1,4,0,7,9,7,2,9,6,8,6,5,2,4,1,4,5,3,5,1,0,0,4,7,4,8,2,1,6,6,3,7,0,4,8,4,4,0,3,1,9,9,8,9,0,0,0,8,8,9,5,2,4,3,4,5,0,6,5,8,5,4,1,2,2,7,5,8,8,6,6,6,8,8,1,1,6,4,2,7,1,7,1,4,7,9,9,2,4,4,4,2,9,2,8,2,3,0,8,6,3,4,6,5,6,7,4,8,1,3,9,1,9,1,2,3,1,6,2,8,2,4,5,8,6,1,7,8,6,6,4,5,8,3,5,9,1,2,4,5,6,6,5,2,9,4,7,6,5,4,5,6,8,2,8,4,8,9,1,2,8,8,3,1,4,2,6,0,7,6,9,0,0,4,2,2,4,2,1,9,0,2,2,6,7,1,0,5,5,6,2,6,3,2,1,1,1,1,1,0,9,3,7,0,5,4,4,2,1,7,5,0,6,9,4,1,6,5,8,9,6,0,4,0,8,0,7,1,9,8,4,0,3,8,5,0,9,6,2,4,5,5,4,4,4,3,6,2,9,8,1,2,3,0,9,8,7,8,7,9,9,2,7,2,4,4,2,8,4,9,0,9,1,8,8,8,4,5,8,0,1,5,6,1,6,6,0,9,7,9,1,9,1,3,3,8,7,5,4,9,9,2,0,0,5,2,4,0,6,3,6,8,9,9,1,2,5,6,0,7,1,7,6,0,6,0,5,8,8,6,1,1,6,4,6,7,1,0,9,4,0,5,0,7,7,5,4,1,0,0,2,2,5,6,9,8,3,1,5,5,2,0,0,0,5,5,9,3,5,7,2,9,7,2,5,7,1,6,3,6,2,6,9,5,6,1,8,8,2,6,7,0,4,2,8,2,5,2,4,8,3,6,0,0,8,2,3,2,5,7,5,3,0,4,2,0,7,5,2,9,6,3,4,5,0]
        
        var answers = [Int]()
        var products = [Int]()
        let productNumber = 13
        let count = numbers.count - productNumber
        
        for i in 0..<count {
            
            for j in 0..<productNumber {
                products.append(numbers[i+j])
            }
            answers.append(products.reduce(1,*))
            products.removeAll()
            
        }
        return answers
        // 9 × 9 × 8 × 9 = 5832
        
         /* let a = [1, 2, 3, 4, 5]
         println(a.reduce(0, +)) // prints 15
         println(a.reduce(1, *)) // prints 120
         */
    }
}
