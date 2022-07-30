//
//  my_annotation.h
//  map_view
//
//  Created by MAC on 31/05/2022.
//

#import <Foundation/Foundation.h>
#import <mapKit/mapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface my_annotation : NSObject <MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *subtitle;

@end

NS_ASSUME_NONNULL_END
