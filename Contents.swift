import UIKit

var greeting = "Hello, playground"

Float(0)

func readFile() {
    
    if let path = Bundle.main.path(forResource: "TextFile", ofType: "txt") {
        do {
            let data = try! String(contentsOfFile: path, encoding: .utf8)
            let sections = data.split(separator: "\n")
            var intersect = [Int]()
            let pair = sections.forEach { section in
                let pairs = section.split(separator: ",")
                let first = pairs[0].split(separator: "-")
                let second = pairs[1].split(separator: "-")

                let firstLower = Int(first[0])!
                let firstUpper = Int(first[1])!
                let secondLower = Int(second[0])!
                let secondUpper = Int(second[1])!


                let lowerCondition = (firstLower >= secondLower && firstUpper <= secondUpper) || firstLower - firstUpper == 0
                let upperCondition = (secondLower >= firstLower && secondUpper <= firstUpper) || secondLower - secondUpper == 0

                let condition = lowerCondition || upperCondition
                if condition {
                    intersect.append(1)
                    print("these are the pairs: \(pairs)")
                }
            }
            print("these are the pairs: \(intersect.count)")

        }
    }
}
readFile()
