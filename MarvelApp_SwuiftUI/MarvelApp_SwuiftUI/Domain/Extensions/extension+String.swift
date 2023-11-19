//
//  extension+String.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 19/11/23.
//

import Foundation

extension String {
    var securePath: String {
        self.replacingOccurrences(of: "http", with: "https")
    }
}
