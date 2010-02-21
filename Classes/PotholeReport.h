//
//  PotholeReport.h
//  SeattleService
//
//  Created by JD Wallace on 2/20/10.
//  Copyright 2010 jdwallace.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TroubleReport.h"

@interface PotholeReport : TroubleReport <NSCoding> {

}
-(id)initWithType:(TypeOfRequest)requestType;
@end
