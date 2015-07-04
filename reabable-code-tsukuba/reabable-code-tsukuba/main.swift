//
//  main.swift
//  reabable-code-tsukuba
//
//  Created by IllyasvielVonEinzbern on 7/4/15.
//  Copyright (c) 2015 KazuyaMIURA. All rights reserved.
//

import Foundation

let userCount = 4

func main() {

    //TODO: input your file path
    let yourFilePath = "/Users/gates1de/develop/swift/miuP-readable-code-tsukuba/reabable-code-tsukuba/reabable-code-tsukuba/recipe-data.txt"

    let contentsOfFile = fileOpenWithPath(yourFilePath)
    let recipesArray = splitLine(contentsOfFile)
    let recipesDict = makeRecipesDicWithRecipesArray(recipesArray)
    
    var allUserName = Array<String>()
    var allUserRecipe = Array<Int>()

    for doCount in 0..<userCount {
        let (userName, recipeId) = getStdIn()
        allUserName.append(userName)
        allUserRecipe.append(recipeId)
    }
    
    printAllUserRecipe(allUserName, allUserRecipe, recipesDict)
    
}

func getUserByStdIn(input: NSFileHandle) -> String {
    let input = NSFileHandle.fileHandleWithStandardInput()
    let userStr = NSString(data: input.availableData, encoding: NSUTF8StringEncoding)
    let userStrScanner = NSScanner(string: userStr! as String)
    let user = userStrScanner.string
    
    return user
}

func getStdIn() -> (String, Int) {
    let input = NSFileHandle.fileHandleWithStandardInput()
    let str = NSString(data: input.availableData, encoding: NSUTF8StringEncoding)
    let scanner = NSScanner(string: str! as String)
    
    // ユーザー名の取得
    let user = getUserByStdIn(input)
    
    var recipeId: Int = 0
    scanner.scanInteger(&recipeId)
    return (user, recipeId)
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

func printAllUserRecipe(allUserName: Array<String>, allUserRecipe: Array<Int>, recipesDict: Dictionary<Int, String>) {
    println("---------------------------")
    
    for i in 0..<userCount {
        let userName = allUserName[i]
        let recipeId = allUserRecipe[i]
        
        println("ユーザー名: \(userName)")
        if recipeId == 0 {
            for (var i = 1; i <= count(recipesDict); i++) {
                println("\(i): " + recipesDict[i]!)
            }
        } else {
            println(recipesDict[recipeId] ?? "Not Found")
        }
        
        println("---------------------------")
    }
}

main()