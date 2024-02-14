//
//  217-Contains-Duplicate.swift
//  interview-practice
//
//  Created by Dimas on 14/02/24.
//

import Foundation

class ContainsDuplicate: Runable {
    func solution(arguments: [Int]) -> Bool {
        containsDuplicate(arguments)
    }
    
    var testCases = [
        TestCase(input: [1,2,3,1], result: true)
    ]
    
    func containsDuplicate(_ nums: [Int]) -> Bool {
        Set(nums).count != nums.count
    }
}
