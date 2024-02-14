//
//  345-Reverse-Vowels-of-a-String.swift
//  interview-practice
//
//  Created by Dimas on 14/02/24.
//

import Foundation

class ReverseVowels: Runable {
    func reverseVowels(_ s: String) -> String {
        var leftIndex = 0
        var rightIndex = s.count - 1
        
        var sArray = s.map { String($0) }
        
        let vowels = Set(["a", "i", "u", "e", "o", "A", "I", "U", "E", "O"])
        
        while leftIndex <= rightIndex {
            let leftChar = sArray[leftIndex]
            let rightChar = sArray[rightIndex]
            
            let leftIsVowel = vowels.contains(leftChar)
            let rightIsVowel = vowels.contains(rightChar)
            
            if leftIsVowel && rightIsVowel {
                sArray.swapAt(leftIndex, rightIndex)
                leftIndex += 1
                rightIndex -= 1
            } else if leftIsVowel {
                rightIndex -= 1
            } else if !leftIsVowel {
                leftIndex += 1
            } else {
                leftIndex += 1
                rightIndex -= 1
            }
        }
        
        return sArray.joined()
     }
}

extension ReverseVowels {
    var testCases: [TestCase<String, String>] { [
        TestCase(input: "hello", result: "holle"),
        TestCase(input: "leetcode", result: "leotcede")
    ] }
    
    func solution(arguments: String) -> String {
        reverseVowels(arguments)
    }
}
