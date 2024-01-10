//
//  ViewController.h
//  meow
//
//  Created by Gaurav Sara on 10/01/24.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController : UIViewController {
    SystemSoundID soundID;
}

@property (weak, nonatomic) IBOutlet UILabel *labelView;
- (IBAction)buttonTapped:(id)sender;

@end

