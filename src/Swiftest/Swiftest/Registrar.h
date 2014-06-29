#import <Foundation/Foundation.h>

typedef void (^VoidBlk)();

@interface Registrar : NSObject

+ (void) registerAll;

@end