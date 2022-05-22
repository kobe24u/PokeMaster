//
//  PokemonInfoPanel.swift
//  PokeMaster
//
//  Created by Vinnie Liu on 15/5/2022.
//  Copyright © 2022 Vinnie Pty Ltd. All rights reserved.
//

import SwiftUI

struct PokemonInfoPanel: View {
  let viewModel: PokemonViewModel
  @State var darkBlur = false
  
  var body: some View {
    VStack(spacing: 20) {
      Button {
        self.darkBlur.toggle()
      } label: {
        Text("Switch blur effect")
      }

      topIndicator
      Header(viewModel: viewModel)
      pokemonDescription
      Divider()
      AbilityList(
        viewModel: viewModel,
        abilityViewModels: abilities
      )
    }
    .padding(
      EdgeInsets(top: 12, leading: 30, bottom: 30, trailing: 30)
    )
    .blurBackground(style: darkBlur ? .systemMaterialDark : .systemMaterial)
    .cornerRadius(20)
    .fixedSize(horizontal: false, vertical: true)
  }
  
  var abilities: [AbilityViewModel] {
    AbilityViewModel.sample(pokemonID: viewModel.id)
  }
  
  var topIndicator: some View {
    RoundedRectangle(cornerRadius: 3)
      .frame(width: 40, height: 6)
      .opacity(0.2)
  }
  
  var pokemonDescription: some View {
    Text(viewModel.descriptionText)
      .font(.callout)
      .foregroundColor(.init(hex: 0x666666))
      .fixedSize(horizontal: false, vertical: true)
  }
}

struct PokemonInfoPanel_Previews: PreviewProvider {
    static var previews: some View {
      PokemonInfoPanel(viewModel: .sample(id: 1))
    }
}
