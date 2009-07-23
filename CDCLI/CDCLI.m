#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NSManagedObjectModel *managedObjectModel();

NSManagedObjectModel *managedObjectModel() {
	static NSManagedObjectModel *mom = nil;
	
	if (mom !=nil) {
		return mom;
	}
	
	mom = [[NSManagedObjectModel alloc] init];
	
	NSEntityDescription *runEntity = [[NSEntityDescription alloc] init];
	[runEntity setName:@"Run"];
	[runEntity setManagedObjectClassName:@"Run"];
	[mom setEntities:[NSArray arrayWithObject:runEntity]];
	
	NSAttributeDescription *dateAttribute = [[NSAttributeDescription alloc] init];
	[dateAttribute setName:@"date"];
	[dateAttribute setAttributeType:NSDateAttributeType];
	[dateAttribute setOptional:NO];
	
	NSAttributeDescription *idAttribute = [[NSAttributeDescription alloc] init];
	[idAttribute setName:@"processID"];
	[idAttribute setAttributeType:NSInteger32AttributeType];
	[idAttribute setOptional:NO];
	[idAttribute setDefaultValue:[NSNumber numberWithInteger:-1]];
	
	NSExpression *lhs = [NSExpression expressionForEvaluatedObject];
	NSExpression *rhs = [NSExpression expressionForConstantValue:[NSNumber numberWithInteger:0]];
	NSPredicate *validationPredicate = [NSComparisonPredicate predicateWithLeftExpression:lhs
																		  rightExpression:rhs
																				 modifier:NSDirectPredicateModifier
																					 type:NSGreaterThanPredicateOperatorType
																				  options:0];
	
	NSString *validationWarning = @"Process ID < 1";
	[idAttribute setValidationPredicates:[NSArray arrayWithObject:validationPredicate]
				  withValidationWarnings:[NSArray arrayWithObject:validationWarning]];
	
	NSArray *properties = [NSArray arrayWithObjects: dateAttribute, idAttribute, nil];
	[runEntity setProperties:properties];
	
	NSMutableDictionary *localizationDictionary = [NSMutableDictionary dictionary];
	[localizationDictionary setObject:@"Date" forKey:@"Property/date/Entity/Run"];
	[localizationDictionary setObject:@"Process ID" forKey:@"Property/processID/Entity/Run"];
	[localizationDictionary setObject:@"Process ID must not be less than 1" forKey:@"ErrorString/Process ID < 1"];
	
	[mom setLocalizationDictionary:localizationDictionary];
	
	return mom;
}

NSString *applicationDirectory() {
	NSString *LOG_DIRECTORY = @"CDCLI";
	static NSString *ald = nil;
	
	if (ald == nil) {
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
		if ([paths count] == 1) {
			ald = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Logs"];
			ald = [ald stringByAppendingPathComponent:LOG_DIRECTORY];
			NSFileManager *fileManager = [NSFileManager defaultManager];
			BOOL isDirectory = NO;
			if (![fileManager fileExistsAtPath:ald isDirectory:&isDirectory]) {
				if (![fileManager createDirectoryAtPath:ald attributes:nil]) {
					ald = nil;
				}
			} else {
				if (!isDirectory) {
					ald = nil;
				}
			}
		}
	}
	return ald;
}

int main (int argc, const char * argv[]) {
	objc_startCollectorThread();
	
	NSManagedObjectModel *mom = managedObjectModel();
	if (applicationDirectory() == nil) {
		NSLog(@"Could not find application log directory\nExiting...");
		exit(1);
	}
	NSLog(@"The managed object model is defined as follows:\n%@", mom);
	
    return 0;
}
