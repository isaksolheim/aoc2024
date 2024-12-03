import Foundation

func day01() {
    let fileName = "day01.txt"
    let currentPath = FileManager.default.currentDirectoryPath
    let filePath = "\(currentPath)/\(fileName)"

    do {
        let content = try String(contentsOfFile: filePath, encoding: .utf8)
        let lines = content.components(separatedBy: .newlines)
        let dataPoints = lines.filter { !$0.isEmpty }

        let left = dataPoints.map { Int($0.split(separator: "   ").first!)! }.sorted()
        let right = dataPoints.map { Int($0.split(separator: "   ").last!)! }.sorted()

        var distances: [Int] = []
        var similarityScore = 0

        for (l, r) in zip(left, right) {
            distances.append(abs(l - r))

            for secondNum in right where l == secondNum {
                similarityScore += l
            }
        }

        print("part 1: \(distances.reduce(0, +))")
        print("part 2: \(similarityScore)")
    } catch {
        print("error: \(error.localizedDescription)")
    }
}
