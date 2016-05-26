# BugInUICollectionViewForIOS
bug in horizontal collection view layout

When you have a collection view, that scrolls horizontally, and you use "scrollToItemAtIndexPath", it works in languages that are LeftToRight
But it takes you to the wrong cell when the environment is RightToLeft..

As a workaround, you can set the semantic of the collection view to ForceLeftToRight..
But then the direction of the scroll changes.... Very bad for RTL layout
