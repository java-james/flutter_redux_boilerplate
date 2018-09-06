# Widget Architecture

Screen smart components host the logic for interacting with the store to create a view model. A view model is passed from the screen to a container that acts as a wrapper for an entire screen. The container may or may not contain many other components which can all access what they need from the view model.

In summary the widget arcitecture is made up of the following widgets:

## Screen ('Smart component')
- Accesses the store to resolve a view model
- Doesn’t do ANY display work
- Passes the view model to a container

## Container ('Dumb component'')
- Provides a main wrapper & layout of an entire screen
- Can contain many components
- Usually requires the view model for display and actions

## Component (Also a 'Dumb component')
- More fine grained layout eg a button, button group, a list.
- Usually contained within a container as part of an entire screen
- Sometimes requires the view model or properties & actions from the view model