//
//  User.swift
//  PokeMaster
//
//  Created by Vinnie Liu on 23/5/2022.
//  Copyright © 2022 Vinnie Pty Ltd. All rights reserved.
//

import Foundation

struct User: Codable {
  var email: String
  var favoritePokemonIDs: Set<Int>
  
  func isFavoritePokemon(id: Int) -> Bool {
    favoritePokemonIDs.contains(id)
  }
}
