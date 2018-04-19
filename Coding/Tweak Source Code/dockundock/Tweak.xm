/**

    DockUndock
      By TKO-Cuber on 4/18/18
        An awesome tweak to remove the dock, or "undock the dock"
        on iOS. Works with all versions of iOS 7, 8, 9, and 10,
        and confirmed works up to iOS 11.1.2.This tweak will
        continue to work as long as Apple doesn't rename the methods
        or class names.

**/


%hook SBDockView  //hook the SBDockView class, which is the one that handles the dock.
  -(void)setBackgroundAlpha:(double)arg1 {  //add the method we want to modify. In this case the one that sets the dock background.

    //DRM reeaal quick
  if ([[NSFileManager defaultManager] fileExistsAtPath:@"/var/mobile/Documents/TKO-Cuber/DockUndock"]) //If this file does exits, the DRM in my postinst detected an unofficial tweak.
  {
    UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"!WARNING!" //Display the warning PopUp
    message:@"It would appear you are using an unofficial copy of DockUndock! Unofficial (pirated) tweaks are often unstable and outdated, so please consider reinstalling the tweak from my official repo, https://tko-cuber.github.io/repo. Most, if not all of my tweaks are free, so it doesn't cost you anything :) Thanks for understanding."
    delegate:self
    cancelButtonTitle:@"I'll reinstall :)"
    otherButtonTitles:nil];
      [alert1 show];
      [alert1 release];
    }
  else //If the file indicating a pirated tweak doesn't exist, hide the dock with %orig(0.0);
    {
      %orig(0.0);
    }
  }
%end //end the hook
