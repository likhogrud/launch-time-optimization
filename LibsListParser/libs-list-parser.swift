#!/usr/bin/swift

import Foundation

// ----------------------- helpers ---------------------

func parseLibsListFile(atPath filePath: String) throws -> (application: Set<String>, system: Set<String>) {
    let fileContent = try String(contentsOfFile: filePath)
    let libsList = fileContent.components(separatedBy: CharacterSet.newlines)
        .filter { $0.hasPrefix("dyld: loaded: ") }
        .map { (str: String) -> String in
            let range = str.range(of: "dyld: loaded: ")!
            return str.substring(from: range.upperBound)
        }

    let applicationLibSign = "Bundle/Application/"

    return (
        application: Set<String>(libsList
            .filter { $0.contains(applicationLibSign) }
            .map { (str: String) -> String in
                let range = str.range(of: ".app/")!
                return str.substring(from: range.upperBound)
            }
        ),
        system: Set<String>(libsList.filter { !$0.contains(applicationLibSign) })
    )
}

func printSet(_ set: Set<String>) {
    if set.isEmpty {
        print("\tNo such")
    } else {
        print(Array(set).sorted().map { "\t" + $0}.joined(separator: "\n"))
    }
}

func printDiff(firstList: Set<String>, secondList: Set<String>, type: String) {

    let onlyInFirst = firstList.subtracting(secondList)
    let onlyInSecond = secondList.subtracting(firstList)
    let common = firstList.intersection(secondList)

    print("\(type) common for both (\(common.count)):")
    print()
    printSet(common)
    print()
    print("\(type) only in first (\(onlyInFirst.count)):")
    print()
    printSet(onlyInFirst)
    print()
    print("\(type) only in second (\(onlyInSecond.count)):")
    print()
    printSet(onlyInSecond)
    print()
}

// ----------------------- code ---------------------

let arguments = CommandLine.arguments

if arguments.count != 3 {
    print("Usage:")
    print("    $libs-list-parser.swift <first list> <second list>")
    exit(0)
}

let firstListFilePath = arguments[1]
let secondListFilePath = arguments[2]

let firstList: (application: Set<String>, system: Set<String>)
do {
    firstList = try parseLibsListFile(atPath: firstListFilePath)
} catch _ {
    print("Incorrect path for first list")
    exit(0)
}

let secondList: (application: Set<String>, system: Set<String>)
do {
    secondList = try parseLibsListFile(atPath: secondListFilePath)
} catch _ {
    print("Incorrect path for second list")
    exit(0)
}

print("\n---------------------- System Libs -----------------------\n")

printDiff(firstList: firstList.system, secondList: secondList.system,
          type: "System libs")

print("-------------------- Application Libs --------------------\n")

printDiff(firstList: firstList.application, secondList: secondList.application,
          type: "Application libs")

