#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Run.h"

NSManagedObjectModel *managedObjectModel();
NSManagedObjectContext *managedObjectContext();
NSString *applicationLogDirectory();

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

NSManagedObjectContext *managedObjectContext()
{
	static NSManagedObjectContext *mac = nil;
	
	if (mac != nil) {
		return mac;
	}
	
	mac = [[NSManagedObjectContext alloc] init];
	
	NSPersistentStoreCoordinator *coordinator =
		[[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel()];
	[mac setPersistentStoreCoordinator:coordinator];
	
	NSString *STORE_TYPE = NSXMLStoreType;
	NSString *STORE_FILENAME = @"CDCLI.cdcli";
	
	NSError *error;
	NSURL *url = [NSURL fileURLWithPath:[applicationLogDirectory() stringByAppendingPathComponent:STORE_FILENAME]];
	
	NSPersistentStore *newStore = [coordinator addPersistentStoreWithType:STORE_TYPE
															configuration:nil
																	  URL:url
																  options:nil
																	error:&error];
	
	if (newStore == nil) {
		NSLog(@"Store Configuration Failure\n%@",
			  ([error localizedDescription] != nil) ? [error localizedDescription] : @"Unknown Error");
	}
	
	return mac;
}

NSString *applicationLogDirectory() {
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
	if (applicationLogDirectory() == nil) {
		NSLog(@"Could not find application log directory\nExiting...");
		exit(1);
	}
	NSLog(@"The managed object model is defined as follows:\n%@", mom);
	
	NSManagedObjectContext *moc = managedObjectContext();
	
	NSEntityDescription *runEntity = [[mom entitiesByName] objectForKey:@"Run"];
	Run *run  = [[Run alloc] initWithEntity:runEntity insertIntoManagedObjectContext:moc];
	
	NSProcessInfo *processInfo = [NSProcessInfo processInfo];
	run.processID = [processInfo processIdentifier];
	
	NSError *error = nil;
	if (![moc save:&error]) {
		NSLog(@"Error while saving\n%@",
			  ([error localizedDescription] != nil) ? [error localizedDescription] : @"Unknown Error");
		exit(1);
	}
	
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:runEntity];
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES];
	[request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
	error = nil;
	NSArray *array = [moc executeFetchRequest:request error:&error];
	if ((error != nil) || (array == nil)) {
		NSLog(@"Error while fetching\n%@",
			  ([error localizedDescription] != nil) ? [error localizedDescription] : @"Unknown error");
		exit(1);
	}
	
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateStyle:NSDateFormatterMediumStyle];
	[formatter setTimeStyle:NSDateFormatterMediumStyle];
	NSLog(@"%@ run history", [processInfo processName]);
	for (run in array) {
		NSLog(@"On %@ as process ID %d",
			  [formatter stringForObjectValue:run.date],
			  run.processID);
	}
	
    return 0;
}
