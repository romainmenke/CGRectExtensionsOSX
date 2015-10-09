# CGRectExtensionsOSX
An Ode to CGRect

NSView:
- NSViewContentMode -> add a subview with UIViewContentMode-style placing
- CGRectUnionWithSubviews -> get/set CGRectUnion for all nested subviews
- addSubviewsWithLayout -> add array of views in a rows or columns layout


CGRect:

Functions:
- CGRect expand -> expand CGRect anchored in center
- rotationBounds -> returns a CGRect off the maximum space rotations might take in

Constants
- CGRect area
- CGRect aspectRatio

Overload Operators
- >< returns true if two CGRects overlap (handy with `rotationBounds`)
