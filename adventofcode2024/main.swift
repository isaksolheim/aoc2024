import Foundation

let fileName = "data.txt"
let currentPath = FileManager.default.currentDirectoryPath
let filePath = "\(currentPath)/\(fileName)"

do {
    let content = try String(contentsOfFile: filePath, encoding: .utf8)
    let lines = content.components(separatedBy: .newlines)
    let dataPoints = lines.filter { !$0.isEmpty }

    var left = dataPoints.map { Int($0.split(separator: "   ").first!)! }
    var right = dataPoints.map { Int($0.split(separator: "   ").last!)! }

    left.sort()
    right.sort()

    var distances: [Int] = []

    for (index, num) in left.enumerated() {
        distances.append(abs(num - right[index]))
    }

    print(distances.reduce(0, +))
} catch {
    print("error: \(error.localizedDescription)")
}
