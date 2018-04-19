#import <sys/utsname.h>

NSString* deviceName()
{
    struct utsname systemInfo;
    uname(&systemInfo);

    return [NSString stringWithCString:systemInfo.machine
                              encoding:NSUTF8StringEncoding];
}

%hook SpringBoard //hook the SpingBoard
        -(void)applicationDidFinishLaunching:(id)application { //select the class we want to modify  -(void)applicationDidFinishLaunching:(id)application
            %orig; //VERY IMPORTANT WHEN MODIFYING A VOID! SPRINGBOARD HAS TO RUN ITS ORIGINAL CODE TO LOAD FIRST!!!
            UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Welcome Back!" //allocate memory for the alert and add thr title
                message:@"Welcome back to your iPhone"
                delegate:self
                cancelButtonTitle:@"Thanks"
                otherButtonTitles:nil];
            [alert1 show]; //Now show that alert
            [alert1 release]; //And release the memory... no memory leaks here.
          }
      %end
