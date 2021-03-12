#include "HomeListController.h"
#import <UIKit/UIKit.h>
#import "../Utility/colorWithHex.h"
#import "../Utility/NSTask.h"

@implementation HomeListController
-(NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}
	return _specifiers;
}

-(void)restartSpringBoard:(PSSpecifier *)specifier {
	NSTask *respring = [[NSTask alloc] init];
    [respring setLaunchPath:@"/usr/bin/killall"];
    [respring setArguments:[NSArray arrayWithObjects:@"-9", @"SpringBoard", nil]];
    [respring launch];
}

//////////////////////////////////////////////////////

//////////////////////////////////////////////////////
//Title
//////////////////////////////////////////////////////

-(void)viewDidLoad {
	[super viewDidLoad];
	[self table].separatorStyle = UITableViewCellSeparatorStyleNone;

	UIView *headerView = [[UIView alloc] initWithFrame: CGRectMake(0, -45, 320, 140)];
	headerView.backgroundColor = UIColor.redColor;
	headerView.clipsToBounds = YES;
	
	[super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Respring" style:UIBarButtonItemStyleDone target:self action:@selector(restartSpringBoard:)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor redColor];

	[self reloadSpecifiers];
}

-(UITableViewStyle)tableViewStyle {
    return UITableViewStyleInsetGrouped;
}

@end