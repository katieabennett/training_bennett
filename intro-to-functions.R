## Writing Functions in R
# with Jeanette Clark at ADC

#create dataset
airtemps <- c(212, 30.0, 78, 32)

#example calc you might do in R but would need to repeat/ copy & paste many times 
celsius1 <- (airtemps[1] - 32) * 5/9
celsius2 <- (airtemps[2] - 32) * 5/9

#write a function to replace the above code
fahr_to_celsius <- function(fahr) {
  celsius <- (fahr - 32) * 5/9
  return(celsius)
}

celsius1_new <- fahr_to_celsius(airtemps[1]) #run function on 1 variable

celsius1 == celsius1_new #check the result

celsius <- fahr_to_celsius(airtemps) #run on entire vector

#now write a function to do the reverse

#' convert temperatures from C to F
#'
#' @param cels numeric temperature value in celsius 
#'
#' @return numeric value in fahrenheit
#' @export
#'
#' @examples
celsius_to_fahr <- function(cels) { #cels is the name of the argument, does not call a variable from the env
  fahrenheit <- (cels * 9/5) +32 
  return(fahrenheit)
}

fahrenheit <- celsius_to_fahr(airtemps)

#can also be written as 
fahrenheit <- celsius_to_fahr(cels = airtemps) #call variable explicitly vs implicitly above

#dont need to rely on your environment variable names for you function to work!!


#second example

convert_temps <- function(fahr){
  celsius <- (fahr - 32) * 5/9
  kelvin <- celsius + 273.15
  return(data.frame(fahr = fahr,
                    celsius = celsius,
                    kelvin = kelvin)) #create a df of the results
}

df <- convert_temps(airtemps)


#example using functions with ggplot

#create bigger temp dataset
temps_df1 <- data.frame(convert_temps(seq(-100,100,10)))

custom_theme <- function(base_size = 9) {
  ggplot2::theme(
    text             = ggplot2::element_text(family = 'Helvetica', 
                                             color = 'gray30', 
                                             size = base_size),
    plot.title       = ggplot2::element_text(size = ggplot2::rel(1.25), 
                                             hjust = 0.5, 
                                             face = 'bold'),
    panel.background = ggplot2::element_blank(),
    panel.border     = ggplot2::element_blank(),
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major = ggplot2::element_line(colour = 'grey90', 
                                             linewidth = 0.25),
    legend.position  = 'right',
    legend.key       = ggplot2::element_rect(colour = NA, 
                                             fill = NA),
    axis.ticks       = ggplot2::element_blank(),
    axis.line        = ggplot2::element_blank()
  )
}

library(ggplot2)

ggplot(temps_df1, mapping = aes(x = fahr, y = celsius, color = kelvin)) +
  geom_point() +
  custom_theme() #could enter number in custom_theme(20) to change base size









