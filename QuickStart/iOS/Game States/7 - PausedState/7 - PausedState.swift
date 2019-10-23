//
//  PausedState.swift
//  OctopusKitQuickStart
//
//  Created by ShinryakuTako@invadingoctopus.io on 2018/02/10.
//  Copyright © 2019 Invading Octopus. Licensed under Apache License v2.0 (see LICENSE.txt)
//

//  🔶 STEP 7: The paused state for the QuickStart project, represented by the PlayScene (which also displays the content for the PlayState and GameOverState.)

import GameplayKit
import OctopusKit
import SwiftUI

final class PausedState: OctopusGameState {
    
    init() {
        
        // 🔶 STEP 7.1: Associates a scene and UI with this state.
        // The PlayScene is also associated with the PlayState and GamerOverState.
        
        super.init(associatedSceneClass: PlayScene.self,
                   associatedSwiftUIView: AnyView(PlayUI()))
    }
    
    @discardableResult override func octopusSceneDidChooseNextGameState(_ scene: OctopusScene) -> Bool {
        
        // 🔶 STEP 7.2: This method will be called by the PlayScene when the "Cycle Game States" button is tapped.
        
        return stateMachine?.enter(GameOverState.self) ?? false
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        
        // 🔶 STEP 7.3: The OctopusGameCoordinator's superclass GKStateMachine calls this method to ask if the current state can transition to the requested state.
        //
        // The PausedState can lead to the PlayState, the GameOverState or the TitleState.
        
        return stateClass == PlayState.self
            || stateClass == GameOverState.self
            || stateClass == TitleState.self
    }
    
}

