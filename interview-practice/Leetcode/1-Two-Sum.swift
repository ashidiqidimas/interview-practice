//
//  1-Two-Sum.swift
//  interview-practice
//
//  Created by Dimas on 14/02/24.
//

import Foundation

class TwoSum {
    
    // MARK: - Using Dictionary
    
//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        var dictionary = Dictionary<Int, Int>()
//        
//        for (index, value) in nums.enumerated() {
//            dictionary[value] = index
//        }
//    }
    
    // MARK: - Using Two Pointers Array
    
    struct Element {
        let index: Int
        let value: Int
    }
    
    func twoSumTwoPointers(_ nums: [Int], _ target: Int) -> [Int] {
        var leftIndex = 0
        var rightIndex = nums.count - 1
        
        let sortedElements = (0..<nums.count)
            .map { i in
                Element(index: i, value: nums[i])
            }
            .sorted(by: { $0.value < $1.value })
        
        while leftIndex < rightIndex {
            let sum = sortedElements[leftIndex].value + sortedElements[rightIndex].value
            
            if sum == target {
                return [sortedElements[leftIndex].index, sortedElements[rightIndex].index]
            } else if sum < target {
                leftIndex += 1
            } else if sum > target {
                rightIndex -= 1
            }
        }
        
        fatalError("Constraint said one valid answer must exists.")
    }
    
}
