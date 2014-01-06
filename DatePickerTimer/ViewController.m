//
//  ViewController.m
//  DatePickerTimer
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSTimer *timer;
    BOOL timerWorking;
}
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation ViewController

//각 초마다 1분씩 감소
- (void)tickDown:(NSTimer *)timer {
    self.datePicker.countDownDuration = self.datePicker.countDownDuration - 60;
    //1분 이내이면 정지
    if (self.datePicker.countDownDuration <= 60) {
        //1->0 으로 표시는?
        NSLog(@"Done!");
        [self stopTimer];
    }
}

- (void)startTimer {
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tickDown:) userInfo:nil repeats:YES];
}

- (void)stopTimer {
    [timer invalidate];
    timer = nil;
    timerWorking = NO;
}

- (IBAction)toggleTimer:(id)sender {
    //토글 버튼 설정
    NSString *title = timerWorking ? @"Start" : @"Stop";
    [sender setTitle:title forState:UIControlStateNormal];
    timerWorking = !timerWorking;
    
    if (timerWorking) {
        [self startTimer];
    }else {
        [self stopTimer];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
