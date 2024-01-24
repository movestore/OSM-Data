# OSM Data

MoveApps

Github repository: *github.com/movestore/OSM-Data*

## Description
A selected feature of Open Street Map data can be downloaded and is plotted together with the input tracking data in a simple output file. (Example for OSM overpass function)

## Documentation
Depending on the provided key and value, Open Street Map data within the bounding box of the tracking data are downloaded. See a list of available keys and values here: https://wiki.openstreetmap.org/wiki/Map_features. 

This is an example App only that is providing a png file artifact showing the animal tracks and selected OSM feature on top. Please help improve the App for more user comfort or additional features and outputs.

### Input data
move2 location object

### Output data
move2 location object

### Artefacts
`track_osmdata.png`: A simple map showing the animal tracks in red and all features of the selected OSM data on top.

### Settings 
`key`: Key of the OSM feature that you want to download. See a list of all available ones under https://wiki.openstreetmap.org/wiki/Map_features. Defaults to `highway`.

`value`: Value of the OSM feature fitting to the key above that you want to download. See a list of all available ones under https://wiki.openstreetmap.org/wiki/Map_features. Defaults to `motorway`. If the feature is not present in the bounding box of your data, the resulting plot will only your your track(s).

### Most common errors
*Please describe shortly what most common errors of the App can be, how they occur and best ways of solving them.*

*Please note that this App is meant as an example of how to use the internal OSM mirror. Please help us improve its functionality.*

### Null or error handling
**Setting `key`:** If a key is inserted that does not exist or is misspelled, the App returns a plot with only the animal tracks. Unfortunately, no error message is returned.
**Setting `value`:** If a value is inserted that does not exist or is misspelled, the App returns a plot with only the animal tracks. Unfortunately, no error message is returned.
**data:** The input data set is returned.
