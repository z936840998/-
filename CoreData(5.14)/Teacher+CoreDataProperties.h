//
//  Teacher+CoreDataProperties.h
//  CoreData(5.14)
//
//  Created by lanouhn on 16/5/14.
//  Copyright © 2016年 lanouhn. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Teacher.h"

NS_ASSUME_NONNULL_BEGIN

@interface Teacher (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *gender;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *students;

@end

@interface Teacher (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(NSManagedObject *)value;
- (void)removeStudentsObject:(NSManagedObject *)value;
- (void)addStudents:(NSSet<NSManagedObject *> *)values;
- (void)removeStudents:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
