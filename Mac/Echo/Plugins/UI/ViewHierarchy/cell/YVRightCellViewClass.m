//
//  YVRightCellViewFrame.m
//  YourView
//
//  Created by bliss_ddo on 2019/5/6.
//  Copyright © 2019 bliss_ddo. All rights reserved.
//

#import "YVRightCellViewClass.h"

@implementation YVRightCellViewClass

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

-(void)fillData:(NSDictionary*)data
{
    NSString *inherit = data[@"inherit"] ?: @"";
    NSString *viewController = data[@"assign_to_viewcontroller"];
    NSString *address = data[@"address"];
    NSString *content = [NSString stringWithFormat:@"%@\nUIViewController: %@\nAddress: %@", inherit, viewController, address];
    self.clsInfoLabel.stringValue = content;
}

@end
