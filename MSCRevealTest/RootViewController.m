//
// Created by Marijn Schilling on 03/06/15.
// Copyright (c) 2015 marijn. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"


CGFloat buttonMargin;
CGFloat buttonWidth;

@interface RootViewController ()
@property(nonatomic, strong) NSMutableArray *colorArray;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    buttonMargin = 20;
    buttonWidth = ([UIScreen mainScreen].bounds.size.width - 4*buttonMargin)/3;

    self.title = [NSString localizedStringWithFormat:NSLocalizedString(@"COLOR_PICKER", nil)];
    
    self.colorArray = [NSMutableArray array];

    [self setButtons];

}

- (void)setButtons {

    for (int column = 0; column < 3; column++) {
        for (int row = 0; row < 3; row++) {

            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(buttonMargin + (column * (buttonWidth + buttonMargin)), buttonMargin + (row * (buttonWidth + buttonMargin)) + 64, buttonWidth, buttonWidth)];
            [button addTarget:self action:@selector(colorButtonClicked:) forControlEvents:UIControlEventTouchUpInside];

            CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
            CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
            CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black

            UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
            button.backgroundColor = color;

            [self.view addSubview:button];

        }
    }

}

- (void)colorButtonClicked:(UIButton *)colorButtonClicked {


    [self.colorArray addObject:colorButtonClicked.backgroundColor];

    if(self.colorArray.count >= 2){

        ViewController *videoPlayViewController = [[ViewController alloc] initWithColorArray:self.colorArray];

        [self.navigationController pushViewController:videoPlayViewController animated:YES];

    }

}


@end