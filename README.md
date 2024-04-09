# daymet_chicago <a href='https://degauss.org'><img src='https://github.com/degauss-org/degauss_hex_logo/raw/main/PNG/degauss_hex.png' align='right' height='138.5' /></a>

[![](https://img.shields.io/github/v/release/degauss-org/daymet?color=469FC2&label=version&sort=semver)](https://github.com/degauss-org/daymet/releases)
[![container build status](https://github.com/degauss-org/daymet/workflows/build-deploy-release/badge.svg)](https://github.com/degauss-org/daymet/actions/workflows/build-deploy-release.yaml)

## Background

The Daymet weather variables included in this package are daily minimum and maximum temperature at a 1 km x 1 km gridded surface over the area of Cook County, IL for the years 2016 through 2022. This package is specifically for data linkage in the Cook County area between those years and for those variables, and cannot be altered.

Daymet data documentation: https://daac.ornl.gov/DAYMET/guides/Daymet_Daily_V4.html

Note: The Daymet calendar is based on a standard calendar year. All Daymet years, including leap years, have 1–365 days. For leap years, the Daymet data include leap day (February 29) and December 31 is discarded from leap years to maintain a 365-day year.

## Using

If `my_addresses.csv` is a file in the current working directory with ID column `id`, start and end date columns `start_date` and `end_date`, and coordinate columns named `lat` and `lon`, then the [DeGAUSS command](https://degauss.org/using_degauss.html#DeGAUSS_Commands):

```sh
docker run --rm -v $PWD:/tmp ghcr.io/degauss-org/daymet_chicago:0.1.1 my_addresses.csv
```

will produce `my_addresses_daymet.csv` with added columns:

- **`tmax`**: maximum temperature
- **`tmin`**: minimum temperature

Other columns may be present in the input `my_addresses.csv` file, and these other columns will be linked in and included in the output `my_addresses_daymet.csv` file.

### Optional Arguments

There are no optional arguments associated with this package. All arguments are pre-coded or inferred from the address file.

## Geomarker Methods

Daymet data on a specified date is linked to coordinate data within the `my_addresses.csv` file by matching on the Daymet 1 km x 1 km raster cell number. The set boundary box is Cook County, IL.

## Geomarker Data

- This package takes pre-downloaded environmental data from [Daymet](https://daymet.ornl.gov/) as netCDF file(s).
- The R code that links the environmental data to the input coordinates is within `entrypoint.R`.

## DeGAUSS Details

The Daymet_Chicago DeGAUSS package was created by Ben Barrett and Peter Graffy, and is designed for use by the Chicago Area Patient-Centered Outcomes Research Network (CAPriCORN).
For detailed documentation on DeGAUSS, including general usage and installation, please see the [DeGAUSS homepage](https://degauss.org).