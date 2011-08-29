/*
 * AppController.j
 * cappuccinoTimer
 *
 * Created by You on August 29, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>
@import <AppKit/CPLevelIndicator.j>


@implementation AppController : CPObject
{
    CPWindow    theWindow; //this "outlet" is connected automatically by the Cib
    @outlet CPLevelIndicator level1;
    @outlet CPLevelIndicator level2;
    @outlet CPLevelIndicator level3;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.

    // In this case, we want the window from Cib to become our full browser window
    [theWindow setFullPlatformWindow:YES];
}

- (@action)button1Clicked:(id)sender
{
    var currentValue = [level1 intValue];
    console.log(currentValue);
    if (currentValue === [level1 maxValue]) {
        [level1 setIntValue:[level1 minValue]];
    } else {
        [level1 setIntValue:[level1 maxValue]];
    }
}

@end
