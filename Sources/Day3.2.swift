import Foundation

public class Day3S {

    public static func getRuck(_ input: String) {
        let rucksacks = input.split(separator: "\n")
        var j = 0
        var found = [Character]()
        var alphabetValue = zip("abcdefghijklmnopqrstuvwxyz", 1...26).reduce(into: [:]) { $0[$1.0] = $1.1 }
        let caps = zip("ABCDEFGHIJKLMNOPQRSTUVWXYZ", 27...52).reduce(into: [:]) { $0[$1.0] = $1.1 }
        caps.forEach { alphabetValue[$0] = $1 }
        while j < rucksacks.count - 1 {
            print("This is j: \(j)")
            let set1 = Set(rucksacks[j])
            let set2 = Set(rucksacks[j + 1])
            let set3 = Set(rucksacks[j + 2])
            let intersection1 =  set1.intersection(set2)
            found.append(contentsOf: intersection1.intersection(set3))
            j += 3
        }
        let sum = found.map { alphabetValue[$0]! }.reduce(0, +)
        print("This is sum: \(sum)")
        
    }
}

