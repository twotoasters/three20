//
//  TTUnderlinedTextStyle.m
//  Three20Style
//
//  Created by Jeremy Ellison on 6/21/10.
//  Copyright 2010 Two Toasters. All rights reserved.
//

#import "Three20Style/TTStrikethroughTextStyle.h"
#import "Three20Style/TTStyleContext.h"

@implementation TTStrikethroughTextStyle

- (id)initWithNext:(TTStyle*)next {
	if (self = [super initWithNext:next]) {
		_underlineWidth = 1.0;
		_percentageOfHeight = 0.50;
	}
	return self;
}

- (void)draw:(TTStyleContext*)context {
	[super draw:context];
	
	[_color setStroke];
	
    CGContextRef ctx = UIGraphicsGetCurrentContext();
	
	CGContextSetLineWidth(ctx, _underlineWidth);
	CGContextMoveToPoint(ctx,context.frame.origin.x, context.frame.origin.y + context.frame.size.height * _percentageOfHeight);
	CGContextAddLineToPoint(ctx, context.frame.origin.x + context.frame.size.width, context.frame.origin.y + context.frame.size.height * _percentageOfHeight);
	CGContextStrokePath(ctx);
	
    return [self.next draw:context];
}

@end

