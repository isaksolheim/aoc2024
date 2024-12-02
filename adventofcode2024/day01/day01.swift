import Foundation

func day01() {
    let fileName = "day01.txt"
    let currentPath = FileManager.default.currentDirectoryPath
    let filePath = "\(currentPath)/\(fileName)"

    do {
        let content = try String(contentsOfFile: filePath, encoding: .utf8)
        let lines = content.components(separatedBy: .newlines)
        let dataPoints = lines.filter { !$0.isEmpty }

        var left = dataPoints.map { Int($0.split(separator: "   ").first!)! }.sorted()
        var right = dataPoints.map { Int($0.split(separator: "   ").last!)! }.sorted()

        var distances: [Int] = []
        var similarityScore = 0

        for (index, num) in left.enumerated() {
            distances.append(abs(num - right[index]))

            for secondNum in right {
                if num == secondNum {
                    similarityScore += num
                }
            }
        }

        print(distances.reduce(0, +))
        print(similarityScore)
    } catch {
        print("error: \(error.localizedDescription)")
    }
}
