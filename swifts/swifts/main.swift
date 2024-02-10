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
        _ = arrC[i]
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
            
            for _ in 0..<(2 * (input - i)) {
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
            for _ in 1...i {
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
        let endChar: Character = "E"
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
        let n = Int(round(log10(input) + 1))
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
        // Brute force - 0(n)
//        for i in 1...num {
        
//            if num % i == 0 {
//                print(i)
//            }
//        }
        
        // optimal approach
        for i in 1...Int(sqrt(Double(num))) {
            if num % i == 0 {
                print(i, terminator: " ")
                
                if i != num / i {
                    print(num / i, terminator: " ")
                }
            }
        }
    }
    
    func isPrime(_ input: Int) {
        for i in 2...Int(sqrt(Double(input))) {
            if input % i == 0 {
                print("It's not a prime number")
                return
            }
        }
        print("It's a prime number")
    }
    
    var count = 0
    func recursion() {
        if count == 4 {
            return
        }
        
        print(count, terminator: " ")
        count += 1
        recursion()
    }
    
    func printName(_ i: Int, _ n: Int) {
        if i > n {
            return
        }
        
        print("Hironmoy Dhar")
        printName(i + 1, 4)
    }
    
    func printNumber(_ i: Int, _ n: Int) {
        if i > n {
            return
        }
        
        print(i, terminator: " ")
        printNumber(i + 1, n)
    }
    
    func printOneToN(_ n: Int) {
        if n < 1 {
            return
        }
        
        print(n, terminator: " ")
        printOneToN(n - 1)
        
    }
    
    func sumOfNNaturalNumbers(_ n: Int, _ sum: Int) {
        if n < 1 {
            print(sum)
            return
        }
        
        sumOfNNaturalNumbers(n - 1, sum + n)
    }
    
    func factorial(n: Int) {
        var f = 1
        for i in 1...n {
            f *= i
        }
        
        print(f)
    }
    
    func factorial1(i: Int, n: Int) {
        if n < 1 {
            print(i)
            return
        }
        
        factorial1(i: i * n, n: n - 1)
    }
    
    func reverse(_ arr: [Int]) {
        var arr2 = arr
        
        var first = 0
        var last = arr2.count - 1
        
        while first < last {
            let temp = arr2[first]
            arr2[first] = arr2[last]
            arr2[last] = temp
            
            first += 1
            last -= 1
        }
        
        print(arr2)
    }
    
    func reverseWithForLoop(arr: [Int]) {
        var ans = [Int]()
        
        for i in stride(from: arr.count - 1, through: 0, by: -1) {
            ans.append(arr[i])
        }
        
        print(ans)
    }
    
    func swap(_ first: Int, _ last: Int) -> (Int, Int) {
        var f = first
        var l = last
        let temp = f
        f = l
        l = temp
        
        return (f, l)
    }
    
    func reverseWithRecursion(_ arr: inout [Int], _ start: Int, _ end: Int) {
        if start < end {
            (arr[start], arr[end]) = (arr[end], arr[start])
            
            reverseWithRecursion(&arr, start + 1, end - 1)
        }
    }
    
    // with swap
    func isStringPallindrome(_ text: inout String) {
        var textArr = text.split(separator: "")
        var first = 0
        var last = textArr.count - 1
        
        while(first < last) {
            (textArr[first], textArr[last]) = (textArr[last], textArr[first])
            first += 1
            last -= 1
        }
        
        let newText = textArr.joined()
        
        if newText == text {
            print("This text is a pallindrom")
        } else {
            print("This text is not a pallindrome")
        }
        
    }
    
    // with two pointers
    func isStringPallindrome2(_ text: String) -> Bool {
        var first = text.startIndex
        var last = text.index(before: text.endIndex)
        
        while first < last {
            if text[first] == text[last] {
                first = text.index(after: first)
                last = text.index(before: last)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func fibonacciNumber(_ n: Int) {
        var arr = [Int]()
        if n == 0 {
            print(n)
        } else {
            arr.append(0)
            arr.append(1)
            
            for i in 2...n {
                arr.append(arr[i - 1] + arr[i - 2])
            }
        }
        
        print(arr)
    }
    
    // space optimized
    func fibonacciNumber2(_ n: Int) {
        if n == 0 {
            print(n)
            return
        } else {
            var secondLast = 0
            var last = 1
            print("\(secondLast) \(last)", terminator: " ")
            
            var curr: Int
            for _ in 2...n {
                curr = secondLast + last
                print(curr, terminator: " ")
                
                secondLast = last
                last = curr
            }
        }
        print()
    }
    
    // with recursion - This one is wrong
    func fibonacciNumber3(_ n: Int) -> Int {
        if n <= 1 {
            print(n, terminator: " ")
            return n
        }
        
        let last = fibonacciNumber3(n - 1)
        let secondLast = fibonacciNumber3(n - 2)
        
        print(last + secondLast, terminator: " ")
        return last + secondLast
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
    
    
    
    
    // Hashing Integer
    var hashArr = Array(repeating: 0, count: 13)
    
    func hashingAnArr(arr: [Int]) -> [Int] {
        for n in arr {
            hashArr[n] += 1
        }
        
        return hashArr
    }
    
    // Hashing Character
    var hashChar = Array(repeating: 0, count: 256)
    
    func hashingAnArrOfChar(arr: [Character]) -> [Int] {
        for char in arr {
            if let asciiValue = char.asciiValue {
                let index = Int(asciiValue)
                
                // Ensure the index is within the bounds of the array, if we're only looking for small character because it has 26 length of the arr. So apparently the initializing of an 'hashArr' like this
//                var hashChar = Array(repeating: 0, count: 26)
//                if index < hashChar.count {
//                    hashChar[index] += 1
//                } else {
//                    print("Error: ASCII value out of bounds")
//                }
                
                
                hashChar[index] += 1
            }
        }
        
        return hashChar
    }
    
    func countFrequencyOfElement(arr: [Int]) -> [Int: Int] {
        var dictionaryArray = [Int: Int]()
        for n in arr {
            if var count = dictionaryArray[n] {
                dictionaryArray[n] = count + 1
            } else {
                dictionaryArray[n] = 1
            }
        }
        
        return dictionaryArray
    }
    
    // Brute force approach
    func higestAndLowestFrequency1() {
        let intArr = [1, 3, 1, 4, 1, 4]
        var visitedArr = Array(repeating: false, count: intArr.count)
        var maxEle = 0
        var maxFreq = 0
        var minEle = 0
        var minFreq = Int.max
        
        for i in 0..<intArr.count {
            if visitedArr[i] == true {
                continue
            }
            
            var count = 0
            
            for j in 0..<intArr.count - 1 {
                if intArr[i] == intArr[j + 1] {
                    visitedArr[i] = true
                    count += 1
                }
            }
            
            if count > maxFreq {
                maxFreq = count
                maxEle = intArr[i]
            }
            
            if count < minFreq {
                minFreq = count
                minEle = intArr[i]
            }
        }
        
        print("The higest frequency is \(maxEle) \(maxFreq + 1)")
        print("The lowest frequency is \(minEle) \(minFreq)")
    }
    
    func higestAndLowestFrequency() {
        let intArr = [1, 3, 1, 3, 9, 14, 14, 14, 14]
        let arr = countFrequencyOfElement(arr: intArr)
        
        guard let firstElement = arr.first else { return }
        
        var maxFrequency = firstElement
        var minFrequency = firstElement
        
        for (key, frequency) in arr {
            if frequency < minFrequency.value {
                minFrequency = (key, frequency)
            }
            
            if frequency > maxFrequency.value {
                maxFrequency = (key, frequency)
            }
        }
        
        print(maxFrequency, minFrequency)
    }
    
    
    
    // Important Sorting Techniques
    func selectionSort(arr: inout [Int]) {
        for i in 0..<arr.count {
            var index = i
            
            for j in (i + 1)..<arr.count {
                if arr[index] > arr[j] {
                    index = j
                }
            }
            
            // swap
            let temp = arr[i]
            arr[i] = arr[index]
            arr[index] = temp
        }
    }
    
    func bubbleSort(arr: inout [Int]) {
        var isSorted = true
        for i in stride(from: arr.count - 1, through: 0, by: -1) {
            for j in 0..<i {
                if arr[j] > arr[j + 1] {
                    // swap
                    let temp = arr[j]
                    arr[j] = arr[j + 1]
                    arr[j + 1] = temp
                    
                    isSorted = false
                }
            }
            if isSorted {
                print("It's an sorted array")
                return
            }
        }
    }
}


//let arr = [3, 2, 5, -1, 4, 1]
//let arrCount = [4, 2, 6, 5, 3, 1]
//let arr2D = [[2, 3, 4, 1], [8, 9, 10, 11, 12]]
//let numbers = [12, 5, 342, 0, 5552, -23, 22222, 987583]
//let name = "Hironmoy dhar"
//let chTarget: Character = "d"
//let target = 4

let playGround = MyPlayground()
//let play = playGround
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
//playGround.printAllDivisors(36)
//playGround.isPrime(7)
//playGround.recursion()
//playGround.printName(1, 4)
//playGround.sumOfNNaturalNumbers(5, 0)
//playGround.factorial(n: 5)
//playGround.factorial1(i: 1, n: 5)
//playGround.reverse([5, 4, 3, 2, 1])
//playGround.reverseWithForLoop(arr: [5, 4, 3, 2, 1])
//var arr4 = [5, 4, 3, 2, 1]
//print(playGround.reverseWithRecursion(&arr4, 0, arr4.count - 1))
//print(arr4)
//var text = "Gaurav"
//let ans = playGround.isStringPallindrome2(text)
//if ans == true {
//    print("It's pallindrome")
//} else {
//    print("It's not a pallindrome")
//}
//print(playGround.fibonacciNumber3(5), terminator: " ")
//print()


// Hashing
//let arr1 = [1, 3, 1, 3, 4, 12]
//let hashing = playGround.hashingAnArr(arr: arr1)

//print(hashing)

//let charArray: [Character] = ["a", "b", "a", "c", "A", "B", "A", "C"]
//let hashingChar = playGround.hashingAnArrOfChar(arr: charArray)
//let frequency = playGround.countFrequencyOfElement(arr: arr1)
//playGround.higestAndLowestFrequency1()
//playGround.higestAndLowestFrequency()

// Note -> We can number hashing til 10^10 at max, if we declare this array global, but if it'll go beyond this like 10^11, 10^12 etc then we can't hash this using arrays That is something we need to solve. And that is where in C++ 'STL' comes in, where we use 'map' or 'unorderd-map'. And in JAVA in 'Collection', where we use 'HashMap', and in Swift 'Dictionary'


// Basics of DSA
var arr = [4, 1, 5, 3, 2]
var sortedArr = [1, 2, 3, 4, 5]
//playGround.selectionSort(arr: &arr)
//playGround.bubbleSort(arr: &sortedArr)
//print(sortedArr)
