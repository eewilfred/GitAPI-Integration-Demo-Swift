//
//  PLBaseNetwork.swift
//  philipsLightingI
//
//  Created by Edwin Wilson on 13/05/18.
//  Copyright © 2018 edwins. All rights reserved.
//

import UIKit

public enum RequestType: String {
    case POST = "POST",
    GET = "GET"
}

let kPerPageKey = "per_page="

public  protocol PLBaseNetworkProtocol: NSObjectProtocol { //we can make optional using extenstion also with out using NSObjectprotocol and optional, but for ease of use i did this
    
    func downloadCompleted(_ data: Data?)
    func downloadCompletedForImage(_ image: Data?)
}

private let kMainBaseURL = "https://api.github.com/"
private let kAPIAuthorizationKey = "?access_token=55b66ab94aef404fc065c3b8e9a58042ec02336f&token_type=bearer" //needs to be encryped and kept. Done like this as this is demo proj

public class PLBaseNetwork: NSObject, URLSessionDelegate {
    public var baseURL = kMainBaseURL //Default value, if needs to override free to do so.
    public var delegate: PLBaseNetworkProtocol?
    
    private var session: URLSession!
    public var isDownloadingImage = false
    
    // MARK: life cycle
    convenience init(delegate: PLBaseNetworkProtocol?, baseURL: String! = kMainBaseURL) {
        self.init()
        self.delegate = delegate
        self.baseURL = baseURL
    }
    
    override init() {
        super.init()
        session = URLSession.shared// URLSession(configuration: .default, delegate: self , delegateQueue: nil)
        session.sessionDescription = "image downloader"
    }
    
    // MARK: public API
    
    /**
     async Image downloader
     - Parameter requestUrl: string defining APi path
     */
    public func downImage(requestUrl: String) {
        isDownloadingImage = true
        makeNetworkCall(requestUrl: requestUrl, requestType: .GET)
    }
    
    /**
     MASTER download function
     - Parameter requestUrl: string defining APi path
     - Parameter requestType: GET - Post etc
     */
    public func makeNetworkCall(requestUrl: String, requestType: RequestType = .GET, needsAuth : Bool = true) {
        var urlString = "\(baseURL)\(requestUrl)"
        urlString = needsAuth ? urlString + kAPIAuthorizationKey : urlString
        
        print("making network call for :: \(urlString)")
        guard let url = URL(string: urlString) else {
            self.delegate?.downloadCompleted(nil)
            return
        }
        
        var  request = URLRequest(url: url)
        request.httpMethod = requestType.rawValue
        
        session.dataTask(with: request) { (data, _, error) in
            if let data = data, error == nil {
                if self.isDownloadingImage {
                    self.delegate?.downloadCompletedForImage(data)
                } else { //is a normal request
                    self.delegate?.downloadCompleted(data)
                }
            } else {
                print("ERROR:: Download failed with \(error?.localizedDescription ?? error.debugDescription)")
                self.delegate?.downloadCompleted(data)
            }}.resume()
    }
}

