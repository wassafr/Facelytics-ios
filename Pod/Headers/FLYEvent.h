//
//  FLYace.h
//  FacelyticsSDK
//
//  Created by Peter SCHAEFFER on 06/02/2014.
//  Copyright (c) 2014 Wassa All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FLYObjcProtocols.h"


/**
 SuperClass for FacylticsObject which can be created by KVC from a json string or a NSDictionary. You need to call parse to fill the data (good for performance, the parsing is done on demand)
 */
@interface FLYParsable : NSObject
/**
 *  Initialize the object by taking values from the provided dictionary
 *
 *  @param dictionary the in dictionary
 *
 *  @return the instance of the FLYParsable object
 */
- (instancetype)initWithDictionary:(NSDictionary*)dictionary;
/**
 *  Initialize the object by taking values from a json string ( an error will rise only during the parse method if the json can't be parsed )
 *
 *  @param jsonString a string conforming to the json format
 *
 *  @return the instance of the FLYParsable object
 */
- (instancetype)initWithJsonString:(NSString*)jsonString;
/**
 *  Returns the object as a dictionary
 *
 *  @return a dictionary representation of the object
 */
- (NSDictionary*)dictionaryRepresentation;

/**
 *  Parse the suplied dictionary / json string to fill the object properties MUST be called if you want to actually use the object
 *
 *  @return YES if the parse is a success, false if the json can't be parsed or the supplied keys doesn't match object properties
 */
- (BOOL)parse;
@end

/**
 *  Object representing a 2D coordinate
 */
@interface FLYPoint2D : NSObject
/**
 *  abcissa value
 */
@property (assign) float x;
/**
 *  ordinate value
 */
@property (assign) float y;

/**
 *  Returns the CGpoint equivalent
 *
 *  @return a cgpoint
 */
- (CGPoint)CGPoint;

/**
 *  Class factory method
 *
 *  @param x the abcissa value
 *  @param y the ordinate value
 *
 *  @return the instanciated object
 */
+ (FLYPoint2D*)pointWithX:(float)x y:(float)y;

@end
/**
 *  Object representing a 3D coordinate
 */
@interface FLYPoint3D : NSObject
/**
 *  abcissa value
 */
@property (assign) float x;
/**
 *  ordinate value
 */
@property (assign) float y;
/**
 *  depth value
 */
@property (assign) float z;

/**
 *  Class factory method
 *
 *  @param x the abcissa value
 *  @param y the ordinate value
 *  @param z the depth value
 *
 *  @return the instanciated object
 */
+ (FLYPoint3D*)pointWithX:(float)x y:(float)y z:(float)z;

@end


/**
 *  The main event, contains currently recognized faces, you must call parse to use it ( parse will be called recursively on FLYFace objects contained in the faces array )
 */
@interface FLYEvent : FLYParsable
/**
 *  An array containing FLYFace objects repsenting current faces
 */
@property (strong) NSArray *faces;

@end


/**
 *  Object containing informations about face position / orientation in space
 */
@interface FLYPosition : FLYParsable
/**
 *  A boolean indicated if landmarks had been computed on the face
 */
@property (strong,nonatomic) NSNumber* landmarks_detected;
/**
 *  time stamp of the postion calculation ( sec from 1970)
 */
@property (strong,nonatomic) NSNumber* timestamp;
/**
 *  The top left position of the face
 */
@property (strong) FLYPoint2D *position;
/**
 *  The width of the face in pixel
 */
@property (strong,nonatomic) NSNumber* width;
/**
 *  The height of the face in pixels
 */
@property (strong,nonatomic) NSNumber* height;
/**
 *  The face rotation arround the Z axis in degrees
 */
@property (strong,nonatomic) NSNumber* rotation;
/**
 *  The face rotation arround the X axis in degrees
 */
@property (strong,nonatomic) NSNumber* orientation_x;
/**
 *  The face rotation arround the Y axis in degrees
 */
@property (strong,nonatomic) NSNumber* orientation_y;
/**
 *  The number of landmarks calculated on the face
 */
@property (strong,nonatomic) NSNumber* data_landmarks_size;
/**
 *  The actual positions of the landmarks on the face (in the face coordinate system)
 */
@property (strong,nonatomic) NSArray *data_landmarks_value;

@end

/**
 *  Enum describing a face Gender
 */
typedef NS_ENUM(NSInteger, FLYGenderType){
    /**
     *  The Gender cannot be determined
     */
    Undetermined = -1,
    /**
     *  The face is a man
     */
    Male = 0,
    /**
     *  The face is woman
     */
    Female = 1,
};

/**
 *  Gender informations about the face You should use the current propety for better results.
 */
@interface FLYGender : FLYParsable
/**
 *  BOOL indicating if the module is activated
 */
@property (strong,nonatomic) NSNumber* actif;
/**
 *  time stamp of the gender calculation ( sec from 1970)
 */
@property (strong,nonatomic) NSNumber* timestamp;
/**
 *  A ponderation for male certainty (the higher it is, greater the chances that the face is a man are)
 */
@property (strong,nonatomic) NSNumber* count_male;
/**
 *  A ponderation for female certainty (the higher it is, greater the chances that the face is a woman are)
 */
