
#import "ClockAppDelegate.h"
#import "ClockDisplay.h"

@implementation ClockAppDelegate

@synthesize window, display;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
		
	[self.window makeKeyAndOrderFront:nil];
	
	timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateDisplay:) userInfo:NULL repeats:YES];
}


- (void)updateDisplay:(NSTimer *)myTimer
{
	display.date = [NSDate date];
}

@end
