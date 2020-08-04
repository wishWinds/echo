// 
// Created by John Shu on 2020/8/4 16:42.
// Copyright © 2020 陈爱彬. All rights reserved.
//

#import "RightCellViewGestureRecognizers.h"

@implementation RightCellViewGestureRecognizers

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

-(void)fillData:(NSDictionary*)data
{
    NSString *gestures = [NSString stringWithFormat:@"%@", data[@"gestures"]];
    self.clsInfoLabel.stringValue = gestures;
}
@end
