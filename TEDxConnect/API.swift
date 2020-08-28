// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetAllNewsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAllNews {
      allNews {
        __typename
        title
        description
        iconUrl
      }
    }
    """

  public let operationName: String = "GetAllNews"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("allNews", type: .list(.object(AllNews.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(allNews: [AllNews?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "allNews": allNews.flatMap { (value: [AllNews?]) -> [ResultMap?] in value.map { (value: AllNews?) -> ResultMap? in value.flatMap { (value: AllNews) -> ResultMap in value.resultMap } } }])
    }

    public var allNews: [AllNews?]? {
      get {
        return (resultMap["allNews"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [AllNews?] in value.map { (value: ResultMap?) -> AllNews? in value.flatMap { (value: ResultMap) -> AllNews in AllNews(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [AllNews?]) -> [ResultMap?] in value.map { (value: AllNews?) -> ResultMap? in value.flatMap { (value: AllNews) -> ResultMap in value.resultMap } } }, forKey: "allNews")
      }
    }

    public struct AllNews: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["NewsSchemaType"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("iconUrl", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(title: String, description: String? = nil, iconUrl: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "NewsSchemaType", "title": title, "description": description, "iconUrl": iconUrl])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var iconUrl: String? {
        get {
          return resultMap["iconUrl"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "iconUrl")
        }
      }
    }
  }
}
