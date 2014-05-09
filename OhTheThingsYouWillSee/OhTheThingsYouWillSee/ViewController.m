//
//  ViewController.m
//  OhTheThingsYouWillSee
//
//  Created by Matthew York on 5/9/14.
//  Copyright (c) 2014 Center for Advanced Public Safety. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Set slider properties
    _slider.tintColor = [UIColor redColor];
    [_slider addTarget:self action:@selector(sliderValueDidChange:) forControlEvents:UIControlEventValueChanged];
    
    //Create button
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 200, 50)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"My Button" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(didTapMyButton:) forControlEvents:UIControlEventTouchUpInside];
    //Show button
    [self.view addSubview:button];
    
    //Test protocols
    House *myHouse = [[House alloc] init];
    myHouse.delegate = self;
    [myHouse openDoor];
    
    //Create alert
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"My Alert" message:@"My Message" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    //Show Alert
    [alert show];
}

#pragma mark - House Delegate
-(void)didOpenDoor{
    NSLog(@"Did Open Door");
}

#pragma mark - UIAlertView Delegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //Button index works from left most button (index 0) to right most button
    
    if (buttonIndex == 1) { //YES
        NSLog(@"Did press yes");
    }
    else {
        NSLog(@"Did press no");
    }
}

-(void)viewDidAppear:(BOOL)animated{
    //Test animations
    //[self animateDown];
}

-(void)animateDown{
    [UIView animateWithDuration:1.0 animations:^{
        _slider.center = self.view.center;
    } completion:^(BOOL finished) {
        [self animateUp]; //Loop back to animating up
    }];
}

-(void)animateUp{
    [UIView animateWithDuration:1.0 animations:^{
        _slider.center = CGPointMake(_slider.center.x, 30);
    } completion:^(BOOL finished) {
        [self animateDown]; //Loop back to animating down
    }];
}

-(void)didTapMyButton:(UIButton *)sender{
    NSLog(@"Did Tap Button");
    [sender setTitle:@"Did Tap Button" forState:UIControlStateNormal];
}

-(void)sliderValueDidChange:(UISlider *)slider {
    _valueLabel.text = [NSString stringWithFormat:@"%f", slider.value];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Datasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
