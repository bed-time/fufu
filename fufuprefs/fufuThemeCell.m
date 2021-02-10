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

        icon = [[UIImageView alloc] initWithImage:specifier.properties[@"iconImage"]];
        icon.frame = CGRectMake(10, 10, 56, 56);
        icon.contentMode = UIViewContentModeScaleAspectFill;

        //blur
        UIVisualEffect *blurEffect;
        blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *blur = [[UIVisualEffectView alloc] initWithEffect:blurEffect];

        //inserting
        blur.frame = CGRectMake(0, 0, self.bounds.size.width * 2, 76);
        [self.contentView addSubview:themeImage];
        [self.contentView.superview addSubview:blur];
        [blur.subviews[0] addSubview:icon];
        icon.clipsToBounds = YES;

        //other
        blur.subviews[1].alpha = 0;
        self.imageView.hidden = YES;

        self.clipsToBounds = YES;
        self.layer.cornerRadius = 36;
        icon.layer.cornerRadius = 26;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    frame.origin.x = frame.origin.x + 10;
    frame.size.width = frame.size.width - 20;
    self.contentView.frame = frame;

    return self;
}

-(instancetype)initWithSpecifier:(PSSpecifier *)specifier {
	self = [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil specifier:specifier];
	return self;
}



@end