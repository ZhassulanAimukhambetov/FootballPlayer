import Foundation

struct Video: Decodable {
    let name: String
    let matchID: Int
    let period: Int
    let serverID: Int
    let quality: String
    let folder: String
    let videoType: String
    let abc: String
    let startMs: Int
    let checksum: Int
    let size: Int
    let abcType: String
    let duration: Int
    let fps: Int
    let urlRoot: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case matchID = "match_id"
        case period
        case serverID = "server_id"
        case quality
        case folder
        case videoType = "video_type"
        case abc
        case startMs = "start_ms"
        case checksum
        case size
        case abcType = "abc_type"
        case duration
        case fps
        case urlRoot = "url_root"
        case url
    }
}
