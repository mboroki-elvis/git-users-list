@testable import GitHubUsers
import XCTest

final class GitHubUsersTests: XCTestCase {
    var sut: AuthenticationViewModel!
    var service: AuthenticationService!
    var environment: AppEnvironment!
    override func setUp() {
        super.setUp()
        environment = EnvironmentMock()
        service = AuthenticationServiceImplementation(environment: environment)
        sut = .init(service: service)
    }

    override func tearDown() {
        service = nil
        sut = nil
        super.tearDown()
    }

    func testStartFlow() throws {
        let router = AppRouter(.auth(.authorize))
        sut.startFlow(router: router)
        XCTAssert(sut.error == nil)
    }
    
    func testStartFlowGetToken() throws {
        let router = AppRouter(.auth(.authorize))
        sut.startFlow(router: router)
        XCTAssert(sut.error == nil)
        let state = environment.keychainManager.string(forKey: .authState) ?? ""
        let url = "com.ketu.gitusers://authentication?code=24828ba&state=\(state)"
        sut.obtainAccessToken(url: URL(string: url)!, router: router)
        XCTAssert(sut.error == nil)
        XCTAssertNotNil(environment.keychainManager.string(forKey: .accessToken))
    }
}


