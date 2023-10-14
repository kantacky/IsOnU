import Foundation
import Dependencies

extension PersistableTimerClient: TestDependencyKey {
    public static let testValue: PersistableTimerClient = Self(
        start: unimplemented("start")
    )
}


/*
 import Foundation
 import Dependencies

 extension ShakingClient: TestDependencyKey {
     public static let testValue: ShakingClient = Self(
         startShaking: unimplemented("startShaking"),
         stopShaking: unimplemented("stopShaking")
     )
 }


 */
