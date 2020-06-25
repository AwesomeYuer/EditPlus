#TITLE=iPhone 
#SORT=n

#T=UIKit Foundation
#T=---------------------------------
---------------------------------
#T= 
 
#T= UIBarButtonItem
UIBarButtonItem
#T=	initWithBarButtonSystemItem:target:action:
- (id)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem target:(id)target:action:(SEL)action
#T=	initWithCustomView:
- (id)initWithCustomView:(UIView *)customView
#T=	initWithImage:style:target:action:
- (id)initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action
#T= NSBundle
^#import <UIKit/NSNibLoading.h>
#T=	loadNibNamed:owner:options:
- (NSArray *)loadNibNamed:(NSString *)name owner:(id)owner options:(NSDictionary*)options
#T= NSCoder 
^#import <UIKit/UIGeometry.h>
#T=	decodeCGAffineTransformForKey:
- (CGAffineTransform)decodeCGAffineTransformForKey:(NSString *)key
#T=	decodeCGPointForKey:
- (CGPoint)decodeCGPointForKey:(NSString *)key
#T=	decodeCGRectForKey:
- (CGRect)decodeCGRectForKey:(NSString *)key
#T=	decodeCGSizeForKey:
- (CGSize)decodeCGSizeForKey:(NSString *)key
#T=	decodeUIEdgeInsetsForKey:
- (UIEdgeInsets)decodeUIEdgeInsetsForKey:(NSString *)key
#T=	encodeCGAffineTransform:forKey:
- (void)encodeCGAffineTransform:(CGAffineTransform)transform forKey:(NSString *)key
#T=	encodeCGPoint:forKey:
- (void)encodeCGPoint:(CGPoint)point forKey:(NSString *)key
#T=	encodeCGRect:forKey:
- (void)encodeCGRect:(CGRect)rect forKey:(NSString *)key
#T=	encodeCGSize:forKey:
- (void)encodeCGSize:(CGSize)size forKey:(NSString *)key
#T=	encodeUIEdgeInsets:forKey:
- (void)encodeUIEdgeInsets:(UIEdgeInsets)insets forKey:(NSString *)key
#T= UIAcceleration 
^#import <UIKit/UIAccelerometer.h>
#T=	timestamp
@property(nonatomic, readonly) NSTimeInterval timestamp
#T=	x
@property(nonatomic, readonly) UIAccelerationValue x
#T=	y
@property(nonatomic, readonly) UIAccelerationValue y
#T=	z
@property(nonatomic, readonly) UIAccelerationValue z
#T=UIAccelerometer
^#import <UIKit/UIAccelerometer.h>
#T=	delegate
@property(nonatomic, assign) id<UIAccelerometerDelegate> delegate
#T=	updateInterval
@property(nonatomic) NSTimeInterval updateInterval
#T=	sharedAccelerometer
+ (UIAccelerometer *)sharedAccelerometer
#T=UIAccessibilityElement
^#import <UIKit/UIAccessibilityElement.h>
#T=	accessibilityContainer
@property(nonatomic, assign) id accessibilityContainer
#T=	accessibilityFrame
@property(nonatomic, assign) CGRect accessibilityFrame
#T=	accessibilityHint
@property(nonatomic, retain) NSString *accessibilityHint
#T=	accessibilityLabel
@property(nonatomic, retain) NSString *accessibilityLabel
#T=	accessibilityTraits
@property(nonatomic, assign) UIAccessibilityTraits accessibilityTraits
#T=	accessibilityValue
@property(nonatomic, retain) NSString *accessibilityValue
#T=	isAccessibilityElement
@property(nonatomic, assign) BOOL isAccessibilityElement
#T	initWithAccessibilityContainer:
- (id)initWithAccessibilityContainer:(id)container
#T= UIActionSheet
^#import <UIKit/UIAlert.h>
#T=	cancelButtonIndex
@property(nonatomic) NSInteger cancelButtonIndex
#T=	firstOtherButtonIndex
@property(nonatomic, readonly) NSInteger firstOtherButtonIndex
#T=	numberOfButtons
@property(nonatomic, readonly) NSInteger numberOfButtons
#T=	title
@property(nonatomic, copy) NSString *title
#T=	visible
@property(nonatomic, readonly, getter=isVisible) BOOL visible
#T=	addButtonWithTitle:
- (NSInteger)addButtonWithTitle:(NSString *)title
#T=	buttonTitleAtIndex:
- (NSString *)buttonTitleAtIndex:(NSInteger)buttonIndex
#T=	dismissWithClickedButtonIndex:animated:
//Dismisses the receiver, optionally with animation.
- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated

