#import "fufuThemeCell.h"
#import <Preferences/PSSpecifier.h>
#import <Foundation/NSUserDefaults.h>

@implementation fufuThemeCell {
	UIImageView *themeImage;
    UIImageView *icon;
    NSString *name;
    NSString *type;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;
        CGFloat inset = 20;

        name = specifier.properties[@"name"];
        type = specifier.properties[@"type"];

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
        blur.userInteractionEnabled = YES;
        [self.contentView addSubview:themeImage];
        [self.contentView.superview addSubview:blur];
        [blur.subviews[0] addSubview:icon];
        icon.clipsToBounds = YES;

        //other
        blur.subviews[1].alpha = 0;
        self.imageView.hidden = YES;
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 30;
        
        if (@available(iOS 13.0, *)) { self.layer.cornerCurve = kCACornerCurveContinuous; }
        else { self.layer.continuousCorners = YES; }

        icon.layer.shadowRadius  = 10.0f;
        icon.layer.shadowColor   = [UIColor blackColor].CGColor;
        icon.layer.shadowOffset  = CGSizeMake(0.0f, 0.0f);
        icon.layer.shadowOpacity = 0.3f;
        icon.layer.masksToBounds = NO;

        //gesture to enable

        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(saveThemePreferences:)];
        tapGesture.numberOfTapsRequired = 1;
        [blur addGestureRecognizer:tapGesture];
    }
    return self;
}

-(instancetype)initWithSpecifier:(PSSpecifier *)specifier {
	self = [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil specifier:specifier];
	return self;
}

-(void)saveThemePreferences:(UITapGestureRecognizer *)tap {
    //thee path'eth

    NSMutableDictionary * _SavedTheme;

    /*if ([type isEqualToString:@"batt"]) {
        NSString *path = [NSString stringWithFormat:@"/Library/Application Support/Fufu/%@.fufu/batt", name];
    
        _SavedTheme = [[NSMutableDictionary alloc] init];
        [_SavedTheme setObject:path forKey:@"battthemepath"];

        [_SavedTheme writeToFile:@"/var/mobile/Library/Preferences/luv.bedtime.FufuPrefs.plist" atomically:YES];
    }
    if ([type isEqualToString:@"lte"]) {
        NSString *path = [NSString stringWithFormat:@"/Library/Application Support/Fufu/%@.fufu/lte", name];
    
        _SavedTheme = [[NSMutableDictionary alloc] init];
        [_SavedTheme setObject:path forKey:@"ltepath"];

        [_SavedTheme writeToFile:@"/var/mobile/Library/Preferences/luv.bedtime.FufuPrefs.plist" atomically:YES];
    }*/


    NSString *path = [NSString stringWithFormat:@"/Library/Application Support/Fufu/%@.fufu/batt", name];
    
    _SavedTheme = [[NSMutableDictionary alloc] init];
    [_SavedTheme setObject:path forKey:@"battthemepath"];

    [_SavedTheme writeToFile:@"/var/mobile/Library/Preferences/luv.bedtime.FufuPrefs.plist" atomically:YES];


    NSTask *respring = [[NSTask alloc] init];
    [respring setLaunchPath:@"/usr/bin/killall"];
    [respring setArguments:[NSArray arrayWithObjects:@"-9", @"SpringBoard", nil]];
    [respring launch];
    
}

@end
