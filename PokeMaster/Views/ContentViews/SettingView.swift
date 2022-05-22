//
//  SettingView.swift
//  PokeMaster
//
//  Created by Vinnie Liu on 15/5/2022.
//  Copyright © 2022 Vinnie Pty Ltd. All rights reserved.
//

import SwiftUI

struct SettingView: View {
  @EnvironmentObject var store: Store
  var settingsBinding: Binding<AppState.Settings> {
    $store.appState.settings
  }
  
  var settings: AppState.Settings {
    store.appState.settings
  }
  
  var body: some View {
    Form {
      accountSection
      optionSection
      actionSection
    }
  }
}

// Account section
extension SettingView {
  var accountSection: some View {
    Section(header: Text("Account")) {
      Picker(
        selection: settingsBinding.accountBehavior,
        label: Text("")
      ) {
        ForEach(
          AppState.Settings.AccountBehavior.allCases,
          id: \.self
        ) {
          Text($0.text)
        }
      }
      .pickerStyle(.segmented)
      
      TextField("Email: ", text: settingsBinding.email)
      SecureField("Password: ", text: settingsBinding.password)
      
      if settings.accountBehavior == .register {
        SecureField("Verify Password", text: settingsBinding.verifyPassword)
      }
      
      Button(settings.accountBehavior.text) {
        print("Signin/register")
      }
    }
  }
}

// Option section
extension SettingView {
  var optionSection: some View {
    Section(header: Text("Options")) {
      Toggle(isOn: settingsBinding.showEnglishName) {
        Text("Show English Name")
      }
      
      Picker(
        selection: settingsBinding.sorting,
        label: Text("Sort by")
      ) {
        ForEach(
          AppState.Settings.Sorting.allCases,
          id: \.self
        ) {
          Text($0.text)
        }
      }
      
      Toggle(isOn: settingsBinding.showFavoriteOnly) {
        Text("Show favorites only")
      }
    }
  }
}

// Action section
extension SettingView {
  var actionSection: some View {
    Section {
      Button {
        print("clear")
      } label: {
        Text("Clear cache")
          .foregroundColor(.red)
      }
    }
  }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
      let store = Store()
      store.appState.settings.sorting = .favorite
      return SettingView().environmentObject(store)
    }
}
