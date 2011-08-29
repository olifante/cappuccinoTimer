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
    @outlet CPButton button1;
    @outlet CPButton button2;
    @outlet CPButton button3;
    @outlet CPTextField period1;
    @outlet CPTextField period2;
    @outlet CPTextField period3;
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

- (@action)buttonClicked:(id)sender
{
    var target;
    if (sender === button1) {
        target = level1;
    } else if (sender === button2) {
        target = level2;
    } else if (sender === button3) {
        target = level3;
    } else {
        console.log('no target');
        return;
    }
    var currentValue = [target intValue];
    console.log(currentValue);
    if (currentValue === [target maxValue]) {
        [target setIntValue:[target minValue]];
    } else {
        [target setIntValue:[target maxValue]];
    }
}

- (@action)fieldChanged:(id)sender
{
    console.log(sender);
}

@end