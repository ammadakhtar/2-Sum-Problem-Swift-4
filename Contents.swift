
import Foundation

// Return a Boolean if there are 2 numbers in the array that equal a sum
let numbers = [1, 3, 6, 7, 7, 12, 14]



// 1. Brute Force - Nested For-Loop compare all (n2)
func bruteForceTwoSum(array: [Int], sum: Int) -> Bool {
    
    if array.count == 0 { return false }
    
    for i in 0..<array.count {
        
        for j in 0..<array.count where j != i {
            
            if array[j] + array[i] == sum {
                print("True: \(array[i]) + \(array[j])")
                return true
            } else {
                print("False: \(array[i]) + \(array[j])")
            }
        }
    }
    
    return false
}

bruteForceTwoSum(array: numbers, sum: 14)



let numbers2 = [1, 3, 6, 7, 7, 12, 14]
// 2. Binary Search for compliment (because it's sorted) - n log n

func twoSumBinarySearch(array: [Int], sum: Int) -> Bool {
    
    if array.count == 0 { return false }
    
    for i in 0..<array.count {
        
        let compliment = sum - array[i]
        
        var tempArray = array
        tempArray.remove(at: i)
        
        let hasCompliment = binarySearch(array: tempArray, key: compliment)
        print("num: \(array[i]) - \(hasCompliment)")
        
        if hasCompliment == true {
            print("true - num: \(array[i]), compliment: \(compliment)")
            return true
        }
    }
    
    return false
}

//twoSumBinarySearch(array: numbers2, sum: 4)


let numbers3 = [1, 3, 6, 7, 7, 12, 14]
// 3. Move pointer from either end - linear

func twoSumPointers(array: [Int], sum: Int) -> Bool {
    
    var lowIndex = 0
    var highIndex = array.count - 1
    
    while lowIndex < highIndex {
        
        let sumOfItems = array[lowIndex] + array[highIndex]
        
        if sumOfItems == sum {
            print("Sum of \(array[lowIndex]) and \(array[highIndex]) = \(sum)")
            return true
            
        } else if sumOfItems < sum {
            lowIndex += 1
            
        } else if sumOfItems > sum {
            highIndex -= 1
        }
    }
    
    print("Pointers have crossed")
    return false
}

//twoSumPointers(array: numbers3, sum: 19)





// Bonus solution submitted by subscriber Ben Cleary using dictionary lookup.

func twosum(array: [Int], sum: Int) -> Bool {
    
    var lookup = [Int: Int]()
    print("Checking array for sum")
    
    for (i, num) in array.enumerated() {
    
        if lookup.keys.contains((sum - num)) {
            print("Bammie Wham!")
            return true
        }
        lookup[num] = i
    }
    
    return false
}

//var x = twosum(array: numbers, sum: 26)





// Binary Search Helper Method
func binarySearch(array: [Int], key: Int) -> Bool {
    
    if array.count == 0 { return false }
    
    let minIndex: Int = 0
    let maxIndex: Int = array.count - 1
    let midIndex: Int = maxIndex / 2
    
    if key > array[maxIndex] || key < array[minIndex] {
        return false
    }
    
    let midValue = array[midIndex]
    
    if key > midValue {
        let slice: [Int] = Array(array[midIndex + 1...maxIndex])
        return binarySearch(array: slice, key: key)
    }
    
    if key < midValue {
        let slice: [Int] = Array(array[minIndex...midIndex - 1])
        return binarySearch(array: slice, key: key)
    }
    
    if key == midValue {
        return true
    }
    
    return false
}



