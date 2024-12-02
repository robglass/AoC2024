import Foundation

// AoC2024: https://adventofcode.com/2024/day/1

func readInput(from fileName: String) throws -> String {
    guard let resourceURL = Bundle.module.url(forResource: fileName, withExtension: nil) else {
        throw DayO1Error.malformedInput
    }
    return try String(contentsOf: resourceURL, encoding: .utf8)
}

func parseCSV(input: String) -> ([Int], [Int]) {
    var column1: [Int] = []
    var column2: [Int] = []

    let lines = input.split(separator: "\n")
    for line in lines {
        let columns = line.split(separator: " ", omittingEmptySubsequences: true)
        if columns.count == 2,
           let value1 = Int(columns[0]),
           let value2 = Int(columns[1])
        {
            column1.append(value1)
            column2.append(value2)
        }
    }
    return (column1, column2)
}

func calulateDistance(column1: [Int], column2: [Int]) throws -> Int {
    if column1.count != column2.count {
        throw DayO1Error.mismatchedColumnCount
    }

    // sort least to greatest
    let sortedColumn1 = column1.sorted()
    let sortedColumn2 = column2.sorted()

    // for each row, what is the difference of the two values
    var totalDifference = 0
    for idx in 0 ..< column1.count {
        let difference = abs(sortedColumn1[idx] - sortedColumn2[idx])
        totalDifference += difference
    }

    return totalDifference
}

func calculateSimilarity(column1: [Int], column2: [Int]) throws -> Int {
    if column1.count != column2.count {
        throw DayO1Error.mismatchedColumnCount
    }

    var totalSimilarity = 0
    for idx in 0 ..< column1.count {
        let value = column1[idx]
        let similarity = column2.filter { $0 == value }.count
        totalSimilarity += value * similarity
    }

    return totalSimilarity
}

enum DayO1Error: Error {
    case mismatchedColumnCount
    case malformedInput
}

func solveDistance() throws -> Int {
    let input = try readInput(from: "input.txt")
    let (column1, column2) = parseCSV(input: input)
    return try calulateDistance(column1: column1, column2: column2)
}

func solveSimilarity() throws -> Int {
    let input = try readInput(from: "input.txt")
    let (column1, column2) = parseCSV(input: input)
    return try calculateSimilarity(column1: column1, column2: column2)
}
