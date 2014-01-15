//
//	ThumbsViewController.h
//	Reader v2.5.4
//
//	Created by Julius Oklamcak on 2011-09-01.
//	Copyright © 2011-2012 Julius Oklamcak. All rights reserved.
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights to
//	use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
//	of the Software, and to permit persons to whom the Software is furnished to
//	do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in all
//	copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//	OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//	WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//	CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import <UIKit/UIKit.h>

#import "ThumbsMainToolbar.h"
#import "ReaderThumbsView.h"
#import "Product.h"

@class ThumbsViewController;
@class ReaderDocument;

@protocol ThumbsViewControllerDelegate <NSObject>

@required // Delegate protocols

- (void)thumbsViewController:(ThumbsViewController *)viewController gotoPage:(NSInteger)page;

- (void)dismissThumbsViewController:(ThumbsViewController *)viewController;

@end

@interface ThumbsViewController : UIViewController <ThumbsMainToolbarDelegate, ReaderThumbsViewDelegate>
{
@private // Instance variables

	ReaderDocument *document;

	ThumbsMainToolbar *mainToolbar;

	ReaderThumbsView *theThumbsView;

	NSMutableArray *bookmarked;

	BOOL updateBookmarked;

	CGPoint thumbsOffset;
	CGPoint markedOffset;

	BOOL showBookmarked;
}

@property (nonatomic, unsafe_unretained, readwrite) id <ThumbsViewControllerDelegate> delegate;

- (id)initWithReaderDocument:(ReaderDocument *)object;

- (id)initWithReaderDocument:(ReaderDocument *)object Product:(Product*)pro;

@end

#pragma mark -

//
//	ThumbsPageThumb class interface
//

@interface ThumbsPageThumb : ReaderThumbView
{
@private // Instance variables

	UIView *backView;

	UIView *maskView;

	UILabel *textLabel;

	UIImageView *bookMark;

	CGSize maximumSize;

	CGRect defaultRect;
}

- (CGSize)maximumContentSize;

- (void)showText:(NSString *)text;

- (void)showBookmark:(BOOL)show;

@end
