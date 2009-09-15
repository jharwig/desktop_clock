
@class ClockDisplay;

@interface ClockAppDelegate : NSObject {
    NSWindow *window;
	ClockDisplay *display;
	NSTimer *timer;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet ClockDisplay *display;

@end
