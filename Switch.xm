#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>

@interface ClassicInvertColorsSwitch : NSObject <FSSwitchDataSource>
@end

extern "C" BOOL _AXSClassicInvertColorsEnabled();
extern "C" void _AXSClassicInvertColorsSetEnabled(BOOL);

@implementation ClassicInvertColorsSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	return _AXSClassicInvertColorsEnabled() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	if (newState == FSSwitchStateIndeterminate)
		return;
	_AXSClassicInvertColorsSetEnabled(newState == FSSwitchStateOn);
}

@end
