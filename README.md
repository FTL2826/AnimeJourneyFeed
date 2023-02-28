# AnimeJourneyFeed
my DI(Swinject) + MVP + Navigator project.

Create network layer with URLSession for receiving data from Kitsu API & load pictures from internet. Parse it into table view and detail view.
Table support pagination by 20 items.
Create persistent storage layer for saving parsed data in CoreData. Create service for auto saving pictures on disk in new directory in app's sandbox for cache purposes.

All of UI made in code via anchors or stack views. All network and database manipulations made in asynchronous way.

# Requirements:
Swinject pod
