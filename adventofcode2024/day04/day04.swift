import Foundation

func day04() {
    let fileName = "day04.txt"
    let currentPath = FileManager.default.currentDirectoryPath
    let filePath = "\(currentPath)/\(fileName)"

    do {
        let content = try String(contentsOfFile: filePath, encoding: .utf8)
        let lines = content.components(separatedBy: .newlines).filter { !$0.isEmpty }

        var total = 0

        for line in lines {
            total += line.numberOfOccurrencesOf(string: "XMAS")
            total += line.numberOfOccurrencesOf(string: "SAMX")
        }

        print("horizontal: \(total)")
        let rows = lines.count
        let cols = lines[0].count

        for col in 0 ..< cols {
            var vertical = ""
            for row in 0 ..< rows {
                vertical += lines[row][col]
            }
            total += vertical.numberOfOccurrencesOf(string: "XMAS")
            total += vertical.numberOfOccurrencesOf(string: "SAMX")
        }

        print("horizontal + vertical: \(total)")

        for start in 0 ..< (rows + cols - 1) {
            var diagonal = ""

            let startRow = max(0, rows - 1 - start)
            let startCol = max(0, start - (rows - 1))

            var row = startRow
            var col = startCol
            while row < rows, col < cols {
                diagonal += lines[row][col]
                row += 1
                col += 1
            }

            total += diagonal.numberOfOccurrencesOf(string: "XMAS")
            total += diagonal.numberOfOccurrencesOf(string: "SAMX")
        }

        for start in 0 ..< (rows + cols - 1) {
            var diagonal = ""

            let startRow = min(rows - 1, start)
            let startCol = max(0, start - (rows - 1))

            var row = startRow
            var col = startCol
            while row >= 0, col < cols {
                diagonal += lines[row][col]
                row -= 1
                col += 1
            }

            total += diagonal.numberOfOccurrencesOf(string: "XMAS")
            total += diagonal.numberOfOccurrencesOf(string: "SAMX")
        }

        print("horizontal + vertical + diagonal: \(total)")

    } catch {
        print("error: \(error.localizedDescription)")
    }
}

extension String {
    func numberOfOccurrencesOf(string: String) -> Int {
        return components(separatedBy: string).count - 1
    }
}

extension String {
    var length: Int {
        return count
    }

    subscript(i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript(r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
