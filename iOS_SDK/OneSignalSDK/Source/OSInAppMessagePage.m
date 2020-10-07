/**
* Modified MIT License
*
* Copyright 2020 OneSignal
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* 1. The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* 2. All copies of substantial portions of the Software may only be used in connection
* with services provided by OneSignal.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

#import "OSInAppMessagePage.h"

@implementation OSInAppMessagePage

+ (instancetype _Nullable)instancePreviewFromPayload:(OSNotificationPayload * _Nonnull)payload {
    return nil;
}

+ (instancetype _Nullable)instanceWithData:(NSData * _Nonnull)data {
    NSError *error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    if (error || !json) {
        [OneSignal onesignal_Log:ONE_S_LL_ERROR message:[NSString stringWithFormat:@"Unable to decode in-app message JSON: %@", error.description ?: @"No Data"]];
        return nil;
    }
    
    return [self instanceWithJson:json];
}

+ (instancetype _Nullable)instanceWithJson:(NSDictionary * _Nonnull)json {
    OSInAppMessagePage *page = [OSInAppMessagePage new];
    
    if ([json[@"page_id"] isKindOfClass:[NSString class]])
        page.pageId = json[@"page_id"];
    
    if ([json[@"page_index"] isKindOfClass:[NSNumber class]])
        page.pageIndex = json[@"page_index"];
    
    return page;
}

@end
