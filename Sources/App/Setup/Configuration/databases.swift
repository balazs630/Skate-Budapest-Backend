//
//  databases.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2019. 02. 11..
//

import Vapor
import FluentSQLite

private var databasePath: String {
    let directory = DirectoryConfig.detect()
    let relativePath = "Resources/skate-budapest.db"
    return directory.workDir + relativePath
}

public func registerSQLiteDatabase(to services: inout Services) throws {
    var databasesConfig = DatabasesConfig()
    let sqliteDatabase = try SQLiteDatabase(storage: .file(path: databasePath))
    databasesConfig.add(database: sqliteDatabase, as: .sqlite)
    services.register(databasesConfig)
}

public func registerFluentSQLiteProvider(to services: inout Services) throws {
    try services.register(FluentSQLiteProvider())
}
