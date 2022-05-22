//
//  Ability.swift
//  PokeMaster
//
//  Created by Vinnie Liu on 2019/08/09.
//  Copyright © 2022 Vinnie Pty Ltd. All rights reserved.
//

import Foundation

struct Ability: Codable {
    struct Name: Codable, LanguageTextEntry {
        let language: Language
        let name: String

        var text: String { name }
    }

    struct FlavorTextEntry: Codable, LanguageTextEntry {
        let language: Language
        let flavorText: String

        var text: String { flavorText }
    }

    let id: Int

    let names: [Name]
    let flavorTextEntries: [FlavorTextEntry]
}
