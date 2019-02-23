//
//  databases.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2019. 02. 11..
//

import Vapor
import FluentSQLite
import Console

struct Constant {
    static let sqliteDatabaseFilePath = "Resources/skate-budapest.sqlite"
    static let insertBaseDataScriptFilePath = "Resources/insert-base-data.sh"
}

public func populateDatabaseWithBaseData() {
    let shellScriptFilePath = DirectoryConfig.detect().workDir + Constant.insertBaseDataScriptFilePath
    let output = Util.runShellScript("sh \(shellScriptFilePath)")

    let terminal = Terminal()
    terminal.print(output)
}

public func registerSQLiteDatabase(to services: inout Services) throws {
    var databasesConfig = DatabasesConfig()
    let databaseFilePath = DirectoryConfig.detect().workDir + Constant.sqliteDatabaseFilePath

    let sqliteDatabase = try SQLiteDatabase(storage: .file(path: databaseFilePath))
    databasesConfig.add(database: sqliteDatabase, as: .sqlite)
    services.register(databasesConfig)
}

public func registerFluentSQLiteProvider(to services: inout Services) throws {
    try services.register(FluentSQLiteProvider())
}
