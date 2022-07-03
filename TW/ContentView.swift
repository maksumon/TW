//
//  ContentView.swift
//  TW
//
//  Created by Mohammad Ashraful Kabir on 03/07/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContactViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.contacts, id: \.self) { contact in
                ContactItemView(contact: contact)
            }
            .navigationTitle("Contacts")
            .refreshable {
                viewModel.getData()
            }
            .onTapGesture {
                    print("touched item \(item)")
            }
            .navigationBarItems(
                leading: (
                    Button(
                        action: {
                            withAnimation {
                                print("Search button pressed")
                            }
                        }
                    ) {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                    }
                ),
                trailing: (
                    Button(
                        action: {
                            withAnimation {
                                print("Plus button pressed")
                            }
                        }
                    ) {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                )
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
