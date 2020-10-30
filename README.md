# Style Guide

## The purpose:

The purpose of Style Guide in Flutter is to create and consolidate a pattern for all the visual properties in the application, like colors, font styles, button properties, et cetera.

The style guide is a structure composed by other structures, like a tree. A style guide has multiples Style Sets.

A Style Set is a set that contains multiple styles. It can be used inside the style guide, or by itself. One example of usage inside the style guide is to define the application buttons, which will have multiple styles for one button, like color, height, etc. One example of usage by itself, is to define global styles, like color palette, spaces between components, et cetera.

A Style is set of properties, for example, the style 'color-palette' will have the properties 'primary', 'secondary', et cetera.

Properties are the atomics elements of the Style Guide. A property can be anything that can be used as property, like a Color, a Text, a number, et cetera.

#
## Defining a Style Guide:

There is two ways to define a style guide. You can define it directly or from a map. 

### Defining a Style Guide directly:

```dart
StyleGuide styleGuide = StyleGuide({

})

```