import Foundation



public class Day3 {
    public static func readFile(_ data: String) {
        var alphabetValue = zip("abcdefghijklmnopqrstuvwxyz", 1...26).reduce(into: [:]) { $0[$1.0] = $1.1 }
        let caps = zip("ABCDEFGHIJKLMNOPQRSTUVWXYZ", 27...52).reduce(into: [:]) { $0[$1.0] = $1.1 }
        caps.forEach { alphabetValue[$0] = $1 }
        var found = [Character]()
        data.split(separator: "\n").forEach { rucksack in
            let rucksacks = Array(rucksack)
            for i in 0..<rucksacks.count/2 {
                for j in rucksacks.count/2..<rucksacks.count {
                    if rucksacks[i] == rucksacks[j] {
                        found.append(rucksacks[i])
                        return
                    }
                }
            }
        }
        let sum = found.map { alphabetValue[$0]!  }.reduce(0, +)
        print("This is sum: \(sum)")
    }
}


