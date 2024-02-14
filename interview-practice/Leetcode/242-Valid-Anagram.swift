//
//  242-Valid-Anagram.swift
//  interview-practice
//
//  Created by Dimas on 14/02/24.
//

import Foundation

/**
 242. Valid Anagram
 https://leetcode.com/problems/valid-anagram/description/
 */
class ValidAnagram {
    
    // MARK: - O(N) Memory, and compatible with Unicode
    
    func isUnicodeStringAnagram(_ s: String, _ t: String) -> Bool {
        var sourceDictionary = Dictionary<String.Element, Int>()
        
        for char in s {
            let currentCount = sourceDictionary[char, default: 0]
            sourceDictionary.updateValue(currentCount + 1, forKey: char)
        }
        
        for char in t {
            if let currentCount = sourceDictionary[char] {
                if currentCount == 1 {
                    sourceDictionary.removeValue(forKey: char)
                } else {
                    sourceDictionary.updateValue(currentCount - 1, forKey: char)
                }
            } else {
                return false
            }
        }
        
        return sourceDictionary.isEmpty
    }
    
    // MARK: - O(1) Memory, but doesn't work with Unicode
    
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let sCounts = charCountsArray(from: s)
        let tCounts = charCountsArray(from: t)
        
        for i in 0..<26 {
            guard sCounts[i] == tCounts[i] else { return false }
        }
        
        return true
    }
    
    private func charCountsArray(from string: String) -> [Int] {
        let aCharOffset = Character("a").asciiValue ?? 0
        
        var result = Array(repeating: 0, count: 26)
        
        for char in string {
            if let asciiValue = char.asciiValue {
                let charIndex =  Int(asciiValue - aCharOffset)
                result[charIndex] += 1
            }
        }
        
        return result
    }
}
