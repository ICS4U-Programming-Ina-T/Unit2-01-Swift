//
// ReverseTheString.swift
//
// Created by Ina Tolo
// Created on 2022-3-28
// Version 1.0
// Copyright (c) 2022 Ina Tolo. All rights reserved.
//
// The ReverseTheString program implements an application that
// reads a text file into the program, and uses recursion to
// reverse the strings, and place them in an output file.

import Foundation

// uses recursion to reverse a string
func reverse(stringValue: String) -> String {
    if stringValue == "" {
        return stringValue
    } else {
        return reverse(stringValue: String(Array(stringValue)[1...])) + String(Array(stringValue)[0])
    }
}

// declaring variables
let stringsLocation = "/home/runner/Unit2-01-Swift/input.txt"
let text = ""
var reversedStringsList: String = ""
var newStringUser: String = ""
var arrayToString: String = ""

print("The strings in the input file will be reversed.")
print()

// reads file with strings into an array
let stringsFile: String = try String(contentsOfFile: stringsLocation)
let stringsArrayFile: [String] = stringsFile.components(separatedBy: "\n")

// calls function and passes string at correct index
for loopCounter in 0..<stringsArrayFile.count {
    newStringUser = reverse(stringValue: stringsArrayFile[loopCounter])
    if loopCounter != stringsArrayFile.count - 1 {
        reversedStringsList.append(newStringUser + "\n")
    } else {
        reversedStringsList.append(newStringUser)
    }
}

// converts list of reversed strings to an array
let reversedStringsArray: [String] = reversedStringsList.components(separatedBy: "\n")

// writes the new reversed strings to the output file
try text.write(to: URL(fileURLWithPath: "/home/runner/Unit2-01-Swift/output.txt"),
    atomically: false, encoding: .utf8)

if let fileWriter = try? FileHandle(forUpdating:
    URL(fileURLWithPath: "/home/runner/Unit2-01-Swift/output.txt")) {
    // adds each string to the output file
    for stringFormat in 0..<reversedStringsArray.count {
        if stringFormat != reversedStringsArray.count - 1 {
            arrayToString = reversedStringsArray[stringFormat] + "\n"
        } else {
            arrayToString = reversedStringsArray[stringFormat]
        }
        fileWriter.seekToEndOfFile()
        fileWriter.write(arrayToString.data(using: .utf8)!)
    }
    fileWriter.closeFile()
}
print("Done reversing. Check the output file.")
