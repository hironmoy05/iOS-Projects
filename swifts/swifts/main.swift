//
//  main.swift
//  swifts
//
//  Created by Gaurav Sara on 13/01/24.
//

import Foundation

class MyPlayground {
    
    func linearSearch(_ arr: [Int], _ target: Int) -> Int {
        if arr.count == 0 {
            return Int.max
        }
        
        for (idx, element) in arr.enumerated() {
            if arr[idx] == target {
                return element
            }
        }
        
//        for element in arr {
//            if element == target {
//                return element
//            }
//        }
        
        return Int.max
    }
    
    func linearSearchInString(str: String, ch: Character) -> Bool {
        if str.isEmpty {
            return false
        }
        
        for (idx, char) in str.enumerated() {
            if char == ch {
                print(idx)
                return true
            }
        }
        
        return false
    }
    
    func linearSearchInRange(_ arr: [Int], _ target: Int, _ start: Int, _ end: Int) -> Int {
        if arr.count == 0 {
            return Int.max
        }
        
        for idx in start...end {
            if arr[idx] == target {
                return arr[idx]
            }
        }
        
//        for element in arr {
//            if element == target {
//                return element
//            }
//        }
        
        return Int.max
    }
    
    func findMinimumNumber(_ arr: [Int]) -> Int {
//        var minNumber = Int.max
//        or
        var minNumber = arr[0]
        
        for n in arr {
//            minNumber = min(minNumber, n);
//            or
            if n < minNumber {
                minNumber = n
            }
        }
        
        return minNumber
    }
    
    func findMaximumNumber(_ arr: [Int]) -> Int {
//        var maxNumber = Int.min
//        or
        var maxNumber = arr[0]
        
//        for n in arr {
//            maxNumber = max(maxNumber, n);

//            or
//            if n > maxNumber {
//                maxNumber = n
//            }
            
//            or
        for (idx, e) in arr.enumerated() {
            if arr[idx] > maxNumber {
                maxNumber = e
            }
        }
        
        return maxNumber
    }
    
    // Search in 2D array
    func searchIn2DArray(_ arr2D: [[Int]], _ target: Int) -> [Int] {
        for (row, arr) in arr2D.enumerated() {
            for (col, e) in arr.enumerated() {
                if target == e {
                    return [row, col]
                }
            }
        }
        
        return [Int.min, Int.min]
    }
    
    func findMaxIn2DArray(_ arr2D: [[Int]]) -> Int {
//        var max = arr2D[0][0]
//        for arr in arr2D {
//            for (j, e) in arr.enumerated() {
//                if max < arr[j] {
//                    max = e
//                }
//            }
//        }
        
//        or
        var maxNum = Int.min
        for arr in arr2D {
            for e in arr {
//                if e > max {
//                    max = e
//                }
                
//                or
                maxNum = max(maxNum, e)
            }
        }
        
        return maxNum
    }
    
    func findEvenNumberOfDigits(_ arr: [Int]) -> Int {
        var evenNumbers = 0
        
//        for e in arr {
//            if String(e).count % 2 == 0 {
//                evenNumbers += 1
//            }
//        }
        
        // or
        
        for num in arr {
            let count = digits(num)
            print(count)
            
            if count % 2 == 0 {
                evenNumbers += 1
            }
        }
        
        return evenNumbers
    }
    
    // Count number of digits in number
    func digits(_ num: Int) -> Int {
        var tempNum = num
            if tempNum < 0 {
//                tempNum = abs(tempNum)
                // or
                tempNum = tempNum * -1
            }
        
        if tempNum == 0 {
            return 1
        }
        
//        var count = 0
//        while tempNum > 0 {
//            count += 1
//            tempNum /= 10
//        }
//
//        return count
        
        // or we count with log10 method as well
        return Int(log10(Double(tempNum)))+1
    }
    
    func bubbleSort(_ arr: [Int]) -> [Int] {
        var arrC = arr
        
        for i in stride(from: 0, to: arrC.count - 1, by: 1) {
            for j in stride(from: 0, to: arrC.count - i - 1, by: 1) {
                if arrC[j] > arrC[j + 1] {
                    let temp = arrC[j]
                    arrC[j] = arrC[j + 1]
                    arrC[j + 1] = temp
                }
            }
        }
        
        return arrC
    }
    
