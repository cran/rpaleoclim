## ----rmarkdown-options, include = FALSE---------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----install-rpaleoclim, eval=FALSE-------------------------------------------
#  remotes::install_github("joeroe/rpaleoclim")

## ----paleoclim-periods, echo=FALSE--------------------------------------------
knitr::kable(read.csv("paleoclim_periods.csv"))

## ----biovars, echo=FALSE------------------------------------------------------
knitr::kable(data.frame(biovar = paste0("bio_", 1:19),
       definition = c("Mean annual temperature",
                      "Mean diurnal range",
                      "Isothermality",
                      "Temperature seasonality",
                      "Maximum temperature of warmest month",
                      "Minimum temperature of coldest month",
                      "Annual temperature range",
                      "Mean temperature of wettest quarter",
                      "Mean temperature of driest quarter",
                      "Mean temperature of warmest quarter",
                      "Mean temperature of coldest quarter",
                      "Total annual precipitation",
                      "Precipitation of wettest month",
                      "Precipitation of driest month",
                      "Precipitation seasonality",
                      "Precipitation of wettest quarter",
                      "Precipitation of driest quarter",
                      "Precipitation of warmest quarter",
                      "Precipitation of coldest quarter"),
       formula = c("",
                   "",
                   "(bio2 / bio7) * 100",
                   "sd(temp) * 100",
                   "",
                   "",
                   "bio5 - bio6",
                   "",
                   "",
                   "",
                   "",
                   "",
                   "",
                   "",
                   "",
                   "",
                   "",
                   "",
                   "")
))

## ----setup--------------------------------------------------------------------
library(rpaleoclim)
library(terra)

## ----eg-paleoclim-------------------------------------------------------------
paleoclim("lh", "10m")

## ----eg-paleoclim-crop--------------------------------------------------------
europe <- c(-15, 45, 30, 90)
europe_lh <- paleoclim("lh", "10m", region = europe)

plot(europe_lh[["bio_12"]], main = "Late Holocene annual precipitation, Europe")

## ----eg-load-paleoclim--------------------------------------------------------
zipfile <- system.file("testdata", "LH_v1_10m_cropped.zip",
                       package = "rpaleoclim")
load_paleoclim(zipfile)

## ----install-raster, eval=FALSE-----------------------------------------------
#  install.packages(c("rgdal", "raster"))

## ----eg-raster----------------------------------------------------------------
paleoclim("lh", "10m", as = "raster")

