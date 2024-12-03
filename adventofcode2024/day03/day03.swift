import Foundation

func day03() {
    let fileName = "day03.txt"
    let currentPath = FileManager.default.currentDirectoryPath
    let filePath = "\(currentPath)/\(fileName)"

    do {
        let content = try String(contentsOfFile: filePath, encoding: .utf8)
        let lines = content.components(separatedBy: .newlines).filter { !$0.isEmpty }

        var total = 0
        for line in lines {
            let parts = line.split(separator: ",")

            var lastValue = String(parts[1])
            lastValue.removeLast()

            total += Int(String(parts[0]).deletingPrefix("mul("))! * Int(lastValue)!
        }

        print(total)
    } catch {
        print("error: \(error.localizedDescription)")
    }
}

extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
}
