//
//  PokemonList.swift
//  PokeMaster
//
//  Created by Vinnie Liu on 14/5/2022.
//  Copyright © 2022 Vinnie Pty Ltd. All rights reserved.
//

import SwiftUI

struct PokemonList: View {
  @State var expandingIndex: Int?
  
    var body: some View {
      ScrollView {
        LazyVStack {
          ForEach(PokemonViewModel.all) { pokemon in
            PokemonInfoRow(
              viewModel: pokemon,
              expanded: self.expandingIndex == pokemon.id
            )
              .onTapGesture {
                withAnimation(
                  .spring(
                    response: 0.55,
                    dampingFraction: 0.425,
                    blendDuration: 0)
                ) {
                  if self.expandingIndex == pokemon.id {
                    self.expandingIndex = nil
                  } else {
                    self.expandingIndex = pokemon.id
                  }
                }
              }
          }
        }.padding(.top, 4)
      }
      .padding()
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
