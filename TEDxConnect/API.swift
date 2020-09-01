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
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("cover", type: .scalar(String.self)),
      ]

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

    public static let selections: [GraphQLSelection] = [
      GraphQLField("album", arguments: ["id": GraphQLVariable("id")], type: .object(Album.selections)),
    ]

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

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("photo", type: .nonNull(.list(.nonNull(.object(Photo.selections))))),
      ]

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

public final class GetAboutsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAbouts {
      organizer {
        __typename
        abouts {
          __typename
          title
          description
        }
      }
    }
    """

  public let operationName: String = "GetAbouts"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("organizer", type: .object(Organizer.selections)),
    ]

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

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("abouts", type: .nonNull(.list(.nonNull(.object(About.selections))))),
      ]

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

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(title: String, description: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "AboutOrganizerSchemaType", "title": title, "description": description])
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
            adddress
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

    public static let selections: [GraphQLSelection] = [
      GraphQLField("organizer", type: .object(Organizer.selections)),
    ]

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

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("mainEvent", type: .object(MainEvent.selections)),
      ]

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

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("banner", type: .scalar(String.self)),
          GraphQLField("startDate", type: .scalar(String.self)),
          GraphQLField("endDate", type: .scalar(String.self)),
          GraphQLField("links", type: .nonNull(.list(.nonNull(.object(Link.selections))))),
          GraphQLField("venue", type: .object(Venue.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(title: String, banner: String? = nil, startDate: String? = nil, endDate: String? = nil, links: [Link], venue: Venue? = nil) {
          self.init(unsafeResultMap: ["__typename": "EventSchemaType", "title": title, "banner": banner, "startDate": startDate, "endDate": endDate, "links": links.map { (value: Link) -> ResultMap in value.resultMap }, "venue": venue.flatMap { (value: Venue) -> ResultMap in value.resultMap }])
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

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("role", type: .scalar(String.self)),
            GraphQLField("url", type: .nonNull(.scalar(String.self))),
          ]

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

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("adddress", type: .scalar(String.self)),
            GraphQLField("mapLink", type: .scalar(String.self)),
            GraphQLField("mapImage", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(title: String, adddress: String? = nil, mapLink: String? = nil, mapImage: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "VenueSchemaType", "title": title, "adddress": adddress, "mapLink": mapLink, "mapImage": mapImage])
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
          public var adddress: String? {
            get {
              return resultMap["adddress"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "adddress")
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
