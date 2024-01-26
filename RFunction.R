library('move2')
library('lubridate')
library('sf')
library('osmdata')
library('ggmap')

## The parameter "data" is reserved for the data object passed on from the previous app

# to display messages to the user in the log file of the App in MoveApps
# one can use the function from the logger.R file:
# logger.fatal(), logger.error(), logger.warn(), logger.info(), logger.debug(), logger.trace()

# Showcase injecting app setting (parameter `year`)
rFunction = function(data, key="highway", value="motorway", ...) {
  
  bb <- st_bbox(data)
  
  set_overpass_url(Sys.getenv("OVERPASS_API", "https://overpass-api.de/api/interpreter"))
  q1 <- opq(bbox=as.numeric(bb)) %>%
    add_osm_feature(key = key,value = value) %>%
    osmdata_sf()

  g <- ggplot() +
    geom_path(aes(
      x = st_coordinates(data)[,1],
      y = st_coordinates(data)[,2],
      color = mt_track_id(data)
    )) +
    xlab("x") +
    ylab("y")
  
  osmn <- names(q1)[grep("osm_",names(q1))]
  
  for (i in rev(seq(along=osmn))) #overlay all available non-empty osm data types (points, lines, ...)
  {
    datai <- eval(parse(text=paste0("q1$",osmn[i])))
    if (!is.null(datai) & length(datai)>0)
    {  g <- g +   geom_sf(
      data=datai)}
  }
  
  ggsave(appArtifactPath("track_osmdata.png"),g)
  
  return(data)
}
