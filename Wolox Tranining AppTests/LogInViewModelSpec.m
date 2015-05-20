//
//  LogInViewModelSpec.m
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/20/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#include "LogInViewModel.h"
#import <Foundation/Foundation.h>
#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCHamcrest/OCHamcrest.h>
#import <OCMockito/OCMockito.h>

SpecBegin(LogInViewModel)

__block LogInViewModel * viewModel;

beforeEach(^{
    viewModel = [[LogInViewModel alloc] init];
});

describe(@"#emailVerification", ^{
    
    context(@"when email is incorrect", ^{
        it(@"return false", ^{
            expect([viewModel emailIsCorrect:@"fr"]).to.equal(false);
        });
        
    });
    
    context(@"when email is correct", ^{
        it(@"return true", ^{
            expect([viewModel emailIsCorrect:@"f@wolox.com.ar"]).to.equal(true);
        });
    });
});

describe(@"#LogInServerResponse", ^{

    context(@"when log in request made", ^{
//        it(@"return false", ^{
//            expect([viewModel emailIsCorrect:@"fr"]).to.equal(false);
//        });
        [viewModel logInWithEmail:@"f@wolox.com.ar" password: @"probando" success:nil error:nil];
//        expectFutureValue(NSUserDefaults )
    });
});

SpecEnd
