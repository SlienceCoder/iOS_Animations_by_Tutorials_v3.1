//
//  FlightModel.h
//  Flight Info
//
//  Created by xpchina2003 on 2017/6/2.
//  Copyright © 2017年 xpchina2003. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlightModel : NSObject

@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *flightNr;
@property (nonatomic, copy) NSString *gateNr;
@property (nonatomic, copy) NSString *departingFrom;
@property (nonatomic, copy) NSString *arrivingTo;
@property (nonatomic, copy) NSString *weatherImageName;

@property (nonatomic, assign) BOOL showWeatherEffects;
@property (nonatomic, assign) BOOL isTakingOff;

@property (nonatomic, copy) NSString *flightStatus;
@end
