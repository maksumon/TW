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
            List(viewModel.contacts!, id: \.self) { contact in
                if (contact.firstName != nil) {
                    NavigationLink(destination: ContactDetailView(contact: contact)) {
                        ContactItemView(contact: contact)
                    }
                }
            }
            .navigationTitle("Contacts")
            .refreshable {
                viewModel.getData()
            }
            .onAppear {
                viewModel.getData()
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
