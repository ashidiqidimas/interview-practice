//
//  helper.swift
//  interview-practice
//
//  Created by Dimas on 14/02/24.
//

import Foundation

struct TestCase<Input, Result> {
    let input: Input
    let result: Result
    
    init(input: Input, result: Result) {
        self.input = input
        self.result = result
    }
}

protocol Runable {
    associatedtype Input
    associatedtype Result: Equatable
    
    var testCases: [TestCase<Input, Result>] { get }
    
    func solution(arguments: Input) -> Result
}

extension Runable {
    func run() {
        for (index, testCase) in testCases.enumerated() {
            let result = solution(arguments: testCase.input)
            if result == testCase.result {
                print("Test Case \(index + 1) Succeed")
            } else {
                print("""
                ---
                Test Case \(index + 1) FAIL
                input: \(testCase.input)
                
                expected: \(testCase.result)
                got: \(result)
                """)
                return
            }
        }
        
        print("---")
        print("COMPLETED\n")
    }
}
