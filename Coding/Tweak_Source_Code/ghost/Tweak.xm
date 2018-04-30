#define BUNDLE_ID "com.tko-cuber.ghost"  // used for my awful DRM later on maybe
#define PLIST_PATH @"/var/mobile/Library/Preferences/Ghost.plist"

inline bool GetPrefBool(NSString *key) {
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

  %hook SBDockView  //hides the dock background
    - (void)setBackgroundAlpha:(double)arg1 {
        if(GetPrefBool(@"kDock")) {
            %orig(0.0);
        }
      }
  %end

    %hook SBIconListPageControl //hide page dots
        - (id)initWithFrame:(CGRect)arg1 {
            if(GetPrefBool(@"kDots")) {
              }
              else {
                return NULL;
            }
          return 0;
        }
    %end

    %hook _UILegibilityImageView //hide app names on SB
        - (void)setImage:(id)arg1 {
          if(GetPrefBool(@"kNames")) {
            }
            else {
              %orig(NULL);
            }
          }
    %end

      %hook SpringBoard
        -(void)applicationDidFinishLaunching:(id)application {
            %orig;
        if ([[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/com.tko-cuber.ghost.list"])
        {
          //we good bois
        }
        else
        {
          UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unofficial Copy of Ghost"
            message:@"Hey there! It would appear you are using a copy of Ghost from an unofficial repo. Please redownload from https://tko-cuber.github.io if you would. Thanks for understanding!"
             delegate:nil
             cancelButtonTitle:@"Gotcha"
             otherButtonTitles:nil];
             [alert show];
             [alert release];
        }
      }
      %end
