//
//  ViewController.m
//  meow
//
//  Created by Gaurav Sara on 10/01/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *soundURL = [NSURL fileURLWithPath: [[NSBundle mainBundle] pathForResource:@"Cat" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID(( __bridge CFURLRef)soundURL, &soundID);
}


- (IBAction)buttonTapped:(id)sender {
    self.labelView.hidden = NO;
    
    AudioServicesPlaySystemSound(soundID);
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(hideLabel) userInfo:nil repeats:NO];
}

- (void)hideLabel {
    self.labelView.hidden = YES;
}
@end
