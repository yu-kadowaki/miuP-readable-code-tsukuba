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
    let yourFilePath = "/recipe-data.txt"

    let contentOfFile = fileOpenWithPath(yourFilePath)
    println(contentOfFile)
}

func fileOpenWithPath(path: String) -> String {
    let textData = String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)
    return textData ?? "error"
}

main()