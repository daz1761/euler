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
    
    func largestDiagProduct() -> Int? {
        
        var numbers : [[Int]] = [[08,02,22,97,38,15,00,40,00,75,04,05,07,78,52,12,50,77,91,08],
                                 [49,49,99,40,17,81,18,57,60,87,17,40,98,43,69,48,04,56,62,00],
                                 [81,49,31,73,55,79,14,29,93,71,40,67,53,88,30,03,49,13,36,65],
                                 [52,70,95,23,04,60,11,42,69,24,68,56,01,32,56,71,37,02,36,91],
                                 [22,31,16,71,51,67,63,89,41,92,36,54,22,40,40,28,66,33,13,80],
                                 [24,47,32,60,99,03,45,02,44,75,33,53,78,36,84,20,35,17,12,50],
                                 [32,98,81,28,64,23,67,10,26,38,40,67,59,54,70,66,18,38,64,70],
                                 [67,26,20,68,02,62,12,20,95,63,94,39,63,08,40,91,66,49,94,21],
                                 [24,55,58,05,66,73,99,26,97,17,78,78,96,83,14,88,34,89,63,72],
                                 [21,36,23,09,75,00,76,44,20,45,35,14,00,61,33,97,34,31,33,95],
                                 [78,17,53,28,22,75,31,67,15,94,03,80,04,62,16,14,09,53,56,92],
                                 [16,39,05,42,96,35,31,47,55,58,88,24,00,17,54,24,36,29,85,57],
                                 [86,56,00,48,35,71,89,07,05,44,44,37,44,60,21,58,51,54,17,58],
                                 [19,80,81,68,05,94,47,69,28,73,92,13,86,52,17,77,04,89,55,40],
                                 [04,52,08,83,97,35,99,16,07,97,57,32,16,26,26,79,33,27,98,66],
                                 [88,36,68,87,57,62,20,72,03,46,33,67,46,55,12,32,63,93,53,69],
                                 [04,42,16,73,38,25,39,11,24,94,72,18,08,46,29,32,40,62,76,36],
                                 [20,69,36,41,72,30,23,88,34,62,99,69,82,67,59,85,74,04,36,16],
                                 [20,73,35,29,78,31,90,01,74,31,49,71,48,86,81,16,23,57,05,54],
                                 [01,70,54,71,83,51,54,69,16,92,33,48,61,43,52,01,89,19,67,48]]
        
        //print(numbers[0][3])
        
        let offset = 4
        let count = numbers.count
        var answers = [Int]()
        var products = [Int]()
        var answer : Int?
        
        for x in 0..<count-offset {
            
            for y in 0..<count-offset {
                
                // diagonal
                products.append(numbers[x][y])
                products.append(numbers[x+1][y+1])
                products.append(numbers[x+2][y+2])
                products.append(numbers[x+3][y+3])
                answers.append(products.reduce(1,*))
                products.removeAll()
                
                // horizontal line
                products.append(numbers[x][y])
                products.append(numbers[x][y+1])
                products.append(numbers[x][y+2])
                products.append(numbers[x][y+3])
                answers.append(products.reduce(1,*))
                products.removeAll()
                
                // vertical line
                products.append(numbers[x][y])
                products.append(numbers[x+1][y])
                products.append(numbers[x+2][y])
                products.append(numbers[x+3][y])
                answers.append(products.reduce(1,*))
                products.removeAll()
                
                // reverse diagonal
                products.append(numbers[x][y+3])
                products.append(numbers[x+1][y+2])
                products.append(numbers[x+2][y+1])
                products.append(numbers[x+3][y])
                answers.append(products.reduce(1,*))
                products.removeAll()
            }
        }
        if let max = answers.max() {
            answer = max
        }
        return answer
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
