# starController
a private use window decoration.

As the days get shorter and the temperatures drop, i start to miss the chatter of our neighbours and the screaming of the kids in the afternoon. 
So i decided to gather all those who feel the same. On a cold and dark winter evening i served Pumpkin Soup, Wiener Würste and Glühwein.
To spice things up i projected this star/flake generator on to the street facing window of our flat from the inside.
After following Dan Shiffman for a while and jumping trough his Book, i was finally able to put together some basic code that worked, yeah! 
I implemented the oscP5 library to have some interaction from the guests. I put together a simple TouchOSC interface for iPhone and iPad to choose an RGB Color and a size for each individual star/flake thats been generated.
Intentionally i foreseen to use a RPi to let the code run. To no ones surprise my unoptimised code run very poorly, on the the RPi so i went with a older, still decent MacMini.
You know there is always that one kid that tries to beat the system. In my case it was Jon. He tried to make as many flakes/stars as possible in the 5min lifespan i gave the objects. Well, Jon managed to spawn around 3900 instances. Pretty impressing; thats 13 clicks per second… no lag taken into account. Unfortunately the lag is strong whit this one. 
I already understood that there would be more efficient ways to draw the stars. But anyhow if u have suggestions on how to optimise the code i am happy to learn…
