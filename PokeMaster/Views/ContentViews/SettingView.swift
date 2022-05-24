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
    .alert(item: settingsBinding.loginError) { error in
      Alert(title: Text(error.localizedDescription))
    }
  }
}

// Account section
extension SettingView {
  var accountSection: some View {
    Section(header: Text("Account")) {
      if settings.loginUser == nil {
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
        
        if settings.isLoading {
          ProgressView()
        } else {
          Button(settings.accountBehavior.text) {
            self.store.dispatch(
              action: .login(email: self.settings.email, password: self.settings.password)
            )
          }
        }
      } else {
        Text(settings.loginUser?.email ?? "")
        Button("Logout") {
          print("Logout")
        }
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