    func selectionSort(_ arr: [Int]) -> [Int] {
        var arrC = arr
        
        for i in 0..<(arrC.count - 1) {
            var minPos = i
            
            for j in (i + 1)...(arrC.count - 1) {
                // find the minimum one and set to the minPos
                if arrC[j] < arrC[minPos] {
                    minPos = j
                }
            }
            
            // Swap
            let temp = arrC[i]
            arrC[i] = arrC[minPos]
            arrC[minPos] = temp
        }
        
        return arrC
    }
    
    func insertionSort(_ arr: [Int]) -> [Int] {
        var arrC = arr
        
        for i in 1..<(arrC.count) {
            let curr = arrC[i]
            var prev = i - 1
            
            while(prev >= 0 && arrC[prev] > curr) {
                arrC[prev + 1] = arrC[prev]
                prev -= 1
            }
            
            // Insertion
            arrC[prev + 1] = curr
        }
        
        
        return arrC
    }
    
    func countingSort(_ arr: [Int]) -> [Int] {
        var arrC = arr
        var largest = arrC[0]
        
        for i in 0..<(arrC.count) {
            largest = max(largest, arrC[i])
        }
        
        var countArray = Array(repeating: 0, count: largest + 1)
        for i in 0..<(arrC.count) {
            countArray[arrC[i]] += 1
        }
        
        var j = 0
        
        for i in 0..<(countArray.count) {
            while countArray[i] > 0 {
                arrC[j] = i
                j += 1
                countArray[i] -= 1
            }
        }
        
        return arrC
    }
    
    func quickSort(_ arr: [Int], _ low: Int, _ high: Int) -> [Int] {
        var arrC = arr
        let pIdx = partition(arrC, low, high)
        
        arrC = quickSort(arrC, low, pIdx - 1)
        arrC = quickSort(arrC, pIdx + 1, high)
        
        return arrC
    }
    
    private func partition(_ arr: [Int], _ low: Int, _ high: Int) -> Int {
        var arrC = arr
        let pivot = arrC[high]
        var i = low - 1
        
        for j in low..<high {
            if arrC[j] < pivot {
                i += 1
                
                // Swap
                let temp = arrC[i]
                arrC[i] = arrC[j]
                arrC[j] = temp
            }
        }
        
        // Swap the pivot
        i += 1
        let temp = arrC[i]
        arrC[i] = pivot
        arrC[high] = pivot
        
        return i
    }

    func printPatterns(_ input: Int) {
        guard input > 0 else {
           print("Number of rows should be a positive integer.")
           return
       }
        
        for i in 0..<(input) {
           
            for _ in 1..<(input - i) {
                print(" ", terminator: " ")
            }
            
            for _ in 1...(2 * i + 1) {
                print("*", terminator: " ")
            }
            
            print()
        }
        
        for i in 1...(input) {
           
            for _ in 1..<i {
                print(" ", terminator: " ")
            }
             
            for _ in 1...(2 * (input - i) + 1) {
                print("*", terminator: " ")
            }
            
            print()
        }
    }
    
    func printPattern2(_ input: Int) {
        guard input > 0 else {
            print("Number of rows should be a positive integer.")
            return
        }
        
        for i in 1...input {
            for _ in 1...i {
                print("*", terminator: " ")
            }
            print()
        }
        
        for i in 1..<input {
            for _ in 1...(input - i) {
                print("*", terminator: " ")
            }
            print()
        }
    }
    
    func printPattern3(_ input: Int) {
        var start = 1
        for i in 1...input {
            if i % 2 == 0 {
                start = 0
            } else {
                start = 1
            }
            
            for _ in 1...i {
                print(start, terminator: " ")
                start = 1 - start
            }
            print()
        }
    }
    
    func printPattern4(_ input: Int) {
        for i in 1...input {
            for j in 1...i {
                print(j, terminator: " ")
            }
            
            for j in 0..<(2 * (input - i)) {
                print(" ", terminator: " ")
            }
            
            for j in stride(from: i, through: 1, by: -1) {
                print(j, terminator: " ")
            }
            
            print()
        }
    }
    
    func printPattern5(_ input: Int) {
        var k = 1
        for i in 1...input {
            for j in 1...i {
                print(k, terminator: " ")
                k += 1
            }
            
            print()
        }
    }
    
    func printPattern6(_ input: Int) {
        for i in 0..<input {
                var char: Character = "A"
            for _ in 0...i {
                print(char, terminator: " ")
                
                let asciiValue = char.asciiValue!
                let nextAsciiValue = asciiValue + 1
                char = Character(UnicodeScalar(nextAsciiValue))
            }
            
            print()
        }
    }
    
    func printPattern7(_ input: Int) {
        for i in 0..<input {
                var char: Character = "A"
            for _ in stride(from: input - i, to: 0, by: -1) {
                print(char, terminator: " ")
                
                let asciiValue = char.asciiValue!
                let nextAsciiValue = asciiValue + 1
                char = Character(UnicodeScalar(nextAsciiValue))
            }
            
            print()
        }
    }
    
    func printPattern8(_ input: Int) {
        var char: Character = "A"
        for i in 0..<input {
            for _ in 0...i {
                print(char, terminator: " ")
            }
            
            let asciiValue = char.asciiValue!
            let nextAsciiValue = asciiValue + 1
            char = Character(UnicodeScalar(nextAsciiValue))
            
            print()
        }
    }
    
    func printPattern9(_ input: Int) {
        var char: Character = "A"
        for i in 1...input {
            for _ in stride(from: input - i, to: 0, by: -1) {
                print(" ", terminator: " ")
            }
            
            char = "A"
            var asciiValue = char.asciiValue!
            let breakpoint = (2 * i - 1) / 2
            for j in 1...(2 * i - 1) {
                char = Character(UnicodeScalar(asciiValue))
                print(char, terminator: " ")
                
                if j <= breakpoint {
                    asciiValue += 1
                } else {
                    asciiValue -= 1
                }
            }
            
            print()
        }
    }
    
    func printPattern10(_ input: Int) {
        
//        for i in 1...input {
//            var char: Character = "E"
//            var asciiValue = char.asciiValue!
//            asciiValue -= UInt8(i - 1)
//            char = Character(UnicodeScalar(asciiValue))
//            for _ in 1...i {
//                print(char, terminator: " ")
//                var asciiValue = char.asciiValue!
//                asciiValue +=  1
//                char = Character(UnicodeScalar(asciiValue))
//            }
//            print()
//        }
        
//        or
        var endChar: Character = "E"
        let endValue = UnicodeScalar(String(endChar))!.value
        for i in 0..<input {
            for j in 0...i {
                print(Character(UnicodeScalar(endValue - UInt32(i) + UInt32(j))!), terminator: " ")
            }
            print()
        }
    }
    
    func printPattern11(_ input: Int) {
        for i in 1...input {
            for _ in stride(from: input - i + 1, through: 1, by: -1) {
                print("*", terminator: " ")
            }
            
            for j in 0...(2 * i - 2) {
                if j > 0 {
                    print(" ", terminator: " ")
                }
            }
            
            for _ in stride(from: input - i + 1, through: 1, by: -1) {
                print("*", terminator: " ")
            }
            
            print()
        }
        
        for i in 1...input {
            for _ in 1...i {
                print("*", terminator: " ")
            }
            
            for _ in stride(from: 2 * (input - i), through: 1, by: -1) {
                print(" ", terminator: " ")
            }
            
            for _ in 1...i {
                print("*", terminator: " ")
            }
            
            print()
        }
    }
    
    func printPattern12(_ input: Int) {
        for i in 1...input {
            for _ in 1...i {
                print("*", terminator: " ")
            }
            for _ in stride(from: 2 * (input - i), through: 1, by: -1) {
                print(" ", terminator: " ")
            }
            for _ in 1...i {
                print("*", terminator: " ")
            }
            
            print()
        }
        
        for i in stride(from: input - 1, through: 1, by: -1) {
            for _ in 1...i {
                print("*", terminator: " ")
            }
            
            for _ in stride(from: 2 * (input - i), through: 1, by: -1) {
                print(" ", terminator: " ")
            }
            
            for _ in 1...i {
                print("*", terminator: " ")
            }
            
            print()
        }
    }
    
    func printPattern13(_ input: Int) {
        for i in 1...input {
            for j in 1...input {
                if i == 1 || j == 1 || i == input || j == input {
                    print("*", terminator: " ")
                } else {
                    print(" ", terminator: " ")
                }
            }
            print()
        }
    }
    
