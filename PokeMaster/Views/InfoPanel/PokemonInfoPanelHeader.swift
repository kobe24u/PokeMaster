//
//  PokemonInfoPanelHeader.swift
//  PokeMaster
//
//  Created by Vinnie Liu on 15/5/2022.
//  Copyright © 2022 Vinnie Pty Ltd. All rights reserved.
//

import SwiftUI

extension PokemonInfoPanel {
  struct Header: View {
    let viewModel: PokemonViewModel
    var body: some View {
      HStack(spacing: 18) {
        pokemonIcon
        nameSpecies
        verticalDivider
        VStack(spacing: 12) {
          bodyStatus
          typeInfo
        }
      }
    }
    
    var pokemonIcon: some View {
      Image("Pokemon-\(viewModel.id)")
        .resizable()
        .frame(width: 68, height: 68)
    }
    
    var nameSpecies: some View {
      VStack(spacing: 10) {
        VStack {
          Text(viewModel.name)
            .font(.system(size: 22, weight: .bold))
          Text(viewModel.nameEN)
            .font(.system(size: 13, weight: .bold))
        }
        .foregroundColor(viewModel.color)

        
        Text(viewModel.genus)
          .font(.system(size: 13, weight: .bold))
          .foregroundColor(.gray)
      }
    }
    
    var verticalDivider: some View {
      RoundedRectangle(cornerRadius: 3)
        .foregroundColor(.black)
        .frame(width: 1, height: 44)
        .opacity(0.1)
    }
    
    var bodyStatus: some View {
      VStack {
        HStack {
          Text("Height")
            .foregroundColor(.gray)
          Text(viewModel.height)
            .foregroundColor(viewModel.color)
        }
        HStack {
          Text("Weight")
            .foregroundColor(.gray)
          Text(viewModel.weight)
            .foregroundColor(viewModel.color)
        }
      }
    }
    
    var typeInfo: some View {
      HStack {
        ForEach(viewModel.types) { type in
          ZStack {
            RoundedRectangle(cornerRadius: 7)
              .fill(type.color)
              .frame(width: 36, height: 14)
            Text(type.name)
                .font(.system(size: 10))
                .foregroundColor(.white)
          }
        }
      }
    }
  }
}
