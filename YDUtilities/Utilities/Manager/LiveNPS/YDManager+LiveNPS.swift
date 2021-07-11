//
//  YDManager+LiveNPS.swift
//  YDUtilities
//
//  Created by Douglas Hennrich on 11/07/21.
//

import Foundation
import YDExtensions

public class YDManagerLiveNPS: Codable {
  public let id: String
  public let liveId: String
  public var question: String?
  public var answer: String?

  public init(
    id: String,
    liveId: String,
    question: String?,
    answer: String?
  ) {
    self.id = id
    self.liveId = liveId
    self.question = question
    self.answer = answer
  }
}

public extension YDManager {
  class LivesNPS {
    // MARK: Properties
    public  static let shared = YDManager.LivesNPS()
    private let defaults = UserDefaults.standard
    private var lives: [YDManagerLiveNPS] = []

    // MARK: Init
    private init() {
      guard let data = defaults.object(forKey: YDConstants.UserDefaults.savedLiveNPS) as? Data,
            let saved = try? JSONDecoder().decode([YDManagerLiveNPS].self, from: data)
      else { return }

      lives = saved
    }

    // MARK: Actions
    private func save() {
      guard let encoded = try? JSONEncoder().encode(lives) else { return }
      defaults.set(encoded, forKey: YDConstants.UserDefaults.savedLiveNPS)
    }

    // MARK: Public
    public func add(_ nps: YDManagerLiveNPS) {
      guard lives.firstIndex(where: { $0.liveId == nps.liveId && $0.id == nps.id }) == nil
      else { return }

      lives.append(nps)
      save()
    }

    public func get(id: String, liveId: String) -> YDManagerLiveNPS? {
      return lives.first(
        where: {
          $0.liveId == $0.liveId && $0.id == id
        }
      )
    }
  }
}
