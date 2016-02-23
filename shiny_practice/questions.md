##R(Shiny) in RStudio Notes

### Shiny
- Press "esc" or the stop button to stop a Shiny app
- Press cmd+shift+enter/ctrl+shift+enter or "Run App" to run the app while in the editor

* R will look for apps starting from the working directory

### R
`getwd()`: get working directory
`setwd()`: set working directory

##R(Shiny) in RStudio Questions

1. Doing the tutorial for Shiny, the call runExample("01_hello") gives a web application where we can inspect server.R and ui.R. The call runApp("shiny_practice") (when containing the exact same code) does not give the opportunity to inspect those scripts. Why? Is this a difference in runApp and runExample function, or did I make a mistake in copying/running?
*Answer: it's because Shiny apps display in normal mode, whereas built-in examples display in showcase mode. You can run an app in showcase mode by:*
```R
runApp("shiny_practice", display.mode="showcase")
```