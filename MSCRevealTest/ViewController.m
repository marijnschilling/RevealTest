//
//  ViewController.m
//  MSCRevealTest
//
//  Created by Marijn Schilling on 03/06/15.
//  Copyright (c) 2015 marijn. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

CGFloat dotWidth;

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property(nonatomic, strong) NSArray *colorArray;
@property(nonatomic) int counter;
@end

@implementation ViewController

- (instancetype)initWithColorArray:(NSArray *)colorArray {
    self = [super init];
    if (self) {
        
        self.colorArray = colorArray;
    }

    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor whiteColor]];

    self.scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollView.delegate = self;
    [self.scrollView setBackgroundColor:[UIColor blackColor]];

    [self.view addSubview:self.scrollView];

    [self.scrollView setContentSize:CGSizeMake(1000, 1000)];
    
    dotWidth = 100;
    
    self.counter = 0;

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    UIView *dotView = [[UIView alloc] initWithFrame:CGRectMake((CGFloat) (scrollView.bounds.origin.x + (self.scrollView.bounds.size.width*0.5)-(dotWidth *0.5)), (CGFloat) (scrollView.bounds.origin.y + (self.scrollView.bounds.size.height*0.5) - (dotWidth *0.5)), dotWidth, dotWidth)];

    UIView *color1 = [[UIView alloc] initWithFrame:CGRectMake(0,0, dotWidth, dotWidth)];
    [color1 setBackgroundColor:self.colorArray[0]];
    [color1 setAlpha : self.counter/ 100 ];
    color1.layer.cornerRadius = (CGFloat) (dotWidth *0.5);
    color1.layer.masksToBounds = YES;
    UIView *color2 = [[UIView alloc] initWithFrame:CGRectMake(0,0, dotWidth, dotWidth)];

    [color2 setBackgroundColor:self.colorArray[1]];
    [color2 setAlpha:1-color1.alpha];
    color2.layer.cornerRadius = (CGFloat) (dotWidth *0.5);
    color2.layer.masksToBounds = YES;
    [dotView addSubview:color1];
    [dotView addSubview:color2];

    dotView.layer.cornerRadius = (CGFloat) (dotWidth *0.5);
    dotView.layer.masksToBounds = YES;
    [dotView setAlpha:0.2];
    [self.scrollView addSubview:dotView];
    self.counter++;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
