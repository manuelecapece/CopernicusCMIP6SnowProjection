clc;
clear all;
close all;

temporal_resolution = "monthly";
experiment  = "ssp2_4_5";
variable  = "snowfall_flux";
model  = "ec_earth3_cc";
year = ["2015", "2016", "2017","2018", "2019", "2020","2021", "2022"];
month  = ["01", "02", "03","04", "05", "06","07", "08", "09","10", "11", "12"];

[datasetName, datasetOptions] = makeRequest(temporal_resolution,experiment,variable,model,year,month);

cd('..\')
