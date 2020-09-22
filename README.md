## Johns Hopkins University/Coursera: Developing Data Products
### June 3rd, 2020
### R. Holley

## INTRO
There are two sections to this project: the web app, and the Rpres slides pitch. This little shiny app was created for the JHU/Coursera course Developing Data Products, with Profs. Brian Caffo, Roger Peng, and Jeff Leek. It is by no means a very advanced project, but that is by necessity - the first few iterations I tried used a massive, comprehensive dataset from the CDC on US health, and cleaning/organizing/modeling the data took a terrible toll on my PC. Eventually (for my poor RAM and for the purpose of running well on a server), I dumbed down the project to a much simpler, easily-accesible dataset (UKLungDeaths, in the R System Library datasets package). 
View the web app here: [https://rholley.shinyapps.io/DDPProject/](https://rholley.shinyapps.io/DDPProject/)

The Rpres portion of this project is a 5-slide pitch on why my web app product is needed, and how it can be further developed. Five slides is not a lot to work with, so precision and clear communication are the main goals of this part.
View the Rpres here: [https://mementomakomori.github.io/DDPProject/pitch-rpubs](https://mementomakomori.github.io/DDPProject/pitch-rpubs#/)

### TO DO
Changes I would like to make in the future:
* more recent dataset (so it can actually predict years that haven't happened yet!)
* include parallelization for large model building
* cosmetic changes on text/graph spacing
* separate input buttons for the checkboxes and the dropdown list

## INFO
R version 3.6.3 (2020-02-29) -- "Holding the Windsock"
Copyright (C) 2020 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

Repo contents:
* DDP - ui.R
* DDP - server.R
* pitch-cache
* pitch-figure
* README.md
* pitch.Rpres
* pitch.md
* pitch.html

ui.R/server.R use the following R packages:
* shiny 1.4.0.2
* forecast 8.12
