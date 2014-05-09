//
//  House.m
//  OhTheThingsYouWillSee
//
//  Created by CS491 on 5/9/14.
//  Copyright (c) 2014 Center for Advanced Public Safety. All rights reserved.
//

#import "House.h"

@implementation House

-(void)openDoor{
    [_delegate didOpenDoor];
}
@end
