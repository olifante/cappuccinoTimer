/*
 * AppController.j
 * cappuccinoTimer
 *
 * Created by You on August 29, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>
@import <AppKit/CPLevelIndicator.j>
@import <Foundation/CPTimer.j>

@implementation AppController : CPObject
{
    CPWindow    theWindow; //this "outlet" is connected automatically by the Cib
    @outlet CPSlider slider1;
    @outlet CPSlider slider2;
    @outlet CPSlider slider3;
    @outlet CPTextField field1;
    @outlet CPTextField field2;
    @outlet CPTextField field3;
    @outlet CPButton button1;
    @outlet CPButton button2;
    @outlet CPButton button3;
    @outlet CPLevelIndicator level1;
    @outlet CPLevelIndicator level2;
    @outlet CPLevelIndicator level3;
    sound1;
    sound2;
    sound3;
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
    sound1 = [[CPSound alloc] initWithContentsOfFile:"Resources/one.wav" byReference:NO];
    sound2 = [[CPSound alloc] initWithContentsOfFile:"Resources/two.wav" byReference:NO];
    sound3 = [[CPSound alloc] initWithContentsOfFile:"Resources/three.wav" byReference:NO];
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
    var target;
    console.log("sender has value " + [sender intValue]);
    switch (sender) {
        case field1:
            target = slider1;
            break;
        case field2:
            target = slider2;
            break;
        case field3:
            target = slider3;
            break;
    }
    console.log("target has value " + [target intValue]);
    [target setIntValue:[sender intValue]];
}

- (@action)totalPeriod:(id)sender
{
    var total = [slider1 intValue] + [slider2 intValue] + [slider3 intValue];
    console.log(total);
    console.log([slider1 intValue]); 
    var timer1 = [CPTimer 
                  scheduledTimerWithTimeInterval:[slider1 intValue]
                  callback:function() {
                      console.log('timer1 fired');
                      [sound1 play];
                  }
                  repeats:NO];
    var timer2 = [CPTimer 
                  scheduledTimerWithTimeInterval:([slider1 intValue] + [slider2 intValue])
                  callback:function() {
                      console.log('timer2 fired');
                      [sound2 play];
                  }
                  repeats:NO];
    var timer3 = [CPTimer 
                  scheduledTimerWithTimeInterval:([slider1 intValue] + [slider2 intValue] + [slider3 intValue])
                  callback:function() {
                      console.log('timer3 fired');
                      [sound3 play];
                  }
                  repeats:NO];
}

@end
