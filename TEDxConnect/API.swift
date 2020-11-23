// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// An enumeration.
public enum SectionType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Generic
  case generic
  /// Talks
  case talk
  /// Performance
  case performance
  /// Activity
  case activity
  /// Entertainment
  case entertainment
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "GENERIC": self = .generic
      case "TALK": self = .talk
      case "PERFORMANCE": self = .performance
      case "ACTIVITY": self = .activity
      case "ENTERTAINMENT": self = .entertainment
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .generic: return "GENERIC"
      case .talk: return "TALK"
      case .performance: return "PERFORMANCE"
      case .activity: return "ACTIVITY"
      case .entertainment: return "ENTERTAINMENT"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: SectionType, rhs: SectionType) -> Bool {
    switch (lhs, rhs) {
      case (.generic, .generic): return true
      case (.talk, .talk): return true
      case (.performance, .performance): return true
      case (.activity, .activity): return true
      case (.entertainment, .entertainment): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [SectionType] {
    return [
      .generic,
      .talk,
      .performance,
      .activity,
      .entertainment,
    ]
  }
}

public final class GetNewsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetNews {
      news {
        __typename
        title
        description
        iconUrl
        extraLink
      }
    }
    """

  public let operationName: String = "GetNews"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("news", type: .list(.object(News.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(news: [News?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "news": news.flatMap { (value: [News?]) -> [ResultMap?] in value.map { (value: News?) -> ResultMap? in value.flatMap { (value: News) -> ResultMap in value.resultMap } } }])
    }

    public var news: [News?]? {
      get {
        return (resultMap["news"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [News?] in value.map { (value: ResultMap?) -> News? in value.flatMap { (value: ResultMap) -> News in News(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [News?]) -> [ResultMap?] in value.map { (value: News?) -> ResultMap? in value.flatMap { (value: News) -> ResultMap in value.resultMap } } }, forKey: "news")
      }
    }

    public struct News: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["NewsSchemaType"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("iconUrl", type: .scalar(String.self)),
          GraphQLField("extraLink", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(title: String, description: String? = nil, iconUrl: String? = nil, extraLink: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "NewsSchemaType", "title": title, "description": description, "iconUrl": iconUrl, "extraLink": extraLink])
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

      /// any extra link related to the talk?
      public var extraLink: String? {
        get {
          return resultMap["extraLink"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "extraLink")
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
        id
        title
        cover
      }
    }
    """

  public let operationName: String = "GetAlbums"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("albums", type: .list(.object(Album.selections))),
      ]
    }

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

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("cover", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String, cover: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "AlbumSchemaType", "id": id, "title": title, "cover": cover])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
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
    }
  }
}

public final class GetAlbumPhotosQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAlbumPhotos($id: Int!) {
      album(id: $id) {
        __typename
        photo {
          __typename
          image
          thumbnail
        }
      }
    }
    """

  public let operationName: String = "GetAlbumPhotos"

  public var id: Int

  public init(id: Int) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("album", arguments: ["id": GraphQLVariable("id")], type: .object(Album.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(album: Album? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "album": album.flatMap { (value: Album) -> ResultMap in value.resultMap }])
    }

    public var album: Album? {
      get {
        return (resultMap["album"] as? ResultMap).flatMap { Album(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "album")
      }
    }

    public struct Album: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AlbumSchemaType"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("photo", type: .nonNull(.list(.nonNull(.object(Photo.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(photo: [Photo]) {
        self.init(unsafeResultMap: ["__typename": "AlbumSchemaType", "photo": photo.map { (value: Photo) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("thumbnail", type: .nonNull(.scalar(String.self))),
          ]
        }

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

public final class GetAboutsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAbouts {
      organizer {
        __typename
        abouts {
          __typename
          id
          title
          description
          image
        }
      }
    }
    """

  public let operationName: String = "GetAbouts"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("organizer", type: .object(Organizer.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(organizer: Organizer? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "organizer": organizer.flatMap { (value: Organizer) -> ResultMap in value.resultMap }])
    }

    public var organizer: Organizer? {
      get {
        return (resultMap["organizer"] as? ResultMap).flatMap { Organizer(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "organizer")
      }
    }

    public struct Organizer: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["OrganizerSchemaType"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("abouts", type: .nonNull(.list(.nonNull(.object(About.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(abouts: [About]) {
        self.init(unsafeResultMap: ["__typename": "OrganizerSchemaType", "abouts": abouts.map { (value: About) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// the organizer we're giving the info about.
      public var abouts: [About] {
        get {
          return (resultMap["abouts"] as! [ResultMap]).map { (value: ResultMap) -> About in About(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: About) -> ResultMap in value.resultMap }, forKey: "abouts")
        }
      }

      public struct About: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["AboutOrganizerSchemaType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .scalar(String.self)),
            GraphQLField("image", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, title: String, description: String? = nil, image: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "AboutOrganizerSchemaType", "id": id, "title": title, "description": description, "image": image])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
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

        /// an optional image for the 'about' section.
        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }
      }
    }
  }
}

public final class MainEventInfoQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query MainEventInfo {
      organizer {
        __typename
        mainEvent {
          __typename
          id
          title
          banner
          startDate
          endDate
          links {
            __typename
            role
            url
          }
          venue {
            __typename
            title
            address
            mapLink
            mapImage
          }
        }
      }
    }
    """

  public let operationName: String = "MainEventInfo"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("organizer", type: .object(Organizer.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(organizer: Organizer? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "organizer": organizer.flatMap { (value: Organizer) -> ResultMap in value.resultMap }])
    }

    public var organizer: Organizer? {
      get {
        return (resultMap["organizer"] as? ResultMap).flatMap { Organizer(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "organizer")
      }
    }

    public struct Organizer: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["OrganizerSchemaType"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("mainEvent", type: .object(MainEvent.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(mainEvent: MainEvent? = nil) {
        self.init(unsafeResultMap: ["__typename": "OrganizerSchemaType", "mainEvent": mainEvent.flatMap { (value: MainEvent) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// which event is currently the main event for this organizer?
      public var mainEvent: MainEvent? {
        get {
          return (resultMap["mainEvent"] as? ResultMap).flatMap { MainEvent(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "mainEvent")
        }
      }

      public struct MainEvent: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["EventSchemaType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("banner", type: .scalar(String.self)),
            GraphQLField("startDate", type: .scalar(String.self)),
            GraphQLField("endDate", type: .scalar(String.self)),
            GraphQLField("links", type: .nonNull(.list(.nonNull(.object(Link.selections))))),
            GraphQLField("venue", type: .object(Venue.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, title: String, banner: String? = nil, startDate: String? = nil, endDate: String? = nil, links: [Link], venue: Venue? = nil) {
          self.init(unsafeResultMap: ["__typename": "EventSchemaType", "id": id, "title": title, "banner": banner, "startDate": startDate, "endDate": endDate, "links": links.map { (value: Link) -> ResultMap in value.resultMap }, "venue": venue.flatMap { (value: Venue) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
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

        /// a banner for the event to be shown on the applications.
        public var banner: String? {
          get {
            return resultMap["banner"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "banner")
          }
        }

        /// shows the staring date and time for event.
        public var startDate: String? {
          get {
            return resultMap["startDate"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "startDate")
          }
        }

        /// shows the ending date and time for event.
        public var endDate: String? {
          get {
            return resultMap["endDate"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "endDate")
          }
        }

        /// to which event does the link belong?
        public var links: [Link] {
          get {
            return (resultMap["links"] as! [ResultMap]).map { (value: ResultMap) -> Link in Link(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Link) -> ResultMap in value.resultMap }, forKey: "links")
          }
        }

        /// where is the event held?
        public var venue: Venue? {
          get {
            return (resultMap["venue"] as? ResultMap).flatMap { Venue(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "venue")
          }
        }

        public struct Link: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["EventLinkSchemaType"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("role", type: .scalar(String.self)),
              GraphQLField("url", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(role: String? = nil, url: String) {
            self.init(unsafeResultMap: ["__typename": "EventLinkSchemaType", "role": role, "url": url])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// an optional slug, describing the link for other programs, such as applications.
          public var role: String? {
            get {
              return resultMap["role"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "role")
            }
          }

          /// the url address for the link.
          public var url: String {
            get {
              return resultMap["url"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "url")
            }
          }
        }

        public struct Venue: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["VenueSchemaType"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("title", type: .nonNull(.scalar(String.self))),
              GraphQLField("address", type: .scalar(String.self)),
              GraphQLField("mapLink", type: .scalar(String.self)),
              GraphQLField("mapImage", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(title: String, address: String? = nil, mapLink: String? = nil, mapImage: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "VenueSchemaType", "title": title, "address": address, "mapLink": mapLink, "mapImage": mapImage])
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

          /// venue's address.
          public var address: String? {
            get {
              return resultMap["address"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "address")
            }
          }

          /// a link to venue's location on the map (e.g. google map link).
          public var mapLink: String? {
            get {
              return resultMap["mapLink"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "mapLink")
            }
          }

          /// an image showing venue's location on the map.
          public var mapImage: String? {
            get {
              return resultMap["mapImage"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "mapImage")
            }
          }
        }
      }
    }
  }
}

public final class GetDaysQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetDays {
      organizer {
        __typename
        mainEvent {
          __typename
          days {
            __typename
            title
            sessions {
              __typename
              title
              startTime
              sections {
                __typename
                title
                type
                startTime
                endTime
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "GetDays"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("organizer", type: .object(Organizer.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(organizer: Organizer? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "organizer": organizer.flatMap { (value: Organizer) -> ResultMap in value.resultMap }])
    }

    public var organizer: Organizer? {
      get {
        return (resultMap["organizer"] as? ResultMap).flatMap { Organizer(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "organizer")
      }
    }

    public struct Organizer: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["OrganizerSchemaType"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("mainEvent", type: .object(MainEvent.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(mainEvent: MainEvent? = nil) {
        self.init(unsafeResultMap: ["__typename": "OrganizerSchemaType", "mainEvent": mainEvent.flatMap { (value: MainEvent) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// which event is currently the main event for this organizer?
      public var mainEvent: MainEvent? {
        get {
          return (resultMap["mainEvent"] as? ResultMap).flatMap { MainEvent(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "mainEvent")
        }
      }

      public struct MainEvent: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["EventSchemaType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("days", type: .nonNull(.list(.nonNull(.object(Day.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(days: [Day]) {
          self.init(unsafeResultMap: ["__typename": "EventSchemaType", "days": days.map { (value: Day) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// to which event does the day belong?
        public var days: [Day] {
          get {
            return (resultMap["days"] as! [ResultMap]).map { (value: ResultMap) -> Day in Day(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Day) -> ResultMap in value.resultMap }, forKey: "days")
          }
        }

        public struct Day: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["EventDaySchemaType"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("title", type: .nonNull(.scalar(String.self))),
              GraphQLField("sessions", type: .nonNull(.list(.nonNull(.object(Session.selections))))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(title: String, sessions: [Session]) {
            self.init(unsafeResultMap: ["__typename": "EventDaySchemaType", "title": title, "sessions": sessions.map { (value: Session) -> ResultMap in value.resultMap }])
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

          /// to which event day does this session belong?
          public var sessions: [Session] {
            get {
              return (resultMap["sessions"] as! [ResultMap]).map { (value: ResultMap) -> Session in Session(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Session) -> ResultMap in value.resultMap }, forKey: "sessions")
            }
          }

          public struct Session: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["SessionSchemaType"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("title", type: .nonNull(.scalar(String.self))),
                GraphQLField("startTime", type: .nonNull(.scalar(String.self))),
                GraphQLField("sections", type: .nonNull(.list(.nonNull(.object(Section.selections))))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(title: String, startTime: String, sections: [Section]) {
              self.init(unsafeResultMap: ["__typename": "SessionSchemaType", "title": title, "startTime": startTime, "sections": sections.map { (value: Section) -> ResultMap in value.resultMap }])
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

            /// when will the session start?
            public var startTime: String {
              get {
                return resultMap["startTime"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "startTime")
              }
            }

            /// in which session this section will be held?
            public var sections: [Section] {
              get {
                return (resultMap["sections"] as! [ResultMap]).map { (value: ResultMap) -> Section in Section(unsafeResultMap: value) }
              }
              set {
                resultMap.updateValue(newValue.map { (value: Section) -> ResultMap in value.resultMap }, forKey: "sections")
              }
            }

            public struct Section: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["SectionSchemaType"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("title", type: .nonNull(.scalar(String.self))),
                  GraphQLField("type", type: .nonNull(.scalar(SectionType.self))),
                  GraphQLField("startTime", type: .nonNull(.scalar(String.self))),
                  GraphQLField("endTime", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(title: String, type: SectionType, startTime: String, endTime: String) {
                self.init(unsafeResultMap: ["__typename": "SectionSchemaType", "title": title, "type": type, "startTime": startTime, "endTime": endTime])
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

              /// shows type of this program section, whether it's a generic section, a talk or performance, an activity, or else.
              public var type: SectionType {
                get {
                  return resultMap["type"]! as! SectionType
                }
                set {
                  resultMap.updateValue(newValue, forKey: "type")
                }
              }

              /// when will the section start?
              public var startTime: String {
                get {
                  return resultMap["startTime"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "startTime")
                }
              }

              /// when will the section end?
              public var endTime: String {
                get {
                  return resultMap["endTime"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "endTime")
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class GetTalksQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetTalks {
      talksWithEvent {
        __typename
        talks {
          __typename
          id
          title
          speakers {
            __typename
            title
          }
          section {
            __typename
            image
          }
        }
        event {
          __typename
          id
          title
        }
      }
    }
    """

  public let operationName: String = "GetTalks"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("talksWithEvent", type: .list(.object(TalksWithEvent.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(talksWithEvent: [TalksWithEvent?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "talksWithEvent": talksWithEvent.flatMap { (value: [TalksWithEvent?]) -> [ResultMap?] in value.map { (value: TalksWithEvent?) -> ResultMap? in value.flatMap { (value: TalksWithEvent) -> ResultMap in value.resultMap } } }])
    }

    public var talksWithEvent: [TalksWithEvent?]? {
      get {
        return (resultMap["talksWithEvent"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [TalksWithEvent?] in value.map { (value: ResultMap?) -> TalksWithEvent? in value.flatMap { (value: ResultMap) -> TalksWithEvent in TalksWithEvent(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [TalksWithEvent?]) -> [ResultMap?] in value.map { (value: TalksWithEvent?) -> ResultMap? in value.flatMap { (value: TalksWithEvent) -> ResultMap in value.resultMap } } }, forKey: "talksWithEvent")
      }
    }

    public struct TalksWithEvent: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TalksWithEventSchemaType"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("talks", type: .list(.object(Talk.selections))),
          GraphQLField("event", type: .object(Event.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(talks: [Talk?]? = nil, event: Event? = nil) {
        self.init(unsafeResultMap: ["__typename": "TalksWithEventSchemaType", "talks": talks.flatMap { (value: [Talk?]) -> [ResultMap?] in value.map { (value: Talk?) -> ResultMap? in value.flatMap { (value: Talk) -> ResultMap in value.resultMap } } }, "event": event.flatMap { (value: Event) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var talks: [Talk?]? {
        get {
          return (resultMap["talks"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Talk?] in value.map { (value: ResultMap?) -> Talk? in value.flatMap { (value: ResultMap) -> Talk in Talk(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Talk?]) -> [ResultMap?] in value.map { (value: Talk?) -> ResultMap? in value.flatMap { (value: Talk) -> ResultMap in value.resultMap } } }, forKey: "talks")
        }
      }

      public var event: Event? {
        get {
          return (resultMap["event"] as? ResultMap).flatMap { Event(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "event")
        }
      }

      public struct Talk: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["TalkSchemaType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("speakers", type: .nonNull(.list(.nonNull(.object(Speaker.selections))))),
            GraphQLField("section", type: .nonNull(.object(Section.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, title: String, speakers: [Speaker], section: Section) {
          self.init(unsafeResultMap: ["__typename": "TalkSchemaType", "id": id, "title": title, "speakers": speakers.map { (value: Speaker) -> ResultMap in value.resultMap }, "section": section.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
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

        /// which speaker(s) will be giving the talk?
        public var speakers: [Speaker] {
          get {
            return (resultMap["speakers"] as! [ResultMap]).map { (value: ResultMap) -> Speaker in Speaker(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Speaker) -> ResultMap in value.resultMap }, forKey: "speakers")
          }
        }

        /// on which event section do we have the talk?
        public var section: Section {
          get {
            return Section(unsafeResultMap: resultMap["section"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "section")
          }
        }

        public struct Speaker: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["SpeakerSchema"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("title", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(title: String) {
            self.init(unsafeResultMap: ["__typename": "SpeakerSchema", "title": title])
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
        }

        public struct Section: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["SectionSchemaType"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("image", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(image: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "SectionSchemaType", "image": image])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// an optional logo or thumbnail related to the section.
          public var image: String? {
            get {
              return resultMap["image"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "image")
            }
          }
        }
      }

      public struct Event: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["EventSchemaType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, title: String) {
          self.init(unsafeResultMap: ["__typename": "EventSchemaType", "id": id, "title": title])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
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
      }
    }
  }
}

public final class GetFeaturedTalkQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetFeaturedTalk {
      featuredTalk {
        __typename
        id
        title
        speakers {
          __typename
          title
        }
        section {
          __typename
          image
        }
      }
    }
    """

  public let operationName: String = "GetFeaturedTalk"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("featuredTalk", type: .object(FeaturedTalk.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(featuredTalk: FeaturedTalk? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "featuredTalk": featuredTalk.flatMap { (value: FeaturedTalk) -> ResultMap in value.resultMap }])
    }

    public var featuredTalk: FeaturedTalk? {
      get {
        return (resultMap["featuredTalk"] as? ResultMap).flatMap { FeaturedTalk(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "featuredTalk")
      }
    }

    public struct FeaturedTalk: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TalkSchemaType"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("speakers", type: .nonNull(.list(.nonNull(.object(Speaker.selections))))),
          GraphQLField("section", type: .nonNull(.object(Section.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String, speakers: [Speaker], section: Section) {
        self.init(unsafeResultMap: ["__typename": "TalkSchemaType", "id": id, "title": title, "speakers": speakers.map { (value: Speaker) -> ResultMap in value.resultMap }, "section": section.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
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

      /// which speaker(s) will be giving the talk?
      public var speakers: [Speaker] {
        get {
          return (resultMap["speakers"] as! [ResultMap]).map { (value: ResultMap) -> Speaker in Speaker(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Speaker) -> ResultMap in value.resultMap }, forKey: "speakers")
        }
      }

      /// on which event section do we have the talk?
      public var section: Section {
        get {
          return Section(unsafeResultMap: resultMap["section"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "section")
        }
      }

      public struct Speaker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["SpeakerSchema"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(title: String) {
          self.init(unsafeResultMap: ["__typename": "SpeakerSchema", "title": title])
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
      }

      public struct Section: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["SectionSchemaType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(image: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "SectionSchemaType", "image": image])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// an optional logo or thumbnail related to the section.
        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }
      }
    }
  }
}

public final class GetTalkDetailQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetTalkDetail($id: Int!) {
      talk(id: $id) {
        __typename
        id
        title
        description
        videoLink
        extraLink
        speakers {
          __typename
          title
        }
        section {
          __typename
          image
        }
      }
      suggestedTalks(talk: $id) {
        __typename
        id
        title
        speakers {
          __typename
          title
        }
        section {
          __typename
          image
        }
      }
    }
    """

  public let operationName: String = "GetTalkDetail"

  public var id: Int

  public init(id: Int) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("talk", arguments: ["id": GraphQLVariable("id")], type: .object(Talk.selections)),
        GraphQLField("suggestedTalks", arguments: ["talk": GraphQLVariable("id")], type: .list(.object(SuggestedTalk.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(talk: Talk? = nil, suggestedTalks: [SuggestedTalk?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "talk": talk.flatMap { (value: Talk) -> ResultMap in value.resultMap }, "suggestedTalks": suggestedTalks.flatMap { (value: [SuggestedTalk?]) -> [ResultMap?] in value.map { (value: SuggestedTalk?) -> ResultMap? in value.flatMap { (value: SuggestedTalk) -> ResultMap in value.resultMap } } }])
    }

    public var talk: Talk? {
      get {
        return (resultMap["talk"] as? ResultMap).flatMap { Talk(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "talk")
      }
    }

    public var suggestedTalks: [SuggestedTalk?]? {
      get {
        return (resultMap["suggestedTalks"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SuggestedTalk?] in value.map { (value: ResultMap?) -> SuggestedTalk? in value.flatMap { (value: ResultMap) -> SuggestedTalk in SuggestedTalk(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SuggestedTalk?]) -> [ResultMap?] in value.map { (value: SuggestedTalk?) -> ResultMap? in value.flatMap { (value: SuggestedTalk) -> ResultMap in value.resultMap } } }, forKey: "suggestedTalks")
      }
    }

    public struct Talk: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TalkSchemaType"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("videoLink", type: .scalar(String.self)),
          GraphQLField("extraLink", type: .scalar(String.self)),
          GraphQLField("speakers", type: .nonNull(.list(.nonNull(.object(Speaker.selections))))),
          GraphQLField("section", type: .nonNull(.object(Section.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String, description: String? = nil, videoLink: String? = nil, extraLink: String? = nil, speakers: [Speaker], section: Section) {
        self.init(unsafeResultMap: ["__typename": "TalkSchemaType", "id": id, "title": title, "description": description, "videoLink": videoLink, "extraLink": extraLink, "speakers": speakers.map { (value: Speaker) -> ResultMap in value.resultMap }, "section": section.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
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

      /// video link?
      public var videoLink: String? {
        get {
          return resultMap["videoLink"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "videoLink")
        }
      }

      /// any extra link related to the talk?
      public var extraLink: String? {
        get {
          return resultMap["extraLink"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "extraLink")
        }
      }

      /// which speaker(s) will be giving the talk?
      public var speakers: [Speaker] {
        get {
          return (resultMap["speakers"] as! [ResultMap]).map { (value: ResultMap) -> Speaker in Speaker(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Speaker) -> ResultMap in value.resultMap }, forKey: "speakers")
        }
      }

      /// on which event section do we have the talk?
      public var section: Section {
        get {
          return Section(unsafeResultMap: resultMap["section"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "section")
        }
      }

      public struct Speaker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["SpeakerSchema"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(title: String) {
          self.init(unsafeResultMap: ["__typename": "SpeakerSchema", "title": title])
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
      }

      public struct Section: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["SectionSchemaType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(image: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "SectionSchemaType", "image": image])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// an optional logo or thumbnail related to the section.
        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }
      }
    }

    public struct SuggestedTalk: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TalkSchemaType"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("speakers", type: .nonNull(.list(.nonNull(.object(Speaker.selections))))),
          GraphQLField("section", type: .nonNull(.object(Section.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String, speakers: [Speaker], section: Section) {
        self.init(unsafeResultMap: ["__typename": "TalkSchemaType", "id": id, "title": title, "speakers": speakers.map { (value: Speaker) -> ResultMap in value.resultMap }, "section": section.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
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

      /// which speaker(s) will be giving the talk?
      public var speakers: [Speaker] {
        get {
          return (resultMap["speakers"] as! [ResultMap]).map { (value: ResultMap) -> Speaker in Speaker(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Speaker) -> ResultMap in value.resultMap }, forKey: "speakers")
        }
      }

      /// on which event section do we have the talk?
      public var section: Section {
        get {
          return Section(unsafeResultMap: resultMap["section"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "section")
        }
      }

      public struct Speaker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["SpeakerSchema"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(title: String) {
          self.init(unsafeResultMap: ["__typename": "SpeakerSchema", "title": title])
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
      }

      public struct Section: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["SectionSchemaType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(image: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "SectionSchemaType", "image": image])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// an optional logo or thumbnail related to the section.
        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }
      }
    }
  }
}

public final class GetEventSponsorsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetEventSponsors($eventId: Int!) {
      sponsorsWithType(event: $eventId) {
        __typename
        sponsors {
          __typename
          title
          logo
          link
        }
        type {
          __typename
          title
        }
      }
    }
    """

  public let operationName: String = "GetEventSponsors"

  public var eventId: Int

  public init(eventId: Int) {
    self.eventId = eventId
  }

  public var variables: GraphQLMap? {
    return ["eventId": eventId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("sponsorsWithType", arguments: ["event": GraphQLVariable("eventId")], type: .list(.object(SponsorsWithType.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sponsorsWithType: [SponsorsWithType?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "sponsorsWithType": sponsorsWithType.flatMap { (value: [SponsorsWithType?]) -> [ResultMap?] in value.map { (value: SponsorsWithType?) -> ResultMap? in value.flatMap { (value: SponsorsWithType) -> ResultMap in value.resultMap } } }])
    }

    public var sponsorsWithType: [SponsorsWithType?]? {
      get {
        return (resultMap["sponsorsWithType"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SponsorsWithType?] in value.map { (value: ResultMap?) -> SponsorsWithType? in value.flatMap { (value: ResultMap) -> SponsorsWithType in SponsorsWithType(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SponsorsWithType?]) -> [ResultMap?] in value.map { (value: SponsorsWithType?) -> ResultMap? in value.flatMap { (value: SponsorsWithType) -> ResultMap in value.resultMap } } }, forKey: "sponsorsWithType")
      }
    }

    public struct SponsorsWithType: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SponsorsWithTypeSchemaType"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("sponsors", type: .list(.object(Sponsor.selections))),
          GraphQLField("type", type: .object(`Type`.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(sponsors: [Sponsor?]? = nil, type: `Type`? = nil) {
        self.init(unsafeResultMap: ["__typename": "SponsorsWithTypeSchemaType", "sponsors": sponsors.flatMap { (value: [Sponsor?]) -> [ResultMap?] in value.map { (value: Sponsor?) -> ResultMap? in value.flatMap { (value: Sponsor) -> ResultMap in value.resultMap } } }, "type": type.flatMap { (value: `Type`) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var sponsors: [Sponsor?]? {
        get {
          return (resultMap["sponsors"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Sponsor?] in value.map { (value: ResultMap?) -> Sponsor? in value.flatMap { (value: ResultMap) -> Sponsor in Sponsor(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Sponsor?]) -> [ResultMap?] in value.map { (value: Sponsor?) -> ResultMap? in value.flatMap { (value: Sponsor) -> ResultMap in value.resultMap } } }, forKey: "sponsors")
        }
      }

      public var type: `Type`? {
        get {
          return (resultMap["type"] as? ResultMap).flatMap { `Type`(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "type")
        }
      }

      public struct Sponsor: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["SponsorSchemaType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("logo", type: .scalar(String.self)),
            GraphQLField("link", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(title: String, logo: String? = nil, link: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "SponsorSchemaType", "title": title, "logo": logo, "link": link])
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

        /// logo of the sponsor.
        public var logo: String? {
          get {
            return resultMap["logo"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "logo")
          }
        }

        /// an external link to the sponsor's website.
        public var link: String? {
          get {
            return resultMap["link"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "link")
          }
        }
      }

      public struct `Type`: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["SponsorTypeSchemaType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(title: String) {
          self.init(unsafeResultMap: ["__typename": "SponsorTypeSchemaType", "title": title])
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
      }
    }
  }
}

public final class GetEventSpeakersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetEventSpeakers {
      organizer {
        __typename
        mainEvent {
          __typename
          speakers {
            __typename
            title
            description
            image
          }
        }
      }
    }
    """

  public let operationName: String = "GetEventSpeakers"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("organizer", type: .object(Organizer.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(organizer: Organizer? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "organizer": organizer.flatMap { (value: Organizer) -> ResultMap in value.resultMap }])
    }

    public var organizer: Organizer? {
      get {
        return (resultMap["organizer"] as? ResultMap).flatMap { Organizer(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "organizer")
      }
    }

    public struct Organizer: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["OrganizerSchemaType"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("mainEvent", type: .object(MainEvent.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(mainEvent: MainEvent? = nil) {
        self.init(unsafeResultMap: ["__typename": "OrganizerSchemaType", "mainEvent": mainEvent.flatMap { (value: MainEvent) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// which event is currently the main event for this organizer?
      public var mainEvent: MainEvent? {
        get {
          return (resultMap["mainEvent"] as? ResultMap).flatMap { MainEvent(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "mainEvent")
        }
      }

      public struct MainEvent: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["EventSchemaType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("speakers", type: .nonNull(.list(.nonNull(.object(Speaker.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(speakers: [Speaker]) {
          self.init(unsafeResultMap: ["__typename": "EventSchemaType", "speakers": speakers.map { (value: Speaker) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// to which event does the speaker belong?
        public var speakers: [Speaker] {
          get {
            return (resultMap["speakers"] as! [ResultMap]).map { (value: ResultMap) -> Speaker in Speaker(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Speaker) -> ResultMap in value.resultMap }, forKey: "speakers")
          }
        }

        public struct Speaker: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["SpeakerSchema"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("title", type: .nonNull(.scalar(String.self))),
              GraphQLField("description", type: .scalar(String.self)),
              GraphQLField("image", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(title: String, description: String? = nil, image: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "SpeakerSchema", "title": title, "description": description, "image": image])
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

          /// a thumbnail image for the speaker.
          public var image: String? {
            get {
              return resultMap["image"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "image")
            }
          }
        }
      }
    }
  }
}
