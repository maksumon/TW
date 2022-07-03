//
//  Contact.swift
//  TW
//
//  Created by Mohammad Ashraful Kabir on 03/07/2022.
//

import Foundation

struct Contact: Codable {
    let id, firstName, lastName, email, phone: String?

    enum CodingKeys: String, CodingKey {
        case id, firstName, lastName, email, phone
    }
}