#T=	initWithTitle:delegate:cancelButtonTitle:destructiveButtonTitle:otherButtonTitles:
//Convenience method for initializing an action sheet.
- (id)initWithTitle:(NSString *)title delegate:(id < UIActionSheetDelegate >)delegate cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString*)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...

#T=	showFromTabBar:
//Displays the receiver using animation by originating it from the specified tab bar.
- (void)showFromTabBar:(UITabBar *)view
#T=	showFromToolbar:
//Displays the receiver using animation by originating it from the specified toolbar.
- (void)showFromToolbar:(UIToolbar *)view
#T=	showInView:
//Displays the receiver using animation by originating it from the specified view.
- (void)showInView:(UIView *)view
#T=UIActivityIndicatorView
^#import <UIKit/UIActivityIndicatorView.h>
#T=	activityIndicatorViewStyle
// The style of the indeterminate progress indicator.
@property UIActivityIndicatorViewStyle activityIndicatorViewStyle
#T=	initWithActivityIndicatorStyle:
// Initializes and returns an activity-indicator object.
- (id)initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style
#T=	isAnimating
// Returns whether the receiver is animating.
- (BOOL)isAnimating
#T=	startAnimating
//Starts the animation of the progress indicator.
- (void)startAnimating
#T=	stopAnimating
// Stops the animation of the progress indicator.
- (void)stopAnimating
#T=UIAlertView
^#import <UIKit/UIAlert.h>
#T=	cancelButtonIndex
//The index number of the cancel button.
@property(nonatomic) NSInteger cancelButtonIndex
#T=	delegate
//The receiver¡¯s delegate or nil if it doesn¡¯t have a delegate.
@property(nonatomic, assign) id delegate
#T=	firstOtherButtonIndex
// The index of the first other button. (read-only)
@property(nonatomic, readonly) NSInteger firstOtherButtonIndex
#T=	message
//Descriptive text that provides more details than the title.
@property(nonatomic, copy) NSString *message
#T=	numberOfButtons
//The number of buttons on the alert view. (read-only)
@property(nonatomic, readonly) NSInteger numberOfButtons
#T=	title
//The string that appears in the receiver¡¯s title bar.
@property(nonatomic, copy) NSString *title
visible
// A Boolean value that indicates whether the receiver is displayed. (read-only)
@property(nonatomic, readonly, getter=isVisible) BOOL visible
#T=	buttonTitleAtIndex:
// Returns the title of the button at the given index.
- (NSString *)buttonTitleAtIndex:(NSInteger)buttonIndex
#T=	dismissWithClickedButtonIndex:animated:
// Dismisses the receiver, optionally with animation.
- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated
#T=	initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:
//Convenience method for initializing an alert view.
- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...

#T=UIApplication
^#import <UIKit/UIApplication.h>
#T=	applicationIconBadgeNumber
//The number currently set as the badge of the application icon in Springboard.
@property(nonatomic) NSInteger applicationIconBadgeNumber
#T=	applicationSupportsShakeToEdit
A Boolean value that determines whether shaking the device displays the undo-redo user interface.
@property(nonatomic) BOOL applicationSupportsShakeToEdit
#T=	delegate
// The delegate of the application object.
@property(nonatomic, assign) id<UIApplicationDelegate> delegate
#T=	idleTimerDisabled
//A Boolean value that controls whether the idle timer is disabled for the application.
@property(nonatomic, getter=isIdleTimerDisabled) BOOL idleTimerDisabled
#T=	keyWindow
@property(nonatomic, readonly) UIWindow *keyWindow
#T=	networkActivityIndicatorVisible
// A Boolean value that turns an indicator of network activity on or off.
@property(nonatomic, getter=isNetworkActivityIndicatorVisible) BOOL

#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	
#T=	

