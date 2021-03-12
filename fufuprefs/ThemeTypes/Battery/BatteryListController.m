#include "BatteryListController.h"
#import <UIKit/UIKit.h>
#import "../../../Utility/colorWithHex.h"
#import "../../../Utility/NSTask.h"
#import "../../ThemeCell.h"

@implementation BatteryListController

-(NSArray *)specifiers {

    if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Empty" target:self];
	}

	for (NSString *Theme in [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Application Support/Fufu/" error:nil]) {
		NSString *Path = [NSString stringWithFormat:@"/Library/Application Support/Fufu/%@/batt", Theme];
        NSLog(@"FUFU_PATH: %@", Path);
		if ([[NSFileManager defaultManager] fileExistsAtPath:Path]) {

			NSString *ThemeName = [Theme substringToIndex:(Theme.length - 5)];

			//Make A new cell
			PSSpecifier* specifier = [PSSpecifier preferenceSpecifierNamed:ThemeName target:self set:nil get:nil detail:nil cell:PSListItemCell edit:nil];
            //Set class
			[specifier setProperty:[ThemeCell class] forKey:@"cellClass"];
            [specifier setProperty:@YES forKey:@"enabled"];
			[specifier setProperty:[UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"/Library/Application Support/Fufu/%@.fufu/batt/100.png", ThemeName]] forKey:@"Image"];
			[specifier setProperty: ThemeName forKey:@"Name"];
			[specifier setProperty: @"Battery" forKey:@"Type"];

            PSSpecifier* seperator = [PSSpecifier preferenceSpecifierNamed:ThemeName target:self set:nil get:nil detail:nil cell:PSGroupCell edit:nil];
            [seperator setProperty:@YES forKey:@"enabled"];
            
			[_specifiers addObject:specifier];
		}
	}
	return _specifiers;
}

-(void)restartSpringBoard:(PSSpecifier *)specifier {
	NSTask *respring = [[NSTask alloc] init];
    [respring setLaunchPath:@"/usr/bin/killall"];
    [respring setArguments:[NSArray arrayWithObjects:@"-9", @"SpringBoard", nil]];
    [respring launch];
}

-(void)viewDidLoad {
	[super viewDidLoad];
	[self table].separatorStyle = UITableViewCellSeparatorStyleNone;
	
	[super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Respring" style:UIBarButtonItemStyleDone target:self action:@selector(restartSpringBoard:)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor redColor];

    [self reloadSpecifiers];
	
}



@end