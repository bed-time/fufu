//Fufu
#import <UIKit/UIKit.h>
#import "Fufu.h"

%hook _UIBatteryView

-(id)initWithFrame:(CGRect)frame {

    id orig = %orig;

    FufuView = [[UIImageView alloc] initWithFrame:CGRectMake(6, 0, 12, 12)];
	[self addSubview:FufuView];

    return orig;
}

-(void)setChargePercent: (CGFloat)percent {

    %orig;

	FufuView = [[UIImageView alloc] initWithFrame:CGRectMake(6, 0, 12, 12)];
	[self addSubview:FufuView];

	int Percent = floor(percent * 100);

	if (Percent > 90)                  { [FufuView setImage:[UIImage imageWithContentsOfFile:@"/Library/Application Support/Fufu/Example/100.png"]]; }
	if (Percent <= 90 && Percent > 80) { [FufuView setImage:[UIImage imageWithContentsOfFile:@"/Library/Application Support/Fufu/Example/90.png"]]; }
	if (Percent <= 80 && Percent > 70) { [FufuView setImage:[UIImage imageWithContentsOfFile:@"/Library/Application Support/Fufu/Example/80.png"]]; }
	if (Percent <= 70 && Percent > 60) { [FufuView setImage:[UIImage imageWithContentsOfFile:@"/Library/Application Support/Fufu/Example/70.png"]]; }
	if (Percent <= 60 && Percent > 50) { [FufuView setImage:[UIImage imageWithContentsOfFile:@"/Library/Application Support/Fufu/Example/60.png"]]; }
	if (Percent <= 50 && Percent > 40) { [FufuView setImage:[UIImage imageWithContentsOfFile:@"/Library/Application Support/Fufu/Example/50.png"]]; }
	if (Percent <= 40 && Percent > 30) { [FufuView setImage:[UIImage imageWithContentsOfFile:@"/Library/Application Support/Fufu/Example/40.png"]]; }
	if (Percent <= 30 && Percent > 20) { [FufuView setImage:[UIImage imageWithContentsOfFile:@"/Library/Application Support/Fufu/Example/30.png"]]; }
	if (Percent <= 20 && Percent > 10) { [FufuView setImage:[UIImage imageWithContentsOfFile:@"/Library/Application Support/Fufu/Example/20.png"]]; }
	if (Percent < 10)                  { [FufuView setImage:[UIImage imageWithContentsOfFile:@"/Library/Application Support/Fufu/Example/10.png"]]; }

}

%end

%hook _UIBatteryView

-(void)layoutSubviews {
    %orig;
    self.fillColor = [UIColor clearColor];
    self.bodyColor = [UIColor clearColor];
    self.pinColor = [UIColor clearColor];
}


%end