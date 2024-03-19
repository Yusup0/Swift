//
//  main.swift
//  quest2
//
//  Created by Юсуп Оздоев on 27.12.2023.
//

import Foundation

extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound, range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
}

func Export(_ data: inout [String], _ dir: URL) {
    let filePath = dir
        .appendingPathComponent("export")
        .appendingPathExtension("txt")
    if (FileManager.default.createFile(atPath: filePath.path, contents: nil, attributes: nil)) {
        if let fileHandle = try? FileHandle(forWritingTo: filePath) {
            fileHandle.seekToEndOfFile()
            for block in data {
                fileHandle.write(Data(block.utf8))
            }
            fileHandle.closeFile()
        }
    } else {
        print("File not created.")
    }
}

func ParselLine(_ words: inout [String:Int], _ line: String) {
    let line = line.trimmingCharacters(in: .whitespacesAndNewlines)
    if line.isEmpty {
        return
    }
    let words_arr = line.split(separator: " ")
    for word in words_arr {
        words[String(word), default: 0] += 1
    }
}

func Analysis(_  words: inout [String:Int], _ dir: URL, _ tags: Set<String>) {
    let filePath = dir
        .appendingPathComponent("analysis")
        .appendingPathExtension("txt")
    if (FileManager.default.createFile(atPath: filePath.path, contents: nil, attributes: nil)) {
        if let fileHandle = try? FileHandle(forWritingTo: filePath) {
            fileHandle.seekToEndOfFile()
            fileHandle.write(Data("# Words\n".utf8))
            for (key, value) in words.sorted(by: {$0.value > $1.value}) {
                fileHandle.write(Data("\(key) - \(value)\n".utf8))
            }
            fileHandle.write(Data("\n# Matched tags\n".utf8))
            for i in tags.intersection(words.map{$0.key}) {
                fileHandle.write(Data("\(i)\n".utf8))
            }
            fileHandle.closeFile()
        }
    } else {
        print("File not created.")
    }
}

func ParserTags(_ dir: URL) -> Set<String> {
    let fileUrl = dir
        .appendingPathComponent("tags")
        .appendingPathExtension("txt")
    guard FileManager.default.fileExists(atPath: fileUrl.path) else {
        preconditionFailure("file expected at \(fileUrl.absoluteString) is missing")
    }
    guard let filePointer:UnsafeMutablePointer<FILE> = fopen(fileUrl.path,"r") else {
        preconditionFailure("Could not open file at \(fileUrl.absoluteString)")
    }
    var lineByteArrayPointer: UnsafeMutablePointer<CChar>? = nil
    var lineCap: Int = 0
    var bytesRead = getline(&lineByteArrayPointer, &lineCap, filePointer)
    var res = Set<String>()
    while (bytesRead > 0) {
        let lineAsString = String.init(cString:lineByteArrayPointer!)
        res.insert(lineAsString.trimmingCharacters(in: .whitespacesAndNewlines))
        bytesRead = getline(&lineByteArrayPointer, &lineCap, filePointer)
    }
    fclose(filePointer)
    lineByteArrayPointer?.deallocate()
    return res
}

func ParserResume(_ dir: URL) -> ([String], [String:Int]) {
    let fileUrl = dir
        .appendingPathComponent("resume")
        .appendingPathExtension("txt")
    guard FileManager.default.fileExists(atPath: fileUrl.path) else {
        preconditionFailure("file expected at \(fileUrl.absoluteString) is missing")
    }
    guard let filePointer:UnsafeMutablePointer<FILE> = fopen(fileUrl.path,"r") else {
        preconditionFailure("Could not open file at \(fileUrl.absoluteString)")
    }
    var lineByteArrayPointer: UnsafeMutablePointer<CChar>? = nil
    var lineCap: Int = 0
    var bytesRead = getline(&lineByteArrayPointer, &lineCap, filePointer)
    var data = [String]()
    var block = ""
    var words = [String:Int]()
    while (bytesRead > 0) {
        let lineAsString = String.init(cString:lineByteArrayPointer!)
        if (lineAsString[0] == "#" && lineAsString[1] != "#") {
            data.append(block)
            block = ""
        }
        ParselLine(&words, lineAsString)
        block += lineAsString
        bytesRead = getline(&lineByteArrayPointer, &lineCap, filePointer)
    }
    data.append(block)
    fclose(filePointer)
    lineByteArrayPointer?.deallocate()
    return (data, words)
}

func main() {
    let dir = FileManager.default.homeDirectoryForCurrentUser
        .appendingPathComponent("Desktop")
        .appendingPathComponent("swift")
        .appendingPathComponent("Swift_Bootcamp.Day02-1")
        .appendingPathComponent("src")
        .appendingPathComponent("quest2")
    
    var (data,words) = ParserResume(dir)
    Export(&data, dir)
    Analysis(&words, dir, ParserTags(dir))
}

main()
