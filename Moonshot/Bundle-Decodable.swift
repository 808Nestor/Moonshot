//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Nestor Trillo on 3/25/21.
//

import Foundation

extension Bundle {
	func decode<T: Codable>(_ file: String) -> T {
		guard let url = self.url(forResource: file, withExtension: nil) else {
			fatalError("Failed to LOCATE \(file) in budle.")
		}
		
		guard let data = try? Data(contentsOf: url) else {
			fatalError("Failed to LOAD \(file) from bundle")
		}
		
		let decoder = JSONDecoder()
		let formatter = DateFormatter()
		formatter.dateFormat = "y-MM-dd"
		decoder.dateDecodingStrategy = .formatted(formatter)
		
		guard let loaded = try? decoder.decode(T.self, from: data) else {
			fatalError("Failed to DECODE \(file) from bundle.")
		}
		
		return loaded
	}
}
