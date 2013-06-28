//
//  XMLParserTests.m
//  XMLParser
//
//  Created by Zouhair on 10/05/13.
//  Copyright (c) 2013 Zedenem. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "XMLParser.h"

@interface XMLParserTests : GHAsyncTestCase

@end

@implementation XMLParserTests

- (void)testXML:(NSString *)xml selector:(SEL)selector {
	[self prepare];
	
	// XML Data
	NSData *xmlData = [xml dataUsingEncoding:NSUTF8StringEncoding];
	GHTestLog(@"Parsing the following XML : \n--\n%@\n--\n", xml);
	
	XMLParser *xmlParser = [[[XMLParser alloc] init] autorelease];
	
	[xmlParser parseData:xmlData
				 success:^(id parsedData) {
					 GHTestLog(@"parsed data : %@", parsedData);
					 [self notify:kGHUnitWaitStatusSuccess forSelector:selector];
				 }
				 failure:^(NSError *error) {
					 GHTestLog(@"Error : %@", error);
					 [self notify:kGHUnitWaitStatusFailure forSelector:selector];
				 }];
	
	[self waitForStatus:kGHUnitWaitStatusSuccess timeout:10.0];
}

- (void)testA {
	[self prepare];
	NSString *xml = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"A" ofType:@"xml"] encoding:NSUTF8StringEncoding error:nil];
	[self testXML:xml selector:_cmd];
}

- (void)testB {
	[self prepare];
	NSString *xml = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"B" ofType:@"xml"] encoding:NSUTF8StringEncoding error:nil];
	[self testXML:xml selector:_cmd];
}

- (void)testC {
	[self prepare];
	NSString *xml = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"C" ofType:@"xml"] encoding:NSUTF8StringEncoding error:nil];
	[self testXML:xml selector:_cmd];
}

- (void)testD {
	[self prepare];
	NSString *xml = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"D" ofType:@"xml"] encoding:NSUTF8StringEncoding error:nil];
	[self testXML:xml selector:_cmd];
}

- (void)testE {
	[self prepare];
	NSString *xml = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"E" ofType:@"xml"] encoding:NSUTF8StringEncoding error:nil];
	[self testXML:xml selector:_cmd];
}

//TODO: Case not implemented yet.
- (void)testF {
	[self prepare];
	NSString *xml = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"F" ofType:@"xml"] encoding:NSUTF8StringEncoding error:nil];
	[self testXML:xml selector:_cmd];
}

- (void)testG {
	[self prepare];
	NSString *xml = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"G" ofType:@"xml"] encoding:NSUTF8StringEncoding error:nil];
	[self testXML:xml selector:_cmd];
}

@end
