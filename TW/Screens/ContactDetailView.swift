//
//  ContactDetailView.swift
//  TW
//
//  Created by Mohammad Ashraful Kabir on 03/07/2022.
//

import SwiftUI

struct ContactDetailView: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject var viewModel = ContactViewModel()
    
    private var contact: Contact?
    @State private var firstName:String
    @State private var lastName:String
    @State private var email:String
    @State private var phone:String
    @State private var presentAlert = false
    
    init(contact: Contact) {
        self.contact = contact
        
        _firstName = State<String>(initialValue: contact.firstName ?? "")
        _lastName = State<String>(initialValue: contact.lastName ?? "")
        _email = State<String>(initialValue: contact.email ?? "")
        _phone = State<String>(initialValue: contact.phone ?? "")
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "")
                .frame(width: 50, height: 50)
                .padding()
                .background(Color.accentColor)
                .clipShape(Circle())
            List {
                Section(header: Text("Main Information").font(.system(size: 14, weight: .bold, design: .default))) {
                    HStack(alignment: .center) {
                        Text("First Name")
                        TextField(
                            "Enter First Name",
                            text: $firstName
                        ).padding()
                    }
                    HStack(alignment: .center) {
                        Text("Last Name")
                        TextField(
                            "Enter Last Name",
                            text: $lastName
                        ).padding()
                    }
                }
                Section(header: Text("Sub Information").font(.system(size: 14, weight: .bold, design: .default))) {
                    HStack(alignment: .center) {
                        Text("Email")
                        TextField(
                            "Enter Email",
                            text: $email
                        ).padding()
                    }
                    HStack(alignment: .center) {
                        Text("Phone")
                        TextField(
                            "Enter Phone",
                            text: $phone
                        ).padding()
                    }
                }
            }
        }
        .navigationTitle("Contacts")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: (
                Button(
                    action: {
                        withAnimation {
                            self.presentation.wrappedValue.dismiss()
                        }
                    }
                ) {
                    Text("Cancel")
                }
            ),
            trailing: (
                Button(
                    action: {
                        withAnimation {
                            if let i = viewModel.contacts!.firstIndex(of: self.contact!) {
                                viewModel.contacts![i].firstName = self.firstName
                                viewModel.contacts![i].lastName = self.lastName
                                viewModel.contacts![i].email = self.email
                                viewModel.contacts![i].phone = self.phone
                            }
                            
                            viewModel.writeToFile()
                            self.presentAlert = true
                        }
                    }
                ) {
                    Text("Save")
                }
            )
        ).alert("Success", isPresented: $presentAlert, actions: {}, message: {
            Text("Saved successfully")
        })
    }
}

