#include "ComingSoonListController.h"
#import <UIKit/UIKit.h>
#import "../../../Utility/colorWithHex.h"
#import "../../../Utility/NSTask.h"
#import "../../ThemeCell.h"

@implementation ComingSoonListController

-(void)viewDidLoad {
	[super viewDidLoad];
	
	CGRect Frame = CGRectMake(20, 0, UIScreen.mainScreen.bounds.size.width - 40, UIScreen.mainScreen.bounds.size.height);

	UILabel *ComingSoon = [[UILabel alloc] initWithFrame:Frame];
	ComingSoon.numberOfLines = 100;

	ComingSoon.translatesAutoresizingMaskIntoConstraints = NO;
	ComingSoon.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
	ComingSoon.text = [NSString stringWithFormat:@"Coming soon! your support ticket is %u. (its all just fun and giggles (^_^)", arc4random_uniform(3000)];
	[self.view addSubview: ComingSoon];

    [self reloadSpecifiers];
	
}



@end