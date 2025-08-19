//
//  BaseRepository.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 19/07/25.
//

import Foundation

class BaseRepository {
    func handleApiCall<T>(_ execute: () async throws -> T) async -> Result<T, NetworkError> {
        do {
            let result = try await execute()
            return .success(result)
        } catch let urlError as URLError {
            switch urlError.code {
            case .badURL:
                return .failure(.badURL)
            case .notConnectedToInternet:
                return .failure(.noInternet)
            case .timedOut:
                return .failure(.timeout)
            default:
                return .failure(.unknown)
            }
        } catch {
            return .failure(.unknown)
        }
    }
}
