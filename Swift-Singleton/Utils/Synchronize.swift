//
//  Synchronize.swift
//  Swift-Singleton
//
//  Created by Anjan Kumar Majumder on 1/8/21.
//

import Foundation

@propertyWrapper public struct Serialized<Wrapped> {
    private let queue = DispatchQueue(label: "com.anjan.Serialized")

    private var _wrappedValue: Wrapped
    public var wrappedValue: Wrapped {
        get { queue.sync { _wrappedValue } }
        set { queue.sync { _wrappedValue = newValue } }
    }

    public init(wrappedValue: Wrapped) {
        self._wrappedValue = wrappedValue
    }
}

class Test {
    var mutex: pthread_mutex_t = pthread_mutex_t()
    init() {
    }
}

private extension Test {
   func sync_same_file<R>(execute: () throws -> R) rethrows -> R {
      pthread_mutex_lock(&mutex)
      defer { pthread_mutex_unlock(&mutex) }
      return try execute()
   }
}
