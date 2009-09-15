#import "ClockDisplay.h"


@implementation ClockDisplay

@synthesize date;

- (void)awakeFromNib
{
	dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setTimeStyle:NSDateFormatterShortStyle];
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];        
	
	attributes = [[NSDictionary dictionaryWithObjectsAndKeys:
				   [[NSColor whiteColor] colorWithAlphaComponent:1.0], NSForegroundColorAttributeName, 
				   [NSFont fontWithName:@"helvetica" size:70], NSFontAttributeName,
				   nil] retain];
		
	self.date = nil;	
}

- (void)setDate:(NSDate *)d
{
	[d retain];
	[date release];
	date = d;
	[self setNeedsDisplay:YES];
}


- (void)drawRect:(NSRect)r {	
	[[NSColor clearColor] set];
	NSRectFill(self.bounds);
		
	CGContextRef ctx = [[NSGraphicsContext currentContext] graphicsPort];
	CGContextSaveGState(ctx);

	// Size text
	NSString *text = [dateFormatter stringFromDate:date];
	NSSize size = [text sizeWithAttributes:attributes];	
	NSRect rect = NSMakeRect(self.bounds.size.width / 2.0 - size.width / 2.0, 
							 self.bounds.size.height / 2.0 - size.height / 2.0, 
							 size.width, 
							 size.height);
	
	// Shadow
	CGColorRef black = CGColorCreateGenericGray(0.0, 1.0);
	CGContextSetShadowWithColor(ctx, CGSizeMake(0, 1), 1.0, black);
	CGColorRelease(black);
	
	// Draw
	[text drawInRect:rect withAttributes:attributes];
			
	CGContextRestoreGState(ctx);
}

- (void) dealloc
{
	self.date = nil;
	[dateFormatter release];
	[attributes release];
	[super dealloc];
}


@end
