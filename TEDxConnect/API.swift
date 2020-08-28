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

public final class GetAlbumsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAlbums {
      albums {
        __typename
        title
        cover
        photo {
          __typename
          image
          thumbnail
        }
      }
    }
    """

  public let operationName: String = "GetAlbums"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("albums", type: .list(.object(Album.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(albums: [Album?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "albums": albums.flatMap { (value: [Album?]) -> [ResultMap?] in value.map { (value: Album?) -> ResultMap? in value.flatMap { (value: Album) -> ResultMap in value.resultMap } } }])
    }

    public var albums: [Album?]? {
      get {
        return (resultMap["albums"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Album?] in value.map { (value: ResultMap?) -> Album? in value.flatMap { (value: ResultMap) -> Album in Album(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Album?]) -> [ResultMap?] in value.map { (value: Album?) -> ResultMap? in value.flatMap { (value: Album) -> ResultMap in value.resultMap } } }, forKey: "albums")
      }
    }

    public struct Album: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AlbumSchemaType"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("cover", type: .scalar(String.self)),
        GraphQLField("photo", type: .nonNull(.list(.nonNull(.object(Photo.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(title: String, cover: String? = nil, photo: [Photo]) {
        self.init(unsafeResultMap: ["__typename": "AlbumSchemaType", "title": title, "cover": cover, "photo": photo.map { (value: Photo) -> ResultMap in value.resultMap }])
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

      /// a cover image for the album.
      public var cover: String? {
        get {
          return resultMap["cover"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "cover")
        }
      }

      /// to which album does the media belong?
      public var photo: [Photo] {
        get {
          return (resultMap["photo"] as! [ResultMap]).map { (value: ResultMap) -> Photo in Photo(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Photo) -> ResultMap in value.resultMap }, forKey: "photo")
        }
      }

      public struct Photo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PhotoSchemaType"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("image", type: .scalar(String.self)),
          GraphQLField("thumbnail", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(image: String? = nil, thumbnail: String) {
          self.init(unsafeResultMap: ["__typename": "PhotoSchemaType", "image": image, "thumbnail": thumbnail])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// the main photo file, if we're saving in in our own system.
        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }

        /// a thumbnail to show in album.
        public var thumbnail: String {
          get {
            return resultMap["thumbnail"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "thumbnail")
          }
        }
      }
    }
  }
}
