//
//  NetworkError.swift
//  DoYouRemember
//
//  Created by Sergey Leontiev on 06.10.2022.
//

import Foundation

enum NetworkError: Error {
  case parsing(description: String)
  case network(description: String)
}
