import Foundation

func day02() {
    let fileName = "day02.txt"
    let currentPath = FileManager.default.currentDirectoryPath
    let filePath = "\(currentPath)/\(fileName)"

    do {
        let content = try String(contentsOfFile: filePath, encoding: .utf8)
        let lines = content.components(separatedBy: .newlines)
        let dataPoints = lines.filter { !$0.isEmpty }

        print(dataPoints)
    } catch {
        print("error: \(error.localizedDescription)")
    }
}
