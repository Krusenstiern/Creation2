/*****************************************************************************
 * VLCSettingsController.m
 * VLC for iOS
 *****************************************************************************
 * Copyright (c) 2013 VideoLAN. All rights reserved.
 * $Id$
 *
 * Authors: Felix Paul Kühne <fkuehne # videolan.org>
 *          Gleb Pinigin <gpinigin # gmail.com>
 *          Carola Nitz <nitz.carola # googlemail.com>
 *
 * Refer to the COPYING file of the official project for license.
 *****************************************************************************/

#import "VLCSettingsController.h"
#import "C5MPAppDelegate.h"
#import "IASKSettingsReader.h"
#import "IASKAppSettingsViewController.h"

@interface VLCSettingsController () <IASKSettingsDelegate>
@end

@implementation VLCSettingsController

- (id)init
{
    self = [super init];
    if (self)
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(settingDidChange:) name:kIASKAppSettingChanged object:nil];

    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)settingDidChange:(NSNotification*)notification
{
//    if ([notification.object isEqual:kVLCSettingPasscodeOnKey]) {
//        BOOL passcodeOn = [[notification.userInfo objectForKey:kVLCSettingPasscodeOnKey] boolValue];
//
//        if (passcodeOn) {
//            PAPasscodeViewController *passcodeLockController = [[PAPasscodeViewController alloc] initForAction:PasscodeActionSet];
//            passcodeLockController.delegate = self;
//            [self.viewController presentViewController:passcodeLockController animated:YES completion:nil];
//        }
//    }
}

- (void)settingsViewControllerDidEnd:(IASKAppSettingsViewController*)sender
{
//    [[(VLCAppDelegate*)[UIApplication sharedApplication].delegate revealController] toggleSidebar:![(VLCAppDelegate*)[UIApplication sharedApplication].delegate revealController].sidebarShowing duration:kGHRevealSidebarDefaultAnimationDuration];
}

- (void)settingsViewController:(IASKAppSettingsViewController*)sender buttonTappedForSpecifier:(IASKSpecifier*)specifier {
//    if ([specifier.key isEqualToString:@"UnlinkDropbox"]) {
//        [[DBSession sharedSession] unlinkAll];
//    } else if ([specifier.key isEqualToString:@"UnlinkGoogleDrive"]) {
//        [[VLCGoogleDriveController sharedInstance] logout];
//    }
}


@end