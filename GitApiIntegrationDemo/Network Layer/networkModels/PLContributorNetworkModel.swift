//
//  PLContributorNetworkModel.swift
//  philipsLightingI
//
//  Created by Edwin Wilson on 14/05/18.
//  Copyright © 2018 edwins. All rights reserved.
//

import Foundation

public typealias Contributors = [Contributor]

public class Contributor: Codable {
    public let login: String?
    public let id: Int?
    public let avatarURL: String?
    public let gravatarID: String?
    public let url: String?
    public let htmlURL: String?
    public let followersURL: String?
    public let followingURL: String?
    public let gistsURL: String?
    public let starredURL: String?
    public let subscriptionsURL: String?
    public let organizationsURL: String?
    public let reposURL: String?
    public let eventsURL: String?
    public let receivedEventsURL: String?
    public let type: String?
    public let siteAdmin: Bool?
    public let contributions: Int?
    
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case id = "id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url = "url"
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type = "type"
        case siteAdmin = "site_admin"
        case contributions = "contributions"
    }
    
    public init(login: String?, id: Int?, avatarURL: String?, gravatarID: String?, url: String?, htmlURL: String?, followersURL: String?, followingURL: String?, gistsURL: String?, starredURL: String?, subscriptionsURL: String?, organizationsURL: String?, reposURL: String?, eventsURL: String?, receivedEventsURL: String?, type: String?, siteAdmin: Bool?, contributions: Int?) {
        self.login = login
        self.id = id
        self.avatarURL = avatarURL
        self.gravatarID = gravatarID
        self.url = url
        self.htmlURL = htmlURL
        self.followersURL = followersURL
        self.followingURL = followingURL
        self.gistsURL = gistsURL
        self.starredURL = starredURL
        self.subscriptionsURL = subscriptionsURL
        self.organizationsURL = organizationsURL
        self.reposURL = reposURL
        self.eventsURL = eventsURL
        self.receivedEventsURL = receivedEventsURL
        self.type = type
        self.siteAdmin = siteAdmin
        self.contributions = contributions
    }
}

// MARK: Convenience initializers

public extension Contributor {
    public convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(Contributor.self, from: data)
        self.init(login: me.login, id: me.id, avatarURL: me.avatarURL, gravatarID: me.gravatarID, url: me.url, htmlURL: me.htmlURL, followersURL: me.followersURL, followingURL: me.followingURL, gistsURL: me.gistsURL, starredURL: me.starredURL, subscriptionsURL: me.subscriptionsURL, organizationsURL: me.organizationsURL, reposURL: me.reposURL, eventsURL: me.eventsURL, receivedEventsURL: me.receivedEventsURL, type: me.type, siteAdmin: me.siteAdmin, contributions: me.contributions)
    }
    
    public convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    public convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    public func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    public func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - URLSession response handlers

public extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? JSONDecoder().decode(T.self, from: data), response, nil)
        }
    }
    
    public func contributorsTask(with url: URL, completionHandler: @escaping (Contributors?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
