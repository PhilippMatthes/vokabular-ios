//
//  FileManagerExtension.swift
//  vokabeltrainer
//
//  Created by Philipp Matthes on 26/5/18.
//  Copyright © 2018 Philipp Matthes. All rights reserved.
//

import Foundation

extension FileManager {
    static func printAvailableFiles() {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        for url in urls {
            do {
                let fileURLs = try fileManager.contentsOfDirectory(at: url, includingPropertiesForKeys: nil)
                print("Dir contents for \(url.path): \(fileURLs)")
            } catch {
                print("Error while enumerating files \(url.path): \(error.localizedDescription)")
            }
        }
    }
}
