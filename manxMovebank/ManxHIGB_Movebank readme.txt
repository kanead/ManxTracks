This annotated animal movement dataset comes from the Env-DATA Track Annotation Service on Movebank (movebank.org). The environmental data attributes are created and distributed by government and research organizations. For general information on the Env-DATA System, see Dodge et al. (2013) and https://www.movebank.org/node/6607.

Terms of Use: Verify the terms of use for relevant tracking data and environmental datasets prior to presenting or publishing these data. Terms of use for animal movement data in Movebank are defined by the study owners in the License Terms for the study. Terms of use for environmental datasets vary by provider; see below for details.

Contact: support@movebank.org

---------------------------

Annotated data for the following Movebank entities are contained in this file:
Movebank study name: ManxHIGB
Annotated Tag IDs: EB42450_0921, EB42450_0922, EB42450_1180, EB42450_1181, EY95051_0030, EY95054_0550, EY95054_1340, EY95054_1341, EY95057_0092, EY95057_0093, EY95057_0094, EY95065_0712, EY95065_0713, EY95065_1461, EY95065_1462, EY95065_1463, EY95085_1250, EY95085_1251, EY95085_1252, EY95085_1253, EY95092_1551, EY95092_1552, EY95092_1553, EY95092_15554, EY95092_15555, EY95092_15556, EY95092_15558, EY95092_15561, EY95092_1558, EZ19506_1130, EZ19506_1131, and more ...
Requested on Tue Feb 27 11:50:35 CET 2018
Access key: 3776484379948409926
Requested by: Adam Kane

---------------------------

File attributes

Attributes from the Movebank database (see the Movebank Attribute Dictionary at http://www.movebank.org/node/2381):
Location Lat: latitude in decimal degrees, WGS84 reference system
Location Long: longitude in decimal degrees, WGS84 reference system
Timestamp: the time of the animal location estimates, in UTC
Update Ts

Locations are the the geographic coordinates of locations along an animal track as estimated by the processed sensor data.

Attributes from annotated environmental data:
Name: ETOPO1 Elevation
Description: Elevation of the land surface over land and the ocean floor over ocean. Over the Antarctic and Greenland ice sheets values indicate the elevation of the top of the ice sheets.
Unit: m amsl
No data values: -32768 (provider), NaN (interpolated)
Interpolation: inverse-distance-weighted

Name: MODIS Ocean Aqua OceanColor 4km 8d Chlorophyll A
Description: Chlorophyll A mass concentration near the surface of the ocean. See Hu et al. (2012) doi:10.1029/2011JC007395.
Unit: mg m^-3
No data values: -32767.0f (provider), NaN (interpolated)
Interpolation: inverse-distance-weighted

Name: MODIS Ocean Aqua OceanColor 4km Monthly Chlorophyll A
Description: Chlorophyll A mass concentration near the surface of the ocean. See Hu et al. (2012) doi:10.1029/2011JC007395.
Unit: mg m^-3
No data values: -32767.0f (provider), NaN (interpolated)
Interpolation: inverse-distance-weighted

Name: NASA Distance to Coast (Signed)
Description: The distance to the nearest ocean coastline. Inland distances are given as negative numbers. Note: Incorrected coastline is found in some fjords of southern Chile and northern Greenland. 1 km uncertainty may lead to 2 km distance being adjacent to the coastline.
Unit: km
No data values: NaN (provider), NaN (interpolated)
Interpolation: inverse-distance-weighted

---------------------------

Environmental data services

Service: MODIS Ocean/Aqua Mapped OceanColor 4-km Monthly
Provider: NASA Goddard Space Flight Center Ocean Biology Processing Group
Datum: N/A
Projection: N/A
Spatial granularity: 4.64 km
Spatial range (long x lat): E: 180.0    W: -180.0 x N: 90    S: -90
Temporal granularity: monthly
Temporal range: 2002 to present
Source link: http://oceandata.sci.gsfc.nasa.gov/MODIS-Aqua/Mapped/Monthly/4km
Terms of use: http://oceancolor.gsfc.nasa.gov/cms/citations, http://oceancolor.gsfc.nasa.gov/forum/oceancolor/topic_show.pl?tid=474

Service: MODIS Ocean/Aqua Mapped OceanColor 4-km 8-day
Provider: NASA Goddard Space Flight Center Ocean Biology Processing Group
Datum: N/A
Projection: N/A
Spatial granularity: 4.64 km
Spatial range (long x lat): E: 180.0    W: -180.0 x N: 90    S: -90
Temporal granularity: 8 day
Temporal range: 2002 to present
Source link: http://oceandata.sci.gsfc.nasa.gov/MODIS-Aqua/Mapped/8Day/4km
Terms of use: http://oceancolor.gsfc.nasa.gov/cms/citations, http://oceancolor.gsfc.nasa.gov/forum/oceancolor/topic_show.pl?tid=474

Service: NASA Distance to the Nearest Coast
Provider: NASA Goddard Space Flight Center Ocean Biology Processing Group
Datum: N/A
Projection: N/A
Spatial granularity: 0.04 degrees
Spatial range (long x lat): E: 180.0    W: -180.0 x N: 90    S: -90
Temporal granularity: N/A
Temporal range: N/A
Source link: https://www.ngdc.noaa.gov/docucomp/page?xml=NOAA/IOOS/PacIOOS/iso/xml/dist2coast_4deg_land.xml&view=getDataView&header=none
Terms of use: https://www.ngdc.noaa.gov/docucomp/page?xml=NOAA/IOOS/PacIOOS/iso/xml/dist2coast_4deg_land.xml&view=getDataView&header=none

Service: ETOPO1 Ice Surface Global Relief Model
Provider: NOAA National Geophysical Data Center
Datum: N/A
Projection: N/A
Spatial granularity: 1 arc-minute
Spatial range (long x lat): E: 180.0    W: -180.0 x N: 90    S: -90
Temporal granularity: N/A
Temporal range: N/A
Source link: http://www.ngdc.noaa.gov/mgg/global/
Terms of use: http://www.ngdc.noaa.gov/mgg/global/

Dodge, S., Bohrer, G., Weinzierl, R., Davidson, S.C., Kays, R., Douglas, D., Cruz, S., Han, J., Brandes, D., and Wikelski, M., 2013, The Environmental-Data Automated Track Annotation (Env-DATA) System: Linking animal tracks with environmental data: Movement Ecology, v. 1:3. doi:10.1186/2051-3933-1-3.