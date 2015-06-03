//
//  ViewController.m
//  MSCRevealTest
//
//  Created by Marijn Schilling on 03/06/15.
//  Copyright (c) 2015 marijn. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+Reveal.h"

CGFloat dotWidth;

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property(nonatomic, strong) NSArray *colorArray;
@property(nonatomic) CGFloat counter;
@property(nonatomic) BOOL addColor;
@end

@implementation ViewController

- (instancetype)initWithColorArray:(NSArray *)colorArray {
    self = [super init];
    if (self) {

        self.colorArray = colorArray;

        self.addColor = YES;
    }

    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor clearColor]];

    self.scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollView.delegate = self;
    [self.scrollView setBackgroundColor:[UIColor clearColor]];

    [self.scrollView setContentSize:CGSizeMake(1000, 1000)];

    [self.view addSubview:self.scrollView];

    dotWidth = 100;
    
    self.counter = 0;

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(self.counter >=100){
        return;
    }

    UIView *dotView = [[UIView alloc] initWithFrame:CGRectMake((CGFloat) (scrollView.bounds.origin.x + (self.scrollView.bounds.size.width*0.5)-(dotWidth *0.5)), (CGFloat) (scrollView.bounds.origin.y + (self.scrollView.bounds.size.height*0.5) - (dotWidth *0.5)), dotWidth, dotWidth)];


    UIColor *averageColor = [UIColor averageColorWithColor:self.colorArray[0] andColor:self.colorArray[1] alpha:self.counter/100];


    dotView.layer.cornerRadius = (CGFloat) (dotWidth *0.5);
    dotView.layer.masksToBounds = YES;
    [dotView setAlpha:0.2];
    [dotView setBackgroundColor:averageColor];
    [self.scrollView addSubview:dotView];
    self.counter++;
//    if(self.addColor){
//        self.counter++;
//        if(self.counter >=100){
//                self.addColor = NO;
//        }
//    } else {
//        self.counter--;
//        if (self.counter <= 0){
//            self.addColor = YES;
//        }
//    }

}


@end
