DESCRIPTION:
This is a sinatra application designed for bicycle parking management. It allows users to sign up, log in, log out and to create, read, update, and destroy their bikes. Regular users can see their own spots and which spots are available, but only the building manager ("admin") can alter parking spot ownership. A building manager, in theory, can then monitor if people are sticking to their designated spots and track down the owner of any rogue bike. 

SETUP:
Clone this repository
terminal: cd "bike-room"
terminal: bundle install

PERMISSIONS:
The user named "admin" is the only account with permissions to alter spot assignments. The admin can also edit or delete any bike or delete any user. Regular users can only edit their own accounts and bikes. 

PASSWORDS:
All seeded passwords are currently set to "password"——including that of the "admin".

THANKS
Thanks to the Flatiron School & Cohort Leader, Annabell Wilmerding, for her patient guidance throughout this process. Thanks also to Jinook, Nate, Niani, Luke and Eva for their support and assistance.