//
//  ANSIColors.swift
//  OneSkyCLI
//
//  Created by Raj Sathianarayanan on 6/20/22.
//

import Foundation

enum ANSIColor: String {
    typealias This = ANSIColor

    case black = "\u{001B}[0;30m"
    case red = "\u{001B}[0;31m"
    case green = "\u{001B}[0;32m"
    case yellow = "\u{001B}[0;33m"
    case blue = "\u{001B}[0;34m"
    case magenta = "\u{001B}[0;35m"
    case cyan = "\u{001B}[0;36m"
    case white = "\u{001B}[0;37m"
    case `default` = "\u{001B}[0;0m"

    static var values: [This] {
        return [.black, .red, .green, .yellow, .blue, .magenta, .cyan, .white, .default]
    }

    static var names: [This: String] = [
        .black: "black",
        .red: "red",
        .green: "green",
        .yellow: "yellow",
        .blue: "blue",
        .magenta: "magenta",
        .cyan: "cyan",
        .white: "white",
        .default: "default",
    ]
    

    var name: String {
        return This.names[self] ?? "unknown"
    }

    static func + (lhs: This, rhs: String) -> String {
        return lhs.rawValue + rhs
    }

    static func + (lhs: String, rhs: This) -> String {
        return lhs + rhs.rawValue
    }
}
