//
//  NewsCollectionViewModelSpec.m
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/20/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCHamcrest/OCHamcrest.h>
#import <OCMockito/OCMockito.h>
#import "NewsCollectionViewModel.h"

SpecBegin(NewsCollectionViewModel)

__block NewsCollectionViewModel * newsCollectionViewModel;

beforeEach(^{
    newsCollectionViewModel = [[NewsCollectionViewModel alloc] init];
});
//
//describe(@"#emailVerification", ^{
//    
//    context(@"when email is incorrect", ^{
//        it(@"return false", ^{
//            expect([viewModel emailIsCorrect:@"fr"]).to.equal(false);
//        });
//        
//    });
//    
//    context(@"when email is correct", ^{
//        it(@"return true", ^{
//            expect([viewModel emailIsCorrect:@"f@wolox.com.ar"]).to.equal(true);
//        });
//    });
//});
//
describe(@"#fetchNews", ^{
    context(@"when request to fetch news is send", ^{
        [newsCollectionViewModel fetchNewsWithSuccess:nil error:nil];
                it(@"return false", ^{
                    [[expectFutureValue(theValue([newsCollectionViewModel count])) shouldEventually] equal:2];
                    [[expectFutureValue(theValue(2)) shouldEventually] equal:@4];
                     });
        //            expect([viewModel emailIsCorrect:@"fr"]).to.equal(false);
//        [viewModel logInWithEmail:@"f@wolox.com.ar" password: @"probando" success:nil error:nil];
//        expectFutureValue(NSUserDefaults )
    });
});

//__block NSArray* result;
//[[AMPlacesHelper sharedHelper] fetchSuggestionsForLocation:(CLLocationCoordinate2D){37.7749295,-122.4194155} onSuccess:^(NSArray *data) {
//    result = data;
//} onFailure:^(NSError *error) {}];
////
//[[expectFutureValue(result) shouldEventually] beKindOfClass:[NSArray class]];
//[[expectFutureValue(theValue(result.count)) shouldEventually] beGreaterThan:theValue(0)];
//});

SpecEnd

