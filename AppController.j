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
    timer1;
    timer2;
    timer3;
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

- (@action)startTimers:(id)sender
{
    sound0 = [[CPSound alloc] initWithContentsOfFile:"Resources/test-8000-le-2ch-1byteu.wav" 
                                         byReference:NO];
    sound1 = [[CPSound alloc] initWithContentsOfFile:"Resources/one.wav" 
                                         byReference:NO];
    sound2 = [[CPSound alloc] initWithContentsOfFile:"Resources/two.wav" 
                                         byReference:NO];
    sound3 = [[CPSound alloc] initWithContentsOfFile:"Resources/three.wav" 
                                         byReference:NO];
    var totalPeriod = [slider1 intValue] + [slider2 intValue];
    var now = [CPDate dateWithTimeIntervalSinceNow:0];
    var date1 = [[CPDate alloc] initWithTimeInterval:[slider1 intValue] 
                                           sinceDate:now];
    var date2 = [[CPDate alloc] initWithTimeInterval:([slider1 intValue] + [slider2 intValue]) 
                                           sinceDate:now];
    var date3 = [[CPDate alloc] initWithTimeInterval:([slider1 intValue] + [slider2 intValue] - [slider3 intValue])
                                           sinceDate:now];
    console.log("now: " + now);
    console.log("date1: " + date1);
    console.log("date2: " + date2);
    console.log("date3: " + date3);
    console.log("total period: " + totalPeriod);
    console.log("slider1 delay: " + [slider1 intValue]);
    [sound0 play];
    timer1 = [[CPTimer alloc] initWithFireDate:date1
                                      interval:totalPeriod
                                      callback:function() {
                                          console.log('timer1 fired');
                                          [sound1 play];
                                      }
                                       repeats:YES];
    timer2 = [[CPTimer alloc] initWithFireDate:date2
                                      interval:totalPeriod
                                      callback:function() {
                                          console.log('timer2 fired');
                                          [sound2 play];
                                      }
                                       repeats:YES];
    timer3 = [[CPTimer alloc] initWithFireDate:date3
                                      interval:totalPeriod
                                      callback:function() {
                                          console.log('timer3 fired');
                                          [sound3 play];
                                      }
                                       repeats:YES];
    var runLoop = [CPRunLoop currentRunLoop];
    [runLoop addTimer:timer1 forMode:CPDefaultRunLoopMode];
    [runLoop addTimer:timer2 forMode:CPDefaultRunLoopMode];
    [runLoop addTimer:timer3 forMode:CPDefaultRunLoopMode];
    console.log("timer1 fire date: " + [timer1 fireDate]);
    console.log("timer2 fire date: " + [timer2 fireDate]);
    console.log("timer3 fire date: " + [timer3 fireDate]);
    console.log("sound0 load status: " + sound0._loadStatus);
    console.log("sound1 load status: " + sound1._loadStatus);
    console.log("sound2 load status: " + sound2._loadStatus);
    console.log("sound3 load status: " + sound3._loadStatus);
}

- (@action)stopTimers:(id)sender
{
    [timer1 invalidate];
    [timer2 invalidate];
    [timer3 invalidate];
    console.log("stopped timer1");
    console.log("stopped timer2");
    console.log("stopped timer3");
}

@end
