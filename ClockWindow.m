#import "ClockWindow.h"


@implementation ClockWindow

- (id)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)windowStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)deferCreation
{
	self = [super initWithContentRect:contentRect styleMask:NSBorderlessWindowMask backing:bufferingType defer:deferCreation];	
	return self;
}

- (void)awakeFromNib
{
	[self setHasShadow:NO];
	[self setAlphaValue:0.2];
	[self setOpaque:NO];
	[self setBackgroundColor:[NSColor clearColor]];	
	[self setLevel:kCGDesktopIconWindowLevel - 1];
	[self center];		
}

@end
