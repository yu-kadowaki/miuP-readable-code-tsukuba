//
//  main.swift
//  reabable-code-tsukuba
//
//  Created by IllyasvielVonEinzbern on 7/4/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import Foundation

func main() {

    //TODO: input your file path
    let yourFilePath = "/Users/Illya/develop/miuP-readable-code-tsukuba/reabable-code-tsukuba/reabable-code-tsukuba/recipe-data.txt"

    let contentsOfFile = fileOpenWithPath(yourFilePath)
    let recipesArray = splitLine(contentsOfFile)
    let recipesDict = makeRecipesDicWithRecipesArray(recipesArray)

    let input = getIntByStdIn()
    if input == 0 {
        for (var i = 1; i <= count(recipesDict); i++) {
            println("\(i): " + recipesDict[i]!)
        }
    } else {
        println(recipesDict[input] ?? "Not Found")
    }
}

func getIntByStdIn() -> Int {
    let input = NSFileHandle.fileHandleWithStandardInput()
    let str = NSString(data: input.availableData, encoding: NSUTF8StringEncoding)
    let scanner = NSScanner(string: str! as String)
    var value: Int = 0
    let result = scanner.scanInteger(&value)
    return value
}

func fileOpenWithPath(path: String) -> String {
    let textData = String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)
    return textData ?? "error"
}

func splitLine(str: String) -> [String] {
    return split(str) { contains("\n", $0) }
}

func makeRecipesDicWithRecipesArray(recipesArray: [String]) -> [Int: String] {
    var recipesDict: [Int: String] = [:]
    for (var i = 0; i < count(recipesArray); i++) {
        let id = i + 1
        recipesDict[id] = recipesArray[i]
    }
    return recipesDict
}

main()