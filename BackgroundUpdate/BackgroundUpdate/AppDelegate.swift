//
//  AppDelegate.swift
//  BackgroundUpdate
//
//  Created by Ideas2IT on 31/08/23.
//

import UIKit
import BackgroundTasks

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        BGTaskScheduler.shared.register(forTaskWithIdentifier: "com.ideas2it.refresh",
                                        using: nil) { task in
             self.handleAppRefresh(task: task as! BGAppRefreshTask)
            
        }
        
        BGTaskScheduler.shared.register(forTaskWithIdentifier: "com.ideas2it.fetchdata", using: nil) { task in
            self.handleFileCreation(task: task as! BGProcessingTask)
        }
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
//
    }
    
    func getDocumentsDirectory() -> URL {
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            return paths[0]
        }
    
    func scheduleFileCreation() {
        let request =  BGProcessingTaskRequest(identifier: "com.ideas2it.fetchdata")
        request.requiresExternalPower = false
        request.requiresNetworkConnectivity = false
        request.earliestBeginDate = Date(timeIntervalSinceNow: 1 * 60)
        do {
            try BGTaskScheduler.shared.submit(request)
        } catch {
            print("ERROR while scheduling File creating")
        }
    }
    
    func scheduleAppRefresh() {
        let request = BGAppRefreshTaskRequest(identifier: "com.ideas2it.refresh")
        // Fetch no earlier than 15 minutes from now.
        request.earliestBeginDate = Date(timeIntervalSinceNow: 5 * 60)
             
        do {
           try BGTaskScheduler.shared.submit(request)
        } catch {
           print("Could not schedule app refresh: \(error)")
        }
    }
    
    func handleFileCreation(task: BGProcessingTask) {
        scheduleFileCreation()
        let currentDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let formattedDate = dateFormatter.string(from: currentDate)
        
        let myLbl = "this file is created at \(formattedDate)"
        
        do {
            let fileURL = self.getDocumentsDirectory().appendingPathExtension("timerLbl.txt")
            print(fileURL.path)
            try myLbl.write(to: fileURL, atomically: true, encoding: .utf8)
            task.setTaskCompleted(success: true)
        } catch {
            print("Failed to create a file and store")
            task.setTaskCompleted(success: false)
        }
        
        let nextExecutionDate = Calendar.current.date(byAdding: .minute, value: 5, to: Date())!
//            scheduleLabelStorageTask(after: nextExecutionDate)
    }
    
    func handleAppRefresh(task: BGAppRefreshTask) {
       // Schedule a new refresh task.
       scheduleAppRefresh()


        let operationQueue = OperationQueue()
       // Create an operation that performs the main part of the background task.
       let operation = Operation()
       
       // Provide the background task with an expiration handler that cancels the operation.
       task.expirationHandler = {
          operation.cancel()
       }


       // Inform the system that the background task is complete
       // when the operation completes.
       operation.completionBlock = {
          task.setTaskCompleted(success: !operation.isCancelled)
       }


       // Start the operation.
       operationQueue.addOperation(operation)
     }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    



}

