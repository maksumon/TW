//
//  ContactViewModel.swift
//  TW
//
//  Created by Mohammad Ashraful Kabir on 03/07/2022.
//

import Foundation

class ContactViewModel : ObservableObject {
    @Published var contacts = [Contact]()
    @Published var isLoading = false
    
    private var fileManager = FileManager.default
    private let mainUrl: URL = Bundle.main.url(forResource: "data", withExtension: "json")!
    
    init() {
        getData()
    }
    
    func getData() {
        if fileManager.fileExists(atPath: documentDirectoryJSONURL().path) {
            decodeData(fromURL: documentDirectoryJSONURL())
        } else {
            decodeData(fromURL: mainUrl)
        }
    }
    
    func documentDirectoryJSONURL() -> URL {
        do {
            let documentDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            return documentDirectory.appendingPathComponent("data.json")
        } catch {
            fatalError("Couldn't create URL")
        }
    }
    
    func decodeData(fromURL url: URL){
        do {
            let jsonData = try Data(contentsOf: url)
            let contacts = try JSONDecoder().decode([Contact].self, from: jsonData)
            self.contacts = contacts
        } catch {
            print(error)
            assertionFailure("Error decoding JSON")
        }
    }
    
    func writeToFile() {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let jsonData = try encoder.encode(contacts)
            try jsonData.write(to: documentDirectoryJSONURL())
        } catch {
            print(error)
        }
    }
}
