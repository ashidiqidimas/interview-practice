//
//  main.swift
//  interview-practice
//
//  Created by Dimas on 14/02/24.
//

import Foundation

NumberOfGoodPairs().run()

class NumberOfGoodPairs: Runable {
    
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var count = 0
        var numCount = [Int: Int]()
        
        for num in nums {
            count += numCount[num, default: 0]
            numCount[num, default: 0] += 1
        }
        
        return count
    }
    
}

extension NumberOfGoodPairs {
    func solution(arguments: [Int]) -> Int {
        numIdenticalPairs(arguments)
    }
    
    var testCases: [TestCase<[Int], Int>] {
        [
            TestCase(input: [1,2,3,1,1,3], result: 4),
            TestCase(input: [1,1,1,1], result: 6),
            TestCase(input: [1,2,3], result: 0)
        ]
    }
}