@property (strong,nonatomic) NSNumber* count_female;
/**
 *  The total ammout of sumbitted gender informations (usefull to make statistics)
 */
@property (strong,nonatomic) NSNumber* count_total;
/**
 *  A summary of the current gender based on male and female count
 */
@property (assign) FLYGenderType current;
@end

/**
 *  Glass infromation about the face
 */
@interface FLYGlass : FLYParsable
/**
 *  BOOL indicating if the module is activated
 */
@property (strong,nonatomic) NSNumber* actif;
/**
 *  time stamp of the glass calculation ( sec from 1970)
 */
@property (strong,nonatomic) NSNumber* timestamp;
/**
 *  A bool indicating if the face is wearing glasses
 */
@property (strong,nonatomic) NSNumber* has_glasses;

@end


/**
 *  Enum describing a face FLYFLYEmotion
 */
typedef NS_ENUM(NSInteger, FLYEmotionType){
    /**
     *  The emotion cannot be determined
     */
    undetermined = -1,
    /**
     *  The emotion is neutral (no real FLYEmotion on the face)
     */
    neutral = 0,
    /**
     *  The emotion is happy (basicaly a smile)
     */
    happy = 1,
    /**
     *  The emotion is sad
     */
    sad = 2,
    /**
     *  The emotion is suprise
     */
    surprise = 3,
};

/**
 *  Information about the face emotion. use the average property for accurate results, the current property can be use if you want to capture very quick emotions
 */
@interface FLYEmotion : FLYParsable
/**
 *  BOOL indicating if the module is activated
 */
@property (strong,nonatomic) NSNumber* actif;
/**
 *  time stamp of the emotion calculation ( sec from 1970)
 */
@property (strong,nonatomic) NSNumber* timestamp;
/**
 *  The instant emotion of the face
 */
@property (assign) FLYEmotionType current;
/**
 *  The cumulated emotion (usualy the last second)
 */
@property (assign) FLYEmotionType average;

@end



/**
 *  Object describing face age. For display you should use the displayed_age property, @"null" if the found age is not relevent enough. Use the average and standard_deviation properties for accurate numerical results
 */
@interface FLYAge : FLYParsable
/**
 *  BOOL indicating if the module is activated
 */
@property (strong,nonatomic) NSNumber* actif;
/**
 *  time stamp of the age calculation ( sec from 1970)
 */
@property (strong,nonatomic) NSNumber* timestamp;
/**
 *  The instant age (shouldn't be use, pretty unstable), see AgeErrorCode if the age is <0
 *
 *    
 * typedef enum AgeErrorCode
 * {
 * NoError = 0, // No error, for debuging purpose only
 * NoData = -1, // The history vector is empty
 * NotEnoughData = -2, // The history vector size is < 2
 * NotANumber = -3, // The last submited ages are NAN
 * Negative = -4, // The last submited ages are negative
 * OverHundred = -5, // The last Submited ages are > 100
 * isChildren = -6 // The last Submited ages is a children
 * } AgeErrorCode;
 */
@property (strong,nonatomic) NSNumber* current;
/**
 *  The average age since the face appeared ( more reliable ), see AgeErrorCode if age <0
 */
@property (strong,nonatomic) NSNumber* average;
/**
 *  Number of age sumbission to calculate the average
 */
@property (strong,nonatomic) NSNumber* submission_total;
/**
 *  The standard deviation arround the avearge ( usefull to give an age interval)
 */
@property (strong,nonatomic) NSNumber* standard_deviation;
/**
 *  The age displayed ( is you use the preview). it matches optimized predefined intervals
 */
@property (strong,nonatomic) NSString* displayed_age;


@end

/**
 *  Object describing face diplacement
 */
@interface FLYMotion : FLYParsable
/**
 *  BOOL indicating if the module is activated
 */
@property (strong,nonatomic) NSNumber* actif;
/**
 *  time stamp of the motion calculation ( sec from 1970)
 */
@property (strong,nonatomic) NSNumber* timestamp;
/**
 *  distance from the screen ( 0 -> 1 ), 0 correponding to a very close face, the last point wher the face is detectable
 */
@property (strong,nonatomic) NSNumber* screen_distance;
/**
 *  Face displacement in pixels / sec
 */
@property (strong,nonatomic) FLYPoint3D *displacement_vector;

@end
/**
 *  The main face object
 */
@interface FLYFace : FLYParsable
/**
 *  A unique id identifying the face
 */
@property (strong,nonatomic) NSNumber* id;
/**
 *  The Informations regarding face position
 */
@property (strong,nonatomic) FLYPosition *position;
/**
 *  The informations regarding face displacement
 */
@property (strong,nonatomic) FLYMotion *motion;
/**
 *  The informations regarding face gender
 */
@property (strong,nonatomic) FLYGender *gender;
/**
 *  The glass information about the face
 */
@property (strong,nonatomic) FLYGlass *glass;
/**
 *  The information about face current emotion
 */
@property (strong,nonatomic) FLYEmotion *emotion;
/**
 *  The informaitons about face age
 */
@property (strong,nonatomic) FLYAge *age;

@end
