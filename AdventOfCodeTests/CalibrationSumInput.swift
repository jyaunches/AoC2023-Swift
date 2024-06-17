//
//  CalibrationSumInput.swift
//  AdventOfCodeTests
//
//  Created by Julietta Yaunches on 6/17/24.
//

import Foundation

class CalibrationSumInput {
    
    func returnInput() -> [String]{
        if let filePath = Bundle(for: AdventOfCodeTests.self).path(forResource: "input", ofType: "txt") {
            let lines = readFileToArray(filePath: filePath)
            return lines != nil ? lines! : []
        }
        return []
    }
    
    private func readFileToArray(filePath: String) -> [String]? {
        do {
            // Read the file content as a single string
            let content = try String(contentsOfFile: filePath, encoding: .utf8)
            
            // Split the content into an array of strings, separated by newlines
            let lines = content.components(separatedBy: .newlines)
            
            return lines
        } catch {
            // Handle any errors that occur during file reading
            print("Error reading file: \(error.localizedDescription)")
            return nil
        }
    }
    
}
