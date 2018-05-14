//
//  PLNetworkModels.swift
//  philipsLightingI
//
//  Created by Edwin Wilson on 13/05/18.
//  Copyright © 2018 edwins. All rights reserved.



import Foundation

public class Stock: Codable {
    public let totalCount: Int?
    public let incompleteResults: Bool?
    public let items: [Item]?
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
    
    public init(totalCount: Int?, incompleteResults: Bool?, items: [Item]?) {
        self.totalCount = totalCount
        self.incompleteResults = incompleteResults
        self.items = items
    }
}

public class Item: Codable {
    public let id: Int?
    public let name, fullName: String?
    public let owner: Owner?
    public let itemPrivate: Bool?
    public let htmlURL: String?
    public let description: String?
    public let fork: Bool?
    public let url, forksURL, keysURL, collaboratorsURL: String?
    public let teamsURL, hooksURL, issueEventsURL, eventsURL: String?
    public let assigneesURL, branchesURL, tagsURL, blobsURL: String?
    public let gitTagsURL, gitRefsURL, treesURL, statusesURL: String?
    public let languagesURL, stargazersURL, contributorsURL, subscribersURL: String?
    public let subscriptionURL, commitsURL, gitCommitsURL, commentsURL: String?
    public let issueCommentURL, contentsURL, compareURL, mergesURL: String?
    public let archiveURL, downloadsURL, issuesURL, pullsURL: String?
    public let milestonesURL, notificationsURL, labelsURL, releasesURL: String?
    public let deploymentsURL, createdAt, updatedAt, pushedAt: String?
    public let gitURL, sshURL, cloneURL, svnURL: String?
    public let homepage: String?
    public let size, stargazersCount, watchersCount: Int?
    public let language: String?
    public let hasIssues, hasProjects, hasDownloads, hasWiki: Bool?
    public let hasPages: Bool?
    public let forksCount: Int?
    public let mirrorURL: JSONNull?
    public let archived: Bool?
    public let openIssuesCount: Int?
    public let license: License?
    public let forks, openIssues, watchers: Int?
    public let defaultBranch: String?
    public let score: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case fullName = "full_name"
        case owner
        case itemPrivate = "private"
        case htmlURL = "html_url"
        case description, fork, url
        case forksURL = "forks_url"
        case keysURL = "keys_url"
        case collaboratorsURL = "collaborators_url"
        case teamsURL = "teams_url"
        case hooksURL = "hooks_url"
        case issueEventsURL = "issue_events_url"
        case eventsURL = "events_url"
        case assigneesURL = "assignees_url"
        case branchesURL = "branches_url"
        case tagsURL = "tags_url"
        case blobsURL = "blobs_url"
        case gitTagsURL = "git_tags_url"
        case gitRefsURL = "git_refs_url"
        case treesURL = "trees_url"
        case statusesURL = "statuses_url"
        case languagesURL = "languages_url"
        case stargazersURL = "stargazers_url"
        case contributorsURL = "contributors_url"
        case subscribersURL = "subscribers_url"
        case subscriptionURL = "subscription_url"
        case commitsURL = "commits_url"
        case gitCommitsURL = "git_commits_url"
        case commentsURL = "comments_url"
        case issueCommentURL = "issue_comment_url"
        case contentsURL = "contents_url"
        case compareURL = "compare_url"
        case mergesURL = "merges_url"
        case archiveURL = "archive_url"
        case downloadsURL = "downloads_url"
        case issuesURL = "issues_url"
        case pullsURL = "pulls_url"
        case milestonesURL = "milestones_url"
        case notificationsURL = "notifications_url"
        case labelsURL = "labels_url"
        case releasesURL = "releases_url"
        case deploymentsURL = "deployments_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case gitURL = "git_url"
        case sshURL = "ssh_url"
        case cloneURL = "clone_url"
        case svnURL = "svn_url"
        case homepage, size
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case language
        case hasIssues = "has_issues"
        case hasProjects = "has_projects"
        case hasDownloads = "has_downloads"
        case hasWiki = "has_wiki"
        case hasPages = "has_pages"
        case forksCount = "forks_count"
        case mirrorURL = "mirror_url"
        case archived
        case openIssuesCount = "open_issues_count"
        case license, forks
        case openIssues = "open_issues"
        case watchers
        case defaultBranch = "default_branch"
        case score
    }
    
    public init(id: Int?, name: String?, fullName: String?, owner: Owner?, itemPrivate: Bool?, htmlURL: String?, description: String?, fork: Bool?, url: String?, forksURL: String?, keysURL: String?, collaboratorsURL: String?, teamsURL: String?, hooksURL: String?, issueEventsURL: String?, eventsURL: String?, assigneesURL: String?, branchesURL: String?, tagsURL: String?, blobsURL: String?, gitTagsURL: String?, gitRefsURL: String?, treesURL: String?, statusesURL: String?, languagesURL: String?, stargazersURL: String?, contributorsURL: String?, subscribersURL: String?, subscriptionURL: String?, commitsURL: String?, gitCommitsURL: String?, commentsURL: String?, issueCommentURL: String?, contentsURL: String?, compareURL: String?, mergesURL: String?, archiveURL: String?, downloadsURL: String?, issuesURL: String?, pullsURL: String?, milestonesURL: String?, notificationsURL: String?, labelsURL: String?, releasesURL: String?, deploymentsURL: String?, createdAt: String?, updatedAt: String?, pushedAt: String?, gitURL: String?, sshURL: String?, cloneURL: String?, svnURL: String?, homepage: String?, size: Int?, stargazersCount: Int?, watchersCount: Int?, language: String?, hasIssues: Bool?, hasProjects: Bool?, hasDownloads: Bool?, hasWiki: Bool?, hasPages: Bool?, forksCount: Int?, mirrorURL: JSONNull?, archived: Bool?, openIssuesCount: Int?, license: License?, forks: Int?, openIssues: Int?, watchers: Int?, defaultBranch: String?, score: Double?) {
        self.id = id
        self.name = name
        self.fullName = fullName
        self.owner = owner
        self.itemPrivate = itemPrivate
        self.htmlURL = htmlURL
        self.description = description
        self.fork = fork
        self.url = url
        self.forksURL = forksURL
        self.keysURL = keysURL
        self.collaboratorsURL = collaboratorsURL
        self.teamsURL = teamsURL
        self.hooksURL = hooksURL
        self.issueEventsURL = issueEventsURL
        self.eventsURL = eventsURL
        self.assigneesURL = assigneesURL
        self.branchesURL = branchesURL
        self.tagsURL = tagsURL
        self.blobsURL = blobsURL
        self.gitTagsURL = gitTagsURL
        self.gitRefsURL = gitRefsURL
        self.treesURL = treesURL
        self.statusesURL = statusesURL
        self.languagesURL = languagesURL
        self.stargazersURL = stargazersURL
        self.contributorsURL = contributorsURL
        self.subscribersURL = subscribersURL
        self.subscriptionURL = subscriptionURL
        self.commitsURL = commitsURL
        self.gitCommitsURL = gitCommitsURL
        self.commentsURL = commentsURL
        self.issueCommentURL = issueCommentURL
        self.contentsURL = contentsURL
        self.compareURL = compareURL
        self.mergesURL = mergesURL
        self.archiveURL = archiveURL
        self.downloadsURL = downloadsURL
        self.issuesURL = issuesURL
        self.pullsURL = pullsURL
        self.milestonesURL = milestonesURL
        self.notificationsURL = notificationsURL
        self.labelsURL = labelsURL
        self.releasesURL = releasesURL
        self.deploymentsURL = deploymentsURL
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.pushedAt = pushedAt
        self.gitURL = gitURL
        self.sshURL = sshURL
        self.cloneURL = cloneURL
        self.svnURL = svnURL
        self.homepage = homepage
        self.size = size
        self.stargazersCount = stargazersCount
        self.watchersCount = watchersCount
        self.language = language
        self.hasIssues = hasIssues
        self.hasProjects = hasProjects
        self.hasDownloads = hasDownloads
        self.hasWiki = hasWiki
        self.hasPages = hasPages
        self.forksCount = forksCount
        self.mirrorURL = mirrorURL
        self.archived = archived
        self.openIssuesCount = openIssuesCount
        self.license = license
        self.forks = forks
        self.openIssues = openIssues
        self.watchers = watchers
        self.defaultBranch = defaultBranch
        self.score = score
    }
}

public class License: Codable {
    public let key, name, spdxID, url: String?
    
    enum CodingKeys: String, CodingKey {
        case key, name
        case spdxID = "spdx_id"
        case url
    }
    
    public init(key: String?, name: String?, spdxID: String?, url: String?) {
        self.key = key
        self.name = name
        self.spdxID = spdxID
        self.url = url
    }
}

public class Owner: Codable {
    public let login: String?
    public let id: Int?
    public let avatarURL, gravatarID, url, htmlURL: String?
    public let followersURL, followingURL, gistsURL, starredURL: String?
    public let subscriptionsURL, organizationsURL, reposURL, eventsURL: String?
    public let receivedEventsURL, type: String?
    public let siteAdmin: Bool?
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
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
        case type
        case siteAdmin = "site_admin"
    }
    
    public init(login: String?, id: Int?, avatarURL: String?, gravatarID: String?, url: String?, htmlURL: String?, followersURL: String?, followingURL: String?, gistsURL: String?, starredURL: String?, subscriptionsURL: String?, organizationsURL: String?, reposURL: String?, eventsURL: String?, receivedEventsURL: String?, type: String?, siteAdmin: Bool?) {
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
    }
}

// MARK: Encode/decode helpers

public class JSONNull: Codable {
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

// MARK: - URLSession response handlers

public extension URLSession {
    fileprivate func codableTask<T: Codable>(with request: URLRequest, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? JSONDecoder().decode(T.self, from: data), response, nil)
        }
    }
    
    public func stockTask(with request: URLRequest, completionHandler: @escaping (Stock?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: request, completionHandler: completionHandler)
    }
}