    func printPattern14(_ input: Int) {
        for i in 0..<(2 * input - 1) {
            for j in 0..<(2 * input - 1) {
                let top = i
                let left = j
                let right = (2*input - 2) - j
                let bottom = (2*input - 2) - i
                
                print(input - min(min(top, bottom), min(right, left)), terminator: " ")
            }
            print()
        }
    }
    
    func runWhileLoop() {
        var i = 0
        
        while i < 12 {
            print(i, terminator: " ")
            i += 1
        }
        print()
    }
    
    func runForLoop() {
        for i in 1..<12 {
            print(i, terminator: " ")
        }
        print()
    }
    
    func countDigitsInANumber(_ input: Double) {
//        var count = 0
//        var n = input
//
//        while(n != 0) {
//            count += 1
//            n /= 10
//        }
//        print(count)
        
        // converting into string and get the count of the string
        // var n = String(input)
        
        // with log10 method
        var n = Int(round(log10(input) + 1))
        print(n)
    }
    
    func reverseNumber(_ input: Int) {
        var reverse: Float = 0
        var n = input
        
        while(n != 0) {
            let lastDigit = n % 10
            reverse = reverse * 10 + Float(lastDigit)
            n /= 10
        }
        
        print(Int(reverse))
    }
    
    func isPallindromNum(_ input: Int) {
        var reverse = 0
        var n = input
        
        while (n != 0) {
            let lastDigit = n % 10
            reverse = reverse * 10 + lastDigit
            n /= 10
        }
        
        if reverse == input {
            print("\(input) is a pallindrom.")
        } else {
            print("\(input) is not a pallindrome.")
        }
    }
    
    func GCDORHCF(_ num1: Int, _ num2: Int) -> Int {
        // Brute force approach
//        var ans: Int = 0
//
//        for i in 1...(min(num1, num2)) {
//            if num1 % 2 == 0 && num2 % 2 == 0 {
//                ans = i
//            }
//        }
//
//        print(ans)
        print(num2)
        
        if num2 == 0 {
            return num1
        }
        
        return GCDORHCF(num2, num1 % num2)
        
    }
    
    func isArmstrong(_ num: Int) {
        let power = String(num).count
        var number = 0.0
        var n = num
        
        while (n != 0) {
            let lastDigit = n % 10
            number += Double(NSDecimalNumber(decimal: pow(Decimal(lastDigit), power)).intValue)
            n /= 10
        }
        
        if Int(number) == num {
            print("\(num) is an armstrong")
        } else {
            print("\(num) is an armstrong")
        }
        
    }

    func printAllDivisors(_ num: Int) {
        for i in 1...num {
            if num % i == 0 {
                print(i)
            }
        }
    }
    
    func strideFunc() {
        let n = 10
        
        for i in stride(from: n, through: 1, by: -1) { // 10 9 8 7 6 5 4 3 2 1
            print(i, terminator: " ")
        }
        print()
        
        for i in stride(from: n, to: 1, by: -1) { // 10 9 8 7 6 5 4 3 2
            print(i, terminator: " ")
        }
    }
}

let arr = [3, 2, 5, -1, 4, 1]
let arrCount = [4, 2, 6, 5, 3, 1]
let arr2D = [[2, 3, 4, 1], [8, 9, 10, 11, 12]]
let numbers = [12, 5, 342, 0, 5552, -23, 22222, 987583]
let name = "Hironmoy dhar"
let chTarget: Character = "d"
let target = 4

let playGround = MyPlayground()
let play = playGround
//print(playGround === play)
//let ans = playGround.linearSearch(arr, target)
//let ans2 = playGround.linearSearchInString(str: name, ch: chTarget)
//let ans = playGround.linearSearchInRange(arr, target, 1, 3)
//let ans = playGround.findMinimumNumber(arr)
//let ans = playGround.findMaximumNumber(arr)
//let ans = playGround.searchIn2DArray(arr2D, 11)
//let ans = playGround.findMaxIn2DArray(arr2D)
//let ans = playGround.findEvenNumberOfDigits(numbers)
//let bubbleSortedArray = playGround.bubbleSort(arr)
//let selectionSortArray = playGround.selectionSort(arr)
//let insertionSortArray = playGround.insertionSort(arr)
//let countingSortArray = playGround.countingSort(arrCount)
//let quickSortArray = playGround.quickSort(arr, 0, arr.count - 1)
//playGround.printPattern14(4)
//print(playGround.GCDORHCF(8, 16))
//playGround.isArmstrong(153)
playGround.printAllDivisors(8)


