#include "fufuRootListController.h"
#import <UIKit/UIKit.h>

@implementation fufuRootListController
-(NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}
	return _specifiers;
}

//////////////////////////////////////////////////////
//Get a random sentance
//////////////////////////////////////////////////////

static void pickAPhrase() {
	int randomNumber = arc4random_uniform(21);

	if (randomNumber == 20) { phrase = @"#MagicIsOurPup"; }
	if (randomNumber == 19) { phrase = @"Poochiman"; }
	if (randomNumber == 18) { phrase = @"#dadjokes"; }
	if (randomNumber == 17) { phrase = @"go wear some headphones."; }
	if (randomNumber == 16) { phrase = @"bedtime has speakers"; }
	if (randomNumber == 15) { phrase = @"dada is cool"; }
	if (randomNumber == 14) { phrase = @"i love my pillow!"; }
	if (randomNumber == 13) { phrase = @"bedtime beats"; }
	if (randomNumber == 12) { phrase = @"RGB Rules"; }
	if (randomNumber == 11) { phrase = @"PIANO"; }
	if (randomNumber == 10) { phrase = @"dogs are cool."; }
	if (randomNumber == 9)  { phrase = @"kleine Bettzeit"; }
	if (randomNumber == 8)  { phrase = @"party = nil"; }
	if (randomNumber == 7)  { phrase = @"cats are cool."; }
	if (randomNumber == 6)  { phrase = @":KanaGun:"; }
	if (randomNumber == 5)  { phrase = @"https://discord.gg/JJdDj4w4yX"; }
	if (randomNumber == 4)  { phrase = @"rottweilers are nice bois!"; }
	if (randomNumber == 3)  { phrase = @"r/rottweiler"; }
	if (randomNumber == 2)  { phrase = @"hehe doggogy woggogy doggo"; }
	if (randomNumber == 1)  { phrase = @"jaiwbweak :3"; }
	if (randomNumber == 0)  { phrase = @"-(void)HEWWO"; }
}

//////////////////////////////////////////////////////
//Title
//////////////////////////////////////////////////////

-(void)viewDidLoad {
	pickAPhrase();
	[super viewDidLoad];
	[self table].separatorStyle = UITableViewCellSeparatorStyleNone;

	UIView *headerView = [[UIView alloc] initWithFrame: CGRectMake(0, -45, 320, 140)];
	headerView.backgroundColor = UIColor.clearColor;
	headerView.clipsToBounds = YES;
		
	// title
	CGRect frame = CGRectMake(0, 0, headerView.bounds.size.width, 65);
	UILabel *tweakTitle = [[UILabel alloc] initWithFrame:frame];
	tweakTitle.font = [UIFont systemFontOfSize:70 weight:UIFontWeightUltraLight];
	tweakTitle.text = @"fufu";
	tweakTitle.textColor = UIColor.whiteColor;
	tweakTitle.textAlignment = NSTextAlignmentCenter;
	tweakTitle.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
	[headerView addSubview:tweakTitle];
		
	// subtitle
	CGRect subtitleFrame = CGRectMake(0, 71, headerView.bounds.size.width, 30);
	UILabel *tweakSubtitle = [[UILabel alloc] initWithFrame:subtitleFrame];
	tweakSubtitle.font = [UIFont systemFontOfSize:16 weight:UIFontWeightLight];
	tweakSubtitle.text = phrase;
	tweakSubtitle.textColor = [UIColor colorWithWhite:1 alpha:0.33];
	tweakSubtitle.textAlignment = NSTextAlignmentCenter;
	tweakSubtitle.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
	[headerView addSubview:tweakSubtitle];
	self.table.tableHeaderView = headerView;

	[self reloadSpecifiers];

	/*
	
	self.navigationController.navigationController.navigationBar.barTintColor = [UIColor clearColor];

	CGRect navbarposition = self.navigationController.navigationController.navigationBar.bounds;
	navbarposition.origin.y = UIScreen.mainScreen.bounds.size.height - navbarposition.size.height - 22;
	navbarposition.origin.x = 22;
	self.navigationController.navigationController.navigationBar.frame = navbarposition;

	self.navigationController.navigationController.navigationBar.subviews[0].alpha = 0;

	*/
}


//////////////////////////////////////////////////////
//Navigation Bar
//////////////////////////////////////////////////////

-(instancetype)init {
    self = [super init];
    if (self) {
        HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
        appearanceSettings.tintColor = [UIColor colorWithRed: 1.00 green: 0.29 blue: 0.29 alpha: 1.00];
        self.hb_appearanceSettings = appearanceSettings;
    }
    return self;
}

@end

