//
//  ViewController.m
//  RunTime-Practise
//
//  Created by yehot on 2018/5/25.
//  Copyright © 2018年 Xin Hua Zhi Yun. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self showCustomClassNameOnly];
//    [self showAllClassNameInProject];
    [self flexShowClassNames];
}

#pragma mark - get private class name

// FLEX 中的实现方式
- (void)flexShowClassNames {
    unsigned int classNamesCount = 0;
    
    // 用 executablePath 获取当前 app image
    NSString *appImage = [NSBundle mainBundle].executablePath;
    
    // objc_copyClassNamesForImage 获取到的是 image 下的类，直接排除了系统的类
    const char **classNames = objc_copyClassNamesForImage([appImage UTF8String], &classNamesCount);
    if (classNames) {
        NSMutableArray *classNameStrings = [NSMutableArray array];
        for (unsigned int i = 0; i < classNamesCount; i++) {
            const char *className = classNames[i];
            NSString *classNameString = [NSString stringWithUTF8String:className];
            [classNameStrings addObject:classNameString];
        }
        NSArray *allClassNames = [classNameStrings sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
        NSLog(@"---%@", allClassNames);
        free(classNames);
    }
}

- (void)showCustomClassNameOnly {
    
    // int objc_getClassList(Class *buffer, int bufferCount) 获取已经注册的类
    // 第一个参数 buffer ：已分配好内存空间的数组，
    // 第二个参数 bufferCount ：数组中可存放元素的个数，返回值是注册的类的总数
    int allClasses = objc_getClassList(NULL,0);
    Class *classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * allClasses);
    
    // 较麻烦， objc_getClassList 需要两次才能获取
    allClasses = objc_getClassList(classes, allClasses);
    
    for (int i = 0; i < allClasses; i++) {
        Class clazz = classes[i];
        // 通过来判断 class 是否在 mainBundle 中来判断
        NSBundle *b = [NSBundle bundleForClass:clazz];
        if (b == [NSBundle mainBundle]) {
            NSLog(@"自定义 class: %@", NSStringFromClass(clazz));
        }
    }
    free(classes);
}

// show all
- (void)showAllClassNameInProject {
    // Class *objc_copyClassList(unsigned int *outCount)
    // 该函数的作用是获取所有已注册的类，和上述函数 objc_getClassList 参数传入 NULL 和  0 时效果一样
    // 代码相对简单：
    unsigned int outCount;
    Class *classes = objc_copyClassList(&outCount);
    for (int i = 0; i < outCount; i++) {
        Class clazz = classes[i];
        NSString *className = NSStringFromClass(clazz);
        NSLog(@"当前项目中全部 class: %@", className);
    }
    free(classes);
}

@end
