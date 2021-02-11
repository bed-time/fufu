#import "fufuSeperatorCell.h"
#import <Preferences/PSSpecifier.h>

@implementation fufuSeperatorCell 

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];
    if (self) {
        self.hidden = YES;
        self.userInteractionEnabled = NO;

    }
    return self;
}

-(instancetype)initWithSpecifier:(PSSpecifier *)specifier {
	self = [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil specifier:specifier];
	return self;
}



@end