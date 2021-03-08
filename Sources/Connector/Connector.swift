
import PNetwork

public struct EmptyModel: Model {
    init() {}
}

public class Connector<T: RawRepresentable & EndpointPath> {
    
    public typealias RouterType = T
    
    private let network: PNetworker
    
    public init(credential: Credential) {
        var mobileApis: PEnvironment = Environments.mobileApis
        network = PNetwork(environment: mobileApis.connect(credential: credential))
    }
    
    public func request<T: Model>(router: RouterType,
                           method: HTTPMethod,
                           model: T.Type,
                           params: [String: String] = [:],
                           headers: [String: String] = [:],
                           postType: PostType = .json,
                           completion: @escaping (_ response: PNetworkResponse<T>) -> Void
    ) {
        let endpoint: PEndpoint = router.value(method: method, params: params, headers: headers, postType: postType)
        network.request(endpoint: endpoint, model: model, completion: completion)
    }
    
    public func request(router: RouterType,
                 method: HTTPMethod,
                 params: [String: String] = [:],
                 headers: [String: String] = [:],
                 postType: PostType = .json,
                 completion: @escaping (_ response: PNetworkResponse<EmptyModel>) -> Void
    ) {
        request(router: router, method: method, model: EmptyModel.self, params: params, headers: headers, postType: postType, completion: completion)
    }
    
    public func get<T: Model>(router: RouterType,
             model: T.Type,
             headers: [String: String] = [:],
             postType: PostType = .json,
             completion: @escaping (_ response: PNetworkResponse<T>) -> Void
    ) {
        request(router: router, method: .get, model: model, headers: headers, postType: postType, completion: completion)
    }
}
