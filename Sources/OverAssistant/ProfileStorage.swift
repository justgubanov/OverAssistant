//
//  ProfileStorage.swift
//  
//
//  Created by Александр Губанов on 13.10.2020.
//

struct ProfileStorage {
    
    static var saves: [Profile] = []
    
    static subscript(nickname: String) -> Profile? {
        return saves.first { profile in
            profile.playerName == nickname
        }
    }
}
