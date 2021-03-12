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

	if (Percent > 90)                  { [FufuView setImage:[UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/batt/100.png", themebatt]]]; }
	if (Percent <= 90 && Percent > 80) { [FufuView setImage:[UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/batt/90.png", themebatt]]]; }
	if (Percent <= 80 && Percent > 70) { [FufuView setImage:[UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/batt/80.png", themebatt]]]; }
	if (Percent <= 70 && Percent > 60) { [FufuView setImage:[UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/batt/70.png", themebatt]]]; }
	if (Percent <= 60 && Percent > 50) { [FufuView setImage:[UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/batt/60.png", themebatt]]]; }
	if (Percent <= 50 && Percent > 40) { [FufuView setImage:[UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/batt/50.png", themebatt]]]; }
	if (Percent <= 40 && Percent > 30) { [FufuView setImage:[UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/batt/40.png", themebatt]]]; }
	if (Percent <= 30 && Percent > 20) { [FufuView setImage:[UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/batt/30.png", themebatt]]]; }
	if (Percent <= 20 && Percent > 10) { [FufuView setImage:[UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/batt/20.png", themebatt]]]; }
	if (Percent < 10)                  { [FufuView setImage:[UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/batt/10.png", themebatt]]]; }


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
  dpkgInvalid = ![[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/luv.bedtime.fufu.list"];
  if (!dpkgInvalid) dpkgInvalid = ![[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/luv.bedtime.fufu.md5sums"];

  loadPreferences();
}