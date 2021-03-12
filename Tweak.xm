//Fufu
#import <UIKit/UIKit.h>
#import "Utility/Fufu.h"

NSMutableDictionary * FufuPrefs;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void loadPreferences() {
    //Get prefs
    FufuPrefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/luv.bedtime.FufuPrefs.plist"];
}

NSString *themebatt = FufuPrefs[@"themepath"];
NSString *uX = FufuPrefs[@"x"];
NSString *uY = FufuPrefs[@"y"];

NSString *HiddenBolt = FufuPrefs[@"hide"];


NSInteger XScaling = (float)[uX integerValue];
NSInteger YScaling = (float)[uY integerValue];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// BATTERY
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

%hook _UIBatteryView

-(void)_commonInit {
	%orig;

	FufuView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 12 + YScaling, 12 + XScaling)];
	[self addSubview:FufuView];

	self.pinColor = UIColor.clearColor;
	self.bodyColor = UIColor.clearColor;
	self.fillColor = UIColor.clearColor;

	if (HiddenBolt.boolValue == YES) {
		self.boltColor = UIColor.clearColor;
	}

}


-(void)setChargePercent: (CGFloat)percent {

    %orig;

	int Percent = floor(percent * 100);

	NSString *path = [NSString stringWithFormat:@"%@/batt/%d.png", themebatt, (int)lroundf(Percent)];
	[FufuView setImage:[UIImage imageWithContentsOfFile:path]];


	self.pinColor = UIColor.clearColor;
	self.bodyColor = UIColor.clearColor;
	self.fillColor = UIColor.clearColor;

	if (HiddenBolt.boolValue == YES) {
		self.boltColor = UIColor.clearColor;
	}

}

%end

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

%ctor {

  loadPreferences();
}