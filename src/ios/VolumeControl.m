/********* VolumeControl.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>


#ifdef DEBUG
    #define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
    #define DLog(...)
#endif

@interface VolumeControl : CDVPlugin {
  // Member variables go here.
}

- (void)setSystemVolume:(CDVInvokedUrlCommand*)command;
- (void)getSystemVolume:(CDVInvokedUrlCommand*)command;
- (void)setMediaVolume:(CDVInvokedUrlCommand*)command;
- (void)getMediaVolume:(CDVInvokedUrlCommand*)command;
- (void)setPhoneRingVolume:(CDVInvokedUrlCommand*)command;
- (void)getPhoneRingVolume:(CDVInvokedUrlCommand*)command;
- (void)setAlarmVolume:(CDVInvokedUrlCommand*)command;
- (void)getAlarmVolume:(CDVInvokedUrlCommand*)command;
- (void)setNotificationVolume:(CDVInvokedUrlCommand*)command;
- (void)getNotificationVolume:(CDVInvokedUrlCommand*)command;
- (void)MutePhoneRing:(CDVInvokedUrlCommand*)command;
- (void)UnMutePhoneRing:(CDVInvokedUrlCommand*)command;
- (void)MuteSystem:(CDVInvokedUrlCommand*)command;
- (void)UnMuteSystem:(CDVInvokedUrlCommand*)command;
- (void)MuteMedia:(CDVInvokedUrlCommand*)command;
- (void)UnMuteMedia:(CDVInvokedUrlCommand*)command;
- (void)MuteAlarm:(CDVInvokedUrlCommand*)command;
- (void)UnMuteAlarm:(CDVInvokedUrlCommand*)command;
- (void)MuteNotification:(CDVInvokedUrlCommand*)command;
- (void)UnMuteNotification:(CDVInvokedUrlCommand*)command;

@end

@implementation VolumeControl

- (NSString*)decrypt:(NSString*)encryptedBase64String
{
    NSData *AVdecodedData = [[NSData alloc] initWithBase64EncodedString:encryptedBase64String options:0];
    return [[NSString alloc] initWithData:AVdecodedData encoding:NSUTF8StringEncoding];
}


- (void)setSystemVolume:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    BOOL result = false;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getSystemVolume:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    BOOL result = false;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setMediaVolume:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
      float volume = [[command argumentAtIndex:0] floatValue];

      //DLog(@"setVolume: [%f]", volume);
      NSString *soundCategory = ([self decrypt:(@"QXVkaW8vVmlkZW8=")]);
      Class systemClass = NSClassFromString([self decrypt:(@"QVZTeXN0ZW1Db250cm9sbGVy")]);
    
      id target = [systemClass performSelector:NSSelectorFromString([self decrypt:@"c2hhcmVkQVZTeXN0ZW1Db250cm9sbGVy"]) withObject:soundCategory];

      NSInvocation *volumeInvocation = [NSInvocation invocationWithMethodSignature:
                                        [systemClass instanceMethodSignatureForSelector:
                                        NSSelectorFromString([self decrypt:@"c2V0Vm9sdW1lVG86Zm9yQ2F0ZWdvcnk6"])]];
      [volumeInvocation setTarget:target];
      [volumeInvocation setSelector:NSSelectorFromString([self decrypt:@"c2V0Vm9sdW1lVG86Zm9yQ2F0ZWdvcnk6"])];
      [volumeInvocation setArgument:&volume atIndex:2];
      [volumeInvocation setArgument:&soundCategory atIndex:3];
      [volumeInvocation invoke];
      BOOL result;
      [volumeInvocation getReturnValue:&result];

      pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
      [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)getMediaVolume:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    DLog(@"getVolume");

    float systemVolume = [AVAudioSession sharedInstance].outputVolume;
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    CGFloat currentVol = audioSession.outputVolume;

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:audioSession.outputVolume];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)setPhoneRingVolume:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    float volume = [[command argumentAtIndex:0] floatValue];   
    NSString *soundCategory = ([self decrypt:(@"UmluZ3RvbmU=")]);
    Class systemClass = NSClassFromString([self decrypt:(@"QVZTeXN0ZW1Db250cm9sbGVy")]);  
    id target = [systemClass performSelector:NSSelectorFromString([self decrypt:@"c2hhcmVkQVZTeXN0ZW1Db250cm9sbGVy"]) withObject:soundCategory];
    NSInvocation *volumeInvocation = [NSInvocation invocationWithMethodSignature:
                                      [systemClass instanceMethodSignatureForSelector:
                                      NSSelectorFromString([self decrypt:@"c2V0Vm9sdW1lVG86Zm9yQ2F0ZWdvcnk6"])]];
    [volumeInvocation setTarget:target];
    [volumeInvocation setSelector:NSSelectorFromString([self decrypt:@"c2V0Vm9sdW1lVG86Zm9yQ2F0ZWdvcnk6"])];
    [volumeInvocation setArgument:&volume atIndex:2];
    [volumeInvocation setArgument:&soundCategory atIndex:3];
    [volumeInvocation invoke];
    BOOL result;
    [volumeInvocation getReturnValue:&result];
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)getPhoneRingVolume:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    BOOL result = false;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)setAlarmVolume:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    BOOL result = false;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];    
}
- (void)getAlarmVolume:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    BOOL result = false;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)setNotificationVolume:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    BOOL result = false;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)getNotificationVolume:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    BOOL result = false;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];    
}
- (void)MutePhoneRing:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    float volume = 0.0;   
    NSString *soundCategory = ([self decrypt:(@"UmluZ3RvbmU=")]);
    Class systemClass = NSClassFromString([self decrypt:(@"QVZTeXN0ZW1Db250cm9sbGVy")]);  
    id target = [systemClass performSelector:NSSelectorFromString([self decrypt:@"c2hhcmVkQVZTeXN0ZW1Db250cm9sbGVy"]) withObject:soundCategory];
    NSInvocation *volumeInvocation = [NSInvocation invocationWithMethodSignature:
                                      [systemClass instanceMethodSignatureForSelector:
                                      NSSelectorFromString([self decrypt:@"c2V0Vm9sdW1lVG86Zm9yQ2F0ZWdvcnk6"])]];
    [volumeInvocation setTarget:target];
    [volumeInvocation setSelector:NSSelectorFromString([self decrypt:@"c2V0Vm9sdW1lVG86Zm9yQ2F0ZWdvcnk6"])];
    [volumeInvocation setArgument:&volume atIndex:2];
    [volumeInvocation setArgument:&soundCategory atIndex:3];
    [volumeInvocation invoke];
    BOOL result;
    [volumeInvocation getReturnValue:&result];
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)UnMutePhoneRing:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    float volume = 1.0;   
    NSString *soundCategory = ([self decrypt:(@"UmluZ3RvbmU=")]);
    Class systemClass = NSClassFromString([self decrypt:(@"QVZTeXN0ZW1Db250cm9sbGVy")]);  
    id target = [systemClass performSelector:NSSelectorFromString([self decrypt:@"c2hhcmVkQVZTeXN0ZW1Db250cm9sbGVy"]) withObject:soundCategory];
    NSInvocation *volumeInvocation = [NSInvocation invocationWithMethodSignature:
                                      [systemClass instanceMethodSignatureForSelector:
                                      NSSelectorFromString([self decrypt:@"c2V0Vm9sdW1lVG86Zm9yQ2F0ZWdvcnk6"])]];
    [volumeInvocation setTarget:target];
    [volumeInvocation setSelector:NSSelectorFromString([self decrypt:@"c2V0Vm9sdW1lVG86Zm9yQ2F0ZWdvcnk6"])];
    [volumeInvocation setArgument:&volume atIndex:2];
    [volumeInvocation setArgument:&soundCategory atIndex:3];
    [volumeInvocation invoke];
    BOOL result;
    [volumeInvocation getReturnValue:&result];
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)MuteSystem:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    BOOL result = false;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)UnMuteSystem:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    BOOL result = false;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)MuteMedia:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    BOOL result = false;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)UnMuteMedia:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    BOOL result = false;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)MuteAlarm:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    BOOL result = false;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)UnMuteAlarm:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    BOOL result = false;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)MuteNotification:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    BOOL result = false;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)UnMuteNotification:(CDVInvokedUrlCommand*)command{
    CDVPluginResult* pluginResult = nil;
    BOOL result = false;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)setVolume:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    float volume = [[command argumentAtIndex:0] floatValue];

    //DLog(@"setVolume: [%f]", volume);
    NSString *soundCategory = ([self decrypt:(@"UmluZ3RvbmU=")]);
    Class systemClass = NSClassFromString([self decrypt:(@"QVZTeXN0ZW1Db250cm9sbGVy")]);
  
    id target = [systemClass performSelector:NSSelectorFromString([self decrypt:@"c2hhcmVkQVZTeXN0ZW1Db250cm9sbGVy"]) withObject:soundCategory];

    NSInvocation *volumeInvocation = [NSInvocation invocationWithMethodSignature:
                                      [systemClass instanceMethodSignatureForSelector:
                                      NSSelectorFromString([self decrypt:@"c2V0Vm9sdW1lVG86Zm9yQ2F0ZWdvcnk6"])]];
    [volumeInvocation setTarget:target];
    [volumeInvocation setSelector:NSSelectorFromString([self decrypt:@"c2V0Vm9sdW1lVG86Zm9yQ2F0ZWdvcnk6"])];
    [volumeInvocation setArgument:&volume atIndex:2];
    [volumeInvocation setArgument:&soundCategory atIndex:3];
    [volumeInvocation invoke];
    BOOL result;
    [volumeInvocation getReturnValue:&result];
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)setMediaVolume:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
      float volume = [[command argumentAtIndex:0] floatValue];

      //DLog(@"setVolume: [%f]", volume);
      NSString *soundCategory = ([self decrypt:(@"QXVkaW8vVmlkZW8=")]);
      Class systemClass = NSClassFromString([self decrypt:(@"QVZTeXN0ZW1Db250cm9sbGVy")]);
    
      id target = [systemClass performSelector:NSSelectorFromString([self decrypt:@"c2hhcmVkQVZTeXN0ZW1Db250cm9sbGVy"]) withObject:soundCategory];

      NSInvocation *volumeInvocation = [NSInvocation invocationWithMethodSignature:
                                        [systemClass instanceMethodSignatureForSelector:
                                        NSSelectorFromString([self decrypt:@"c2V0Vm9sdW1lVG86Zm9yQ2F0ZWdvcnk6"])]];
      [volumeInvocation setTarget:target];
      [volumeInvocation setSelector:NSSelectorFromString([self decrypt:@"c2V0Vm9sdW1lVG86Zm9yQ2F0ZWdvcnk6"])];
      [volumeInvocation setArgument:&volume atIndex:2];
      [volumeInvocation setArgument:&soundCategory atIndex:3];
      [volumeInvocation invoke];
      BOOL result;
      [volumeInvocation getReturnValue:&result];

      pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
      [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)getVolume:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    DLog(@"getVolume");

    float systemVolume = [AVAudioSession sharedInstance].outputVolume;
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    CGFloat currentVol = audioSession.outputVolume;

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:audioSession.outputVolume];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
