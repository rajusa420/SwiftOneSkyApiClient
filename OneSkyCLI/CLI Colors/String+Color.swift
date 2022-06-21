//
//  String+Color.swift
//  OneSkyCLI
//
//  Created by Raj Sathianarayanan on 6/20/22.
//

import Foundation

extension String {
    func colored(_ color: ANSIColor) -> String {
        return color + self + .default
    }

    var blackColored: String {
        return colored(.black)
    }

    var redColored: String {
        return colored(.red)
    }

    var greenColored: String {
        return colored(.green)
    }

    var yellowColored: String {
        return colored(.yellow)
    }

    var blueColored: String {
        return colored(.blue)
    }

    var magentaColored: String {
        return colored(.magenta)
    }

    var cyanColored: String {
        return colored(.cyan)
    }

    var whiteColored: String {
        return colored(.white)
    }
}
