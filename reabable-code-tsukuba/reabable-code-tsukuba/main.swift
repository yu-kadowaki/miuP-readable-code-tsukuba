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
    let yourFilePath = "recipe-data.txt"

    let contentsOfFile = fileOpenWithPath(yourFilePath)
    let recipesArray = splitLine(contentsOfFile)

    for recipe in recipesArray {
        println(recipe)
    }

}

func fileOpenWithPath(path: String) -> String {
    let textData = String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)
    return textData ?? "error"
}

func splitLine(str: String) -> [String] {
    return split(str) { contains("\n", $0) }
}

main()