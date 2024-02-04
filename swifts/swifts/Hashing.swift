//
//  Hashing.swift
//  swifts
//
//  Created by Gaurav Sara on 04/02/24.
//

import Foundation

class Hashing {
    
    // Hashing
    func frequencyCount(arr: [Int], queries: [Int]) -> [Int] {
        var hash: [Int: Int] = [:]
        
        // Precompute frequencies
        for num in arr {
            hash[num, default: 0] += 1
        }
        
        // Fetch frequencies for queries
        return queries.map { hash[$0] ?? 0 }
    }
    
    
        let n = Int(readLine()!)!
        var arr = [Int]()
        for _ in 0..<n {
            arr.append(Int(readLine()!)!)
        }
        
        var hash = Array(repeating: 0, count: 13)
        for num in arr {
            hash[num] += 1
        }
        
        var q = Int(readLine()!)!
        while q > 0 {
            let number = Int(readLine()!)!
            print(hash[number])
            q -= 1
        }
    
}

let hashing = Hashing()
hashing.mainFunc()
