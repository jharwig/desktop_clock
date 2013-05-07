

#import <QuartzCore/QuartzCore.h>


@interface ClockDisplay : NSView {
	NSDateFormatter *dateFormatter;
	NSDictionary *attributes;
	NSDate *date;	
}

@property (retain, nonatomic) NSDate *date;

@end
