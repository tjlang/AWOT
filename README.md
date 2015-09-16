AWOT
===============

AWOT is a toolkit of utilities to read in and visualize weather
observations taken by aircraft.

Authors:

Nick Guy (nick.guy@uwyo.edu)

Andrew Lyons

## Installation
The latest source code for AWOT can be obtained from the GitHub repository,
[https://github.com/nguy/AWOT](https://github.com/nguy/AWOT).

Either download and unpack the zip file of the source code or use git to checkout the repository

```python
git clone https://github.com/nguy/AWOT
```
To install in your home directory, use:

```python
python setup.py install --user
```
To install for all users on Unix/Linux:
```python
python setup.py build
sudo python setup.py install
```
 
## Structure
This package is currently divided as follows:

io - Input and output of specific data files
Currently supported file types:
	NetCDF files
	NASA AMES FFI 1001 format

Radar:
	NOAA P-3 tail Doppler and lower fuselage radar native radar coordinates.
	NOAA P-3 tail Doppler and lower fuselage radar gridded coordinates
	produced by the windysn program.
	LATMOS/SAFIRE Falcon NetCDF files which contain both W-band radar 
	and flight information.
	U. Wyoming King Air W-band radar Level 2 NetCDF files.

graph - Produces plots.  Horizontal plots are overlaid on a basemap instance 
and vertical plots are regular 2D plots.

display - Very immature visualization routines.  Work is in progress.

src - Processing software for NOAA P-3 tail radar data.
 
## Usage
Read a NOAA P-3 tail radar sweep file:

```python
from awot import io
radar = io.read_tdr_sweep(fname='p3_radar_file.nc')            
```

Read a flight data file in NetCDF:
```python
from awot import io
flight = io.read_netcdf(fname='flightfile.nc', platform='p-3', file_format='netcdf')                
```

Read a binary windsyn file:
```python
from awot import io

radar = io.read_windsyn_binary(filename=file, platform='p-3', file_format='netcdf', instrument='tdr_sweep')
```

Data can then be plotted:
```python
from awot import graph

rgp = graph.RadarSweepPlot(fl, instrument='tdr_sweep')

rgp.plot_track_relative('dBZ')

from awot import graph

flp = FlightLevel(flight)

flp.plot_trackmap(color_by_altitude=True, track_cmap='spectral', addlegend=True, addtitle=True)
```

## Dependencies

A typical scientific python stack is employed:
[Numpy](http://www.scipy.org)
[Scipy](http://www.scipy.org)
[matplotlib](http://matplotlib.org)
[netCDF4](http://code.google.com/p/netcdf4-python)


The [Py-ART](https://github.com/ARM-DOE/pyart) package is used for reading some radar data.

[Anaconda](https://store.continuum.io/cshop/anaconda/) provides easy access to all of
these packages along with much more.


## Notes
At present this package is primarily for visualization.  However, work is underway to connect 
many processing routines that allow processing from start to finish with airborne data.

Development to provide the ability to process Wyoming Cloud radar and lidar files is underway.

AWOT was developed on MacOSX 10.10.5 using Python   



