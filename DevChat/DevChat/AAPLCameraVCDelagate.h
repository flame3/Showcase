//
//  AAPLCameraVCDelagate.h
//  DevChat
//
//  Created by nic on 14/11/2016.
//  Copyright © 2016 nicksdev. All rights reserved.
//

#ifndef AAPLCameraVCDelagate_h
#define AAPLCameraVCDelagate_h

@protocol AAPLCameraVCDelegate <NSObject>

-(void) shouldEnableRecordUI:(BOOL)enable;
-(void) shouldEnableCameraUI:(BOOL)enable;
-(void) recordingHasStarted;
-(void) canStartRecording;
@end

#endif /* AAPLCameraVCDelagate_h */
