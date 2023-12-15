//
//  Routable.swift
//
//  Created by James Sedlacek on 12/14/23.
//

import SwiftUI

/// A type that can be used to navigate through a set of destinations
public protocol Routable: ObservableObject {
    var path: NavigationPath { get set }

    func pop()
    func popToRoot()
    func push<V: View>(@ViewBuilder destination: @escaping () -> V)
}

extension Routable {
    /// Removes the last destination from the navigation path
    public func pop() {
        path.removeLast()
    }

    /// Resets the navigation path to its initial state
    public func popToRoot() {
        path = .init()
    }
    /// Pushes a new view onto the navigation path
    /// - Parameter destination: The view to be pushed onto the navigation path
    public func push<V: View>(@ViewBuilder destination: @escaping () -> V) {
        path.append(DisplayableView(destination()))
    }
}