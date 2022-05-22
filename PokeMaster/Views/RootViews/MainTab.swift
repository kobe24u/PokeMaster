//
//  MainTab.swift
//  PokeMaster
//
//  Created by Vinnie Liu on 22/5/2022.
//  Copyright © 2022 Vinnie Pty Ltd. All rights reserved.
//

import SwiftUI

struct MainTab: View {
    var body: some View {
      TabView {
        PokemonRootView().tabItem {
          Image(systemName: "list.bullet.below.rectangle")
          Text("List")
        }
        
        SettingRootView().tabItem {
          Image(systemName: "gear")
          Text("Settings")
        }
      }
      .ignoresSafeArea()
    }
}

struct MainTab_Previews: PreviewProvider {
    static var previews: some View {
        MainTab()
    }
}
