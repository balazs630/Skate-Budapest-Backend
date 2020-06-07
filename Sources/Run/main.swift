//
//  main.swift
//  App
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import App
import Vapor

var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)
let app = Application(env)
defer { app.shutdown() }

try configure(app)
try app.run()
