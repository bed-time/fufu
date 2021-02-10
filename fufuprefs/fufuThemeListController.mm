#include "fufuThemeListController.h"
#import <UIKit/UIKit.h>
#import <spawn.h>

@implementation fufuThemeListController

-(NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"ThemeList" target:self];
	}


	for (NSString *theme in [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Application Support/Fufu/" error:nil]) {

		NSString *themePath = [NSString stringWithFormat:@"/Library/Application Support/Fufu/%@/", theme];

		if ([[NSFileManager defaultManager] fileExistsAtPath:themePath]) {
			if ([[themePath pathExtension] isEqualToString: @"fufu"]) {

				//Get the theme name, and remove the "".fufu" extension

				NSString *themeName = (theme);
				themeName = [themeName substringToIndex:(themeName.length - 5)];

				//Make cell

				PSSpecifier* specifier = [PSSpecifier preferenceSpecifierNamed:themeName target:self set:nil get:nil detail:nil cell:PSLinkListCell edit:nil];
				[specifier setProperty:[fufuThemeCell class] forKey:@"cellClass"];
                [specifier setProperty:@YES forKey:@"enabled"];

				//Graphic
				[specifier setProperty:[NSNumber numberWithInt:76] forKey:@"height"];
				[specifier setProperty:[UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"/Library/Application Support/Fufu/%@.fufu/50.png", themeName]] forKey:@"iconImage"];
				[_specifiers addObject:specifier];

        	}
		}
	}

	return _specifiers;
}

static void pickAPhrase() {
	int randomNumber = arc4random_uniform(5);
	if (randomNumber == 4)  { phrase = @"    you again?"; }
	if (randomNumber == 3)  { phrase = @"    HOW DARE YOU WAKE ME UP"; }
	if (randomNumber == 2)  { phrase = @"    tired of the other settings, huh"; }
	if (randomNumber == 1)  { phrase = @"    follow @DevBedtime on twitter"; }
	if (randomNumber == 0)  { phrase = @"    follow @74k1_ on twitter"; }
}

-(void)viewDidLoad {
	pickAPhrase();
	[super viewDidLoad];
	[self table].separatorStyle = UITableViewCellSeparatorStyleNone;

	UIView *headerView = [[UIView alloc] initWithFrame: CGRectMake(0, -45, UIScreen.mainScreen.bounds.size.width, 140)];
	headerView.backgroundColor = UIColor.clearColor;
	headerView.clipsToBounds = YES;
		
	// title
	CGRect frame = CGRectMake(0, 0, headerView.bounds.size.width, 65);
	UILabel *tweakTitle = [[UILabel alloc] initWithFrame:frame];
	tweakTitle.font = [UIFont systemFontOfSize:60 weight:UIFontWeightUltraLight];
	tweakTitle.text = @" Themes";
	tweakTitle.textColor = UIColor.whiteColor;
	tweakTitle.textAlignment = NSTextAlignmentLeft;
	tweakTitle.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
	[headerView addSubview:tweakTitle];
		
	// subtitle
	CGRect subtitleFrame = CGRectMake(0, 71, headerView.bounds.size.width, 30);
	UILabel *tweakSubtitle = [[UILabel alloc] initWithFrame:subtitleFrame];
	tweakSubtitle.font = [UIFont systemFontOfSize:16 weight:UIFontWeightLight];
	tweakSubtitle.text = phrase;
	tweakSubtitle.textColor = [UIColor colorWithWhite:1 alpha:0.33];
	tweakSubtitle.textAlignment = NSTextAlignmentLeft;
	tweakSubtitle.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
	[headerView addSubview:tweakSubtitle];
	self.table.tableHeaderView = headerView;

	[self reloadSpecifiers];

	
	
}

@end
