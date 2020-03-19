//
//  String+Random.swift
//  App
//
//  Created by Horváth Balázs on 2020. 03. 19..
//

extension String {
    static func random(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyz"
        let randomString = (0..<length).compactMap { _ in
            letters.randomElement()
        }

        return String(randomString)
    }
}
