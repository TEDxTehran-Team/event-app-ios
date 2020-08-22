//
//  Repository.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/10/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

struct Edge: Codable {
  let node: [Node]
}

struct Node: Codable {
  let repository: Repository
}

struct Repository: Codable {
  let name: String
  let stargazers: [Stargazer]
  let url: String
}

struct Stargazer: Codable {
  let totalCount: Int
}
