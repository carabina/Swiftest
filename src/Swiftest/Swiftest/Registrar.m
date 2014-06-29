#import <Foundation/Foundation.h>
#import "Registrar.h"
#import "SwiftestSuite.h"
#import "objc/runtime.h"

@implementation Registrar

+ (void) registerAll {
  int classCount = objc_getClassList(NULL, 0);

  Class *classes = NULL;
  Class suiteClass = [SwiftestSuite class];

  if (classCount == 0 ) { return; }

  classes = (__unsafe_unretained Class *) malloc(sizeof(Class) * classCount);
  classCount = objc_getClassList(classes, classCount);

  for (int i = 0; i < classCount; i++) {
    Class cls = classes[i];
    if(class_getSuperclass(cls) == suiteClass) {
      [cls new];
    }
  }

  free(classes);
}


@end