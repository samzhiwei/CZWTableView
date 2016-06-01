//
//  CZWCellTableViewCell.m
//  CZWTableView
//
//  Created by tianqu on 16/5/27.
//  Copyright © 2016年 Tianqu. All rights reserved.
//

#import "CZWTableViewCell.h"
#import <objc/runtime.h>
@implementation CZWTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//- (NSString *)cellIdentify{
//    @throw [NSException exceptionWithName:@"Must override this method"
//                                   reason:[NSString stringWithFormat:@"Didn't override this method %s in subClass", __FUNCTION__]
//                                 userInfo:nil];
//    //return NSStringFromClass([self class]);
//}

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(CZWRowObj *)rowObj{
    //根据内容计算高度并返回;
    @throw [NSException exceptionWithName:@"Must override this method"
                                   reason:[NSString stringWithFormat:@"Didn't override this method %s in subClass", __FUNCTION__]
                                 userInfo:nil];
    //eg:
    return 44.0;
}

- (CZWTableViewCell *)settingData:(CZWRowObj *)rowObj{
    @throw [NSException exceptionWithName:@"Must override this method"
                                       reason:[NSString stringWithFormat:@"Didn't override this method %s in subClass", __FUNCTION__]
                                     userInfo:nil];
    //eg:
    return self;
    
    
    //    unsigned int count;
    //    objc_property_t *rowObjProperties = class_copyPropertyList([rowObj class], &count);
    //    for (int i = 0; i < count ; i++ ) {
    //        objc_property_t property = rowObjProperties[i];
    //        const char *name = property_getName(property);
    //        NSString *key = [NSString stringWithUTF8String:name];
    //        NSLog(@"%@",key);
    //    }
    //    objc_property_t *cellProperties = class_copyPropertyList([self class], &count);
    //    for (int i = 0; i < count ; i++ ) {
    //        objc_property_t property = cellProperties[i];
    //
    //        const char *name = property_getName(property);
    //        NSString *key = [NSString stringWithUTF8String:name];
    //
    //        NSLog(@"%@",key);
    //        unsigned int c;
    //        objc_property_attribute_t *attributes = property_copyAttributeList(property, &c);
    //        for (int j = 0; j < c; j ++) {
    //            objc_property_attribute_t attribute = attributes[j];
    //            const char*first = attribute.name;
    //            const char *second = attribute.value;
    //            NSString *firstStr = [NSString stringWithUTF8String:first];
    //            NSString *secondStr =[NSString stringWithUTF8String:second];
    //            NSUInteger lan = secondStr.length;
    //            NSString *uuu = [secondStr substringWithRange:NSMakeRange(2, secondStr.length - 3)];
    //            NSLog(@"%@",uuu);
    //            
    //        }
    //        
    //    }
    //
}

@end
