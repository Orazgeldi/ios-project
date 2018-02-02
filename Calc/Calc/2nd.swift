//
//  2nd.swift
//  Calc
//
//  Created by Orazkeldi Zhamalbekov on 30.01.18.
//  Copyright © 2018 Orazkeldi Zhamalbekov. All rights reserved.
//

import Foundation

class Austru {
private var firstState: [String] = ["eˣ", "10ˣ", "ln", "lg", "sin", "cos", "tan", "sinh", "cosh", "tanh"]
private var secondState: [String] = ["yˣ", "2ˣ", "log𝗒", "log₂", "sin⁻¹", "cos⁻¹", "tan⁻¹", "sinh⁻¹", "cosh⁻¹", "tanh⁻¹"]
private var state: Bool = true

var getState: [String?] {
    get {
        state = !state
        return state ? firstState : secondState
    }
}
}



