//
//  PokemonInfoRow.swift
//  PokeMaster
//
//  Created by Vinnie Liu on 14/5/2022.
//  Copyright © 2022 Vinnie Pty Ltd. All rights reserved.
//

import SwiftUI

struct PokemonInfoRow: View {
  let viewModel: PokemonViewModel
  var expanded: Bool
  
  var body: some View {
    VStack {
      infoRowHeader
      Spacer()
      infoRowFooter
    }
    .frame(height: expanded ? 120 : 80)
    .padding(.horizontal, 16)
    .background(
      ZStack {
        RoundedRectangle(cornerRadius: 20).stroke(viewModel.color, style: StrokeStyle(lineWidth: 4))
        RoundedRectangle(cornerRadius: 20)
          .fill(
            LinearGradient(gradient: .init(colors: [.white, viewModel.color]), startPoint: .leading, endPoint: .trailing)
          )
      }
    )
    .padding(.horizontal)
  }
}

// Header
extension PokemonInfoRow {
  var infoRowHeader: some View {
    HStack {
        Image("Pokemon-\(viewModel.id)")
          .resizable()
          .frame(width: 50, height: 50)
          .aspectRatio(contentMode: .fit)
          .shadow(radius: 4)
        Spacer()
        VStack {
            Text(viewModel.name)
            .font(.title)
            .fontWeight(.black)
            
            Text(viewModel.nameEN)
            .font(.subheadline)
        }
        .foregroundColor(.white)
    }
    .padding(.top, 12)
  }
}

// Footer
extension PokemonInfoRow {
  var infoRowFooter: some View {
    HStack(spacing: expanded ? 20 : -30) {
      Spacer()
      Button {
        print("fav")
      } label: {
        Image(systemName: "star")
          .modifier(ToolButtonModifier())
      }

      Button {
        print("panel")
      } label: {
        Image(systemName: "chart.bar")
          .modifier(ToolButtonModifier())
      }
      
      Button {
        print("web")
      } label: {
        Image(systemName: "info.circle")
          .modifier(ToolButtonModifier())
      }
    }
    .padding(.bottom, 12)
    .opacity(expanded ? 1.0 : 0.0)
    .frame(height: expanded ? .infinity : 0)
  }
}


struct preview: PreviewProvider {
    static var previews: some View {
      VStack {
        PokemonInfoRow(viewModel: .sample(id: 1), expanded: false)
        PokemonInfoRow(viewModel: .sample(id: 21), expanded: true)
        PokemonInfoRow(viewModel: .sample(id: 25), expanded: false)
      }
    }
}

struct ToolButtonModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 25))
      .foregroundColor(.white)
      .frame(width: 30, height: 30)
  }
}
