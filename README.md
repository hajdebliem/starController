# stars
a private use window decorartion.

As the days get shorter and the temparatures drop, i start to miss the chatter of our neighbours and the screaming of the kids in the afternoon. So i decided to gather all who feel the same on a cold and dark winter eavening. Serving Pumpkin Soup, Wiener Würste and Glühwein. To spice things up i projected this star/flake generator on to the street facing window of our flat from the inside.
After following Dan Shiffman for a while and jumping trough his Book, i was finnaly able to put together some basic code that worked, yeah! 
I implemented the oscP5 library to have some interaction from the guests. I put together a simple TouchOSC inteface for iPhone and iPad to choose an RGB Color and a size for each individual star/flake thats been generated.
Intentionally i forseen to use a RPi to let the code run. To no ones surprise my unoptimised code run very poorly, on the the RPi so i went with a older, still decent MacMini.
You know there is allways that one kid that tries to beat the system. In my case it was Jhonatan. He treid to make as many flakes/stars as possible in the 5min lifespan i gave the objects. Well, Johnatan managed to spawn around 3900 instances. Pretty impressing; thats 13 clicks per second… no lag taken into account.
And the lag is strong whit this one, so there is that. 
I allready understud that there would be more efficient ways to draw the stars. But anyhow if u have suggessions on how to optimize the code i am happy to learn…
