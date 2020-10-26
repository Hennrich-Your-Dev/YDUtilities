//
//  Binder.swift
//  YDMHome
//
//  Created by Douglas Hennrich on 15/09/20.
//  Copyright © 2020 YourDev. All rights reserved.
//

import Foundation

public class Binder<T> {

  public typealias Listener = ((T) -> Void)

	private(set) var listener: Listener?

	var onSetEvents: Int = 0

  public func bind(listener: Listener?) {
		self.listener = listener
	}

  public func bindAndFire(listener: Listener?) {
		self.listener = listener
		callListener()
	}

	var value: T {
		didSet {
			onSetEvents += 1
			callListener()
		}
	}

  public init(_ value: T) {
		self.value = value
	}

  public func isBinded() -> Bool {
		return listener != nil
	}

  public func fire() {
		callListener()
	}

	private func callListener() {
		if Thread.isMainThread {
			listener?(value)
		} else {
			DispatchQueue.main.async {
				self.listener?(self.value)
			}
		}
	}
}
