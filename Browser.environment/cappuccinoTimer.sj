@STATIC;1.0;p;6;main.jt;267;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;181;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("AppController.j",YES);
main=function(_1,_2){
CPApplicationMain(_1,_2);
};
p;15;AppController.jt;4242;@STATIC;1.0;I;21;Foundation/CPObject.jI;25;AppKit/CPLevelIndicator.jI;20;Foundation/CPTimer.jt;4142;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("AppKit/CPLevelIndicator.j",NO);
objj_executeFile("Foundation/CPTimer.j",NO);
var _1=objj_allocateClassPair(CPObject,"AppController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("theWindow"),new objj_ivar("slider1"),new objj_ivar("slider2"),new objj_ivar("slider3"),new objj_ivar("field1"),new objj_ivar("field2"),new objj_ivar("field3"),new objj_ivar("button1"),new objj_ivar("button2"),new objj_ivar("button3"),new objj_ivar("level1"),new objj_ivar("level2"),new objj_ivar("level3"),new objj_ivar("sound1"),new objj_ivar("sound2"),new objj_ivar("sound3"),new objj_ivar("timer1"),new objj_ivar("timer2"),new objj_ivar("timer3")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("applicationDidFinishLaunching:"),function(_3,_4,_5){
with(_3){
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_6,_7){
with(_6){
objj_msgSend(theWindow,"setFullPlatformWindow:",YES);
objj_msgSend(field1,"setIntValue:",objj_msgSend(slider1,"intValue"));
objj_msgSend(field2,"setIntValue:",objj_msgSend(slider2,"intValue"));
objj_msgSend(field3,"setIntValue:",objj_msgSend(slider3,"intValue"));
}
}),new objj_method(sel_getUid("buttonClicked:"),function(_8,_9,_a){
with(_8){
var _b;
if(_a===button1){
_b=level1;
}else{
if(_a===button2){
_b=level2;
}else{
if(_a===button3){
_b=level3;
}else{
return;
}
}
}
var _c=objj_msgSend(_b,"intValue");
if(_c===objj_msgSend(_b,"maxValue")){
objj_msgSend(_b,"setIntValue:",objj_msgSend(_b,"minValue"));
}else{
objj_msgSend(_b,"setIntValue:",objj_msgSend(_b,"maxValue"));
}
}
}),new objj_method(sel_getUid("fieldChanged:"),function(_d,_e,_f){
with(_d){
var _10;
switch(_f){
case field1:
_10=slider1;
break;
case field2:
_10=slider2;
break;
case field3:
_10=slider3;
break;
}
objj_msgSend(_10,"setIntValue:",objj_msgSend(_f,"intValue"));
}
}),new objj_method(sel_getUid("startTimers:"),function(_11,_12,_13){
with(_11){
beep=objj_msgSend(objj_msgSend(CPSound,"alloc"),"initWithContentsOfFile:byReference:","Resources/test-8000-le-2ch-1byteu.wav",NO);
sound1=objj_msgSend(objj_msgSend(CPSound,"alloc"),"initWithContentsOfFile:byReference:","Resources/begin.wav",NO);
sound2=objj_msgSend(objj_msgSend(CPSound,"alloc"),"initWithContentsOfFile:byReference:","Resources/conclude.wav",NO);
sound3=objj_msgSend(objj_msgSend(CPSound,"alloc"),"initWithContentsOfFile:byReference:","Resources/walk.wav",NO);
var _14=objj_msgSend(slider1,"intValue")+objj_msgSend(slider2,"intValue");
var now=objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",0);
var _15=objj_msgSend(objj_msgSend(CPDate,"alloc"),"initWithTimeInterval:sinceDate:",objj_msgSend(slider1,"intValue"),now);
var _16=objj_msgSend(objj_msgSend(CPDate,"alloc"),"initWithTimeInterval:sinceDate:",(objj_msgSend(slider1,"intValue")+objj_msgSend(slider2,"intValue")-objj_msgSend(slider3,"intValue")),now);
var _17=objj_msgSend(objj_msgSend(CPDate,"alloc"),"initWithTimeInterval:sinceDate:",(objj_msgSend(slider1,"intValue")+objj_msgSend(slider2,"intValue")),now);
objj_msgSend(beep,"play");
objj_msgSend(sound3,"play");
timer1=objj_msgSend(objj_msgSend(CPTimer,"alloc"),"initWithFireDate:interval:callback:repeats:",_15,_14,function(){
objj_msgSend(sound1,"play");
},YES);
timer2=objj_msgSend(objj_msgSend(CPTimer,"alloc"),"initWithFireDate:interval:callback:repeats:",_16,_14,function(){
objj_msgSend(sound2,"play");
},YES);
timer3=objj_msgSend(objj_msgSend(CPTimer,"alloc"),"initWithFireDate:interval:callback:repeats:",_17,_14,function(){
objj_msgSend(sound3,"play");
},YES);
var _18=objj_msgSend(CPRunLoop,"currentRunLoop");
objj_msgSend(_18,"addTimer:forMode:",timer1,CPDefaultRunLoopMode);
objj_msgSend(_18,"addTimer:forMode:",timer2,CPDefaultRunLoopMode);
objj_msgSend(_18,"addTimer:forMode:",timer3,CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("stopTimers:"),function(_19,_1a,_1b){
with(_19){
objj_msgSend(timer1,"invalidate");
objj_msgSend(timer2,"invalidate");
objj_msgSend(timer3,"invalidate");
beep=objj_msgSend(objj_msgSend(CPSound,"alloc"),"initWithContentsOfFile:byReference:","Resources/test-8000-le-2ch-1byteu.wav",NO);
objj_msgSend(beep,"play");
}
})]);
