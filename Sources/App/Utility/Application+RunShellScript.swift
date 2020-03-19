//
//  Application+RunShellScript.swift
//  App
//
//  Created by Horváth Balázs on 2019. 02. 19..
//

import Vapor

extension Application {
    @discardableResult
    static func runShellScript(_ arguments: String) -> String {
        var output = ""
        let task = Process()
        task.launchPath = "/bin/sh"
        task.arguments = ["-c", arguments]

        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        if let out = String(data: data, encoding: .utf8) {
            output = out as String
        }
        task.waitUntilExit()

        return output
    }
}
