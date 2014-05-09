//
//  House.h
//  OhTheThingsYouWillSee
//
//  Created by CS491 on 5/9/14.
//  Copyright (c) 2014 Center for Advanced Public Safety. All rights reserved.
//

#import <Foundation/Foundation.h>

//How you define a protocol
//A protocol establishes a "contract" of sorts between two classes
@protocol HouseDelegate <NSObject>

//How you define a protocol method
-(void)didOpenDoor;

@end


@interface House : NSObject

-(void)openDoor;

//How you define a delegate
@property id<HouseDelegate> delegate;

@end



