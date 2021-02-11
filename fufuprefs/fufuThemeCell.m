#import "fufuThemeCell.h"
#import <Preferences/PSSpecifier.h>

@implementation fufuThemeCell {
	UIImageView *themeImage;
    UIImageView *icon;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        CGFloat inset = 20;

        //image
        themeImage = [[UIImageView alloc] initWithImage:specifier.properties[@"iconImage"]];
        themeImage.frame = CGRectMake(0 - inset, 0 - inset, self.bounds.size.height + (inset*4), self.bounds.size.height + (inset*4));
        themeImage.contentMode = UIViewContentModeScaleAspectFill;
        themeImage.userInteractionEnabled = NO;

        icon = [[UIImageView alloc] initWithImage:specifier.properties[@"iconImage"]];
        icon.frame = CGRectMake(11, 11, 46, 46);
        icon.contentMode = UIViewContentModeScaleAspectFill;
        icon.userInteractionEnabled = NO;

        //blur
        UIVisualEffect *blurEffect;
        blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *blur = [[UIVisualEffectView alloc] initWithEffect:blurEffect];

        //inserting
        blur.frame = CGRectMake(0, 0, self.bounds.size.width * 2, 76);
        blur.userInteractionEnabled = NO;
        [self.contentView addSubview:themeImage];
        [self.contentView.superview addSubview:blur];
        [blur.subviews[0] addSubview:icon];
        icon.clipsToBounds = YES;

        //other
        blur.subviews[1].alpha = 0;
        self.imageView.hidden = YES;

        self.clipsToBounds = YES;
        icon.layer.shadowRadius  = 10.0f;
        icon.layer.shadowColor   = [UIColor blackColor].CGColor;
        icon.layer.shadowOffset  = CGSizeMake(0.0f, 0.0f);
        icon.layer.shadowOpacity = 0.4f;
        icon.layer.masksToBounds = NO;

        //gesture to enable
    }
    return self;
}

-(instancetype)initWithSpecifier:(PSSpecifier *)specifier {
	self = [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil specifier:specifier];
	return self;
}



@end