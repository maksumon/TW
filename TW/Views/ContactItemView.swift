//
//  ContactItemView.swift
//  TW
//
//  Created by Mohammad Ashraful Kabir on 03/07/2022.
//

import SwiftUI

struct ContactItemView : View {
    let contact: Contact

    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "")
                .frame(width: 25, height: 25)
                .padding()
                .background(Color.accentColor)
                .clipShape(Circle())
            Text("\(contact.firstName!) \(contact.lastName!)")
        }
    }
}
