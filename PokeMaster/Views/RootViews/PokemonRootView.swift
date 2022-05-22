//
//  PokemonRootView.swift
//  PokeMaster
//
//  Created by Vinnie Liu on 22/5/2022.
//  Copyright © 2022 Vinnie Pty Ltd. All rights reserved.
//

import SwiftUI

struct PokemonRootView: View {
  var body: some View {
    NavigationView {
      PokemonList().navigationBarTitle("Pokemon")
    }
  }
}
