#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <SwiftestXC/SwiftestXC-Swift.h>
#import "SwiftestSpec.h"

@implementation SwiftestSpec

+(void) initialize {
  if([self self] != [SwiftestSpec self])
    [Bridge register: self];
}

+(NSArray*) testInvocations {
  NSMutableArray *invocations = [[NSMutableArray alloc] init];
  
  for(Result *result in [Bridge forSpec: self]) {
    [invocations addObject: [self addMethod: result]];
  }

  return invocations;
}

+ (NSInvocation*) addMethod:(Result*) result {
  IMP body = imp_implementationWithBlock(^(id self) { result.block(); });
  SEL selector = NSSelectorFromString([self selectorName: result.name]);
  
  class_addMethod([[self class] class], selector, body, [[NSString stringWithFormat:@"%s%s%s",
                                          @encode(id),
                                          @encode(id),
                                          @encode(SEL)] UTF8String]);
  
  NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:
                              [[[self class] class] instanceMethodSignatureForSelector:selector]];
  
  invocation.selector = selector;
  
  return invocation;
}

+ (NSString *) selectorName:(NSString*) name {
  NSMutableCharacterSet *invalidCharacters = [[NSMutableCharacterSet alloc] init];
  
  [invalidCharacters formUnionWithCharacterSet:[NSCharacterSet whitespaceCharacterSet]];
  [invalidCharacters formUnionWithCharacterSet:[NSCharacterSet newlineCharacterSet]];
  [invalidCharacters formUnionWithCharacterSet:[NSCharacterSet illegalCharacterSet]];
  [invalidCharacters formUnionWithCharacterSet:[NSCharacterSet controlCharacterSet]];
  [invalidCharacters formUnionWithCharacterSet:[NSCharacterSet punctuationCharacterSet]];
  [invalidCharacters formUnionWithCharacterSet:[NSCharacterSet nonBaseCharacterSet]];
  [invalidCharacters formUnionWithCharacterSet:[NSCharacterSet symbolCharacterSet]];

  return [[name componentsSeparatedByCharactersInSet: invalidCharacters]
          componentsJoinedByString:@"_"];
}

@end