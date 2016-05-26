# BugInUICollectionViewForIOS
bug in horizontal collection view

When you have a collection view, that scrolls horizontally, and you use "scrollToItemAtIndexPath", it works when your environment is a LeftToRight language
But it takes you to the wrong cell when the environment is RightToLeft..

As a workaround, you can set the semantic of the collection view to ForceLeftToRight..
But then the direction of the scroll changes.... Very bad for RTL layout
