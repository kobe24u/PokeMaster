//
//  PokemonInfoPanelAbilityList.swift
//  PokeMaster
//
//  Created by Vinnie Liu on 15/5/2022.
//  Copyright © 2022 Vinnie Pty Ltd. All rights reserved.
//

import SwiftUI

extension PokemonInfoPanel {
  struct AbilityList: View {
    let viewModel: PokemonViewModel
    let abilityViewModels: [AbilityViewModel]?
    
    var body: some View {
      VStack(alignment: .leading, spacing: 12) {
        Text("Ability")
          .font(.headline)
          .fontWeight(.bold)
        if abilityViewModels != nil {
          ForEach(abilityViewModels!) { ability in
            Text(ability.name)
              .font(.subheadline)
              .foregroundColor(viewModel.color)
            Text(ability.descriptionText)
              .font(.footnote)
              .foregroundColor(.init(hex: 0xAAAAAA))
              .fixedSize(horizontal: false, vertical: true)
          }
        }
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    }
  }
}
