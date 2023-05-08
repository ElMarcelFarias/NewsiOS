//
//  GenericDataProvider.swift
//  NewsiOS
//
//  Created by Marcel Leite de Farias on 08/05/23.
//

import Foundation

protocol GenericDataProvider {
    func success(model: Any)
    func errorData(_ provider: GenericDataProvider?, error: Error?)
}

class DataProviderManager<T, S> {
    var delegate: T?
    var model: S?
}
