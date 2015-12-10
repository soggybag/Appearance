//
//  AppDelegate.swift
//  Appearance
//
//  Created by mitchell hudson on 12/10/15.
//  Copyright © 2015 mitchell hudson. All rights reserved.
//

import UIKit



// Use this extension to color tab bar icons
extension UIImage {
    func imageWithColor(tintColor: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        
        let context = UIGraphicsGetCurrentContext()! as CGContextRef
        CGContextTranslateCTM(context, 0, self.size.height)
        CGContextScaleCTM(context, 1.0, -1.0)
        CGContextSetBlendMode(context, CGBlendMode.Normal)
        
        let rect = CGRectMake(0, 0, self.size.width, self.size.height) as CGRect
        CGContextClipToMask(context, rect, self.CGImage)
        tintColor.setFill()
        CGContextFillRect(context, rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext() as UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
}



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        appStyle()
        
        return true
    }
    
    func appStyle() {
        
        // Define some colors

        let color_yellow = UIColor(red: 245/255, green: 230/255, blue: 27/255, alpha: 1.0)
        let color_yellow_dark = UIColor(red: 181/255, green: 170/255, blue: 20/255, alpha: 1.0)
        let color_white = UIColor.whiteColor()
        let color_black = UIColor.blackColor()

        // Window styles

        window?.tintColor = color_yellow    // Global tint color
        // The global tinit color sets the selected color for tabbar icons

        // Navigation Bar

        // UINavigationBar.appearance().backgroundColor = color_black
        UINavigationBar.appearance().barStyle = UIBarStyle.Black    // Set the bar to black transparent and text to white
        UINavigationBar.appearance().backgroundColor = color_black  // Sets the background color behind the transparent bar
        UINavigationBar.appearance().barTintColor = color_black     // Set the color of the bar to black
        UINavigationBar.appearance().translucent = false            //
        UINavigationBar.appearance().titleTextAttributes = [            // Set UINavigation Bar title attributes
            NSFontAttributeName:UIFont(name: "Helvetica", size: 24)!,   // Set the font and size
            NSForegroundColorAttributeName: color_yellow_dark           // Set the text color
        ]


        // UITableView

        UITableView.appearance().backgroundColor = color_yellow_dark
        UITableView.appearance().separatorColor = color_yellow_dark

        // UITableViewCell

        UITableViewCell.appearance().backgroundColor = color_yellow
        UITableViewCell.appearance().textLabel?.tintColor = color_black
        // Selected color for cell
        let colorView = UIView()
        colorView.backgroundColor = color_yellow_dark
        UITableViewCell.appearance().selectedBackgroundView = colorView

        // UITableViewCell.appearance().accessoryView =

        // UITabBar
        UITabBar.appearance().barStyle = UIBarStyle.Black
        UITabBar.appearance().translucent = false

        // UITabBarItem text label
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.magentaColor()], forState: .Normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.magentaColor()], forState: .Selected)

        // *** TabBar Icons must be style in the UITabBarController or set the color in the images

        // Segmented controller
        UISegmentedControl.appearance().tintColor = color_black

        // UISwitch
        // UISwitch.appearance().backgroundColor = UIColor.redColor()
        UISwitch.appearance().tintColor = color_black
        UISwitch.appearance().onTintColor = UIColor.redColor()
        UISwitch.appearance().thumbTintColor = color_yellow_dark
        // Look at the onImage and offImage properties...


        // TextField
        UITextField.appearance().borderStyle = .None
        UITextField.appearance().tintColor = color_white
        UITextField.appearance().backgroundColor = color_black
        UITextField.appearance().textColor = color_white

        // UILabel
        // UILabel.appearance().textColor =
        
    }

    
    
    
    
    
    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

