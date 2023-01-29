//
//  LoadingState.swift
//  DoYouRemember
//
//  Created by Sergey Leontiev on 28.01.2023.
//

import Foundation

enum LoadingState<Value> {
    case idle
    case loading
    case failed(Error)
    case loaded(Value)
}
