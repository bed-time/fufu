//Fufu
#import <UIKit/UIKit.h>
#import "Utility/Fufu.h"

BOOL dpkgInvalid = NO;
NSMutableDictionary * FufuPrefs;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void loadPreferences() {
    //Get prefs
    if (![[NSFileManager defaultManager] fileExistsAtPath:@"/var/mobile/Library/Preferences/luv.bedtime.FufuPrefs.plist"]) {
        //If the plist doesn't exist, make it with default values.
        FufuPrefs = [[NSMutableDictionary alloc] init];

        [FufuPrefs setObject:[NSString stringWithFormat:@"/Library/Application Support/Fufu/Example.fufu/"] forKey:@"themepath"];

        [FufuPrefs writeToFile:@"/var/mobile/Library/Preferences/luv.bedtime.FufuPrefs.plist" atomically:YES];
    } else {
        FufuPrefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/luv.bedtime.FufuPrefs.plist"];
    }
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

	if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
		[FufuView setImage:[UIImage imageWithContentsOfFile:path]];
	}


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