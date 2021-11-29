library(shiny)
shinyUI(fluidPage(
    titlePanel("Interacciones de usuario con graficas"),
    
    tabsetPanel(
      tabPanel("Graficas shiny", 
               h1("Graficas en shiny"),
               plotOutput("grafica_base_r"),
               plotOutput("grafica_ggplot")
               ),
      
      tabPanel("Interacciones con plots", 
               plotOutput("plot_click_option",
                          click = "clk",
                          dblclick = "dclk",
                          hover = "mouse_hover",
                          brush = "mouse_brush"
                          ),
               verbatimTextOutput("click_data"),
               tableOutput("mtcars_tbl")
               )
      )
)
)
