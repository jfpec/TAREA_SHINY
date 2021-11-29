library(ggplot2)
library(dplyr)
library(shiny)
data_temp <- NULL

shinyServer(function(input, output) {

    output$grafica_base_r <- renderPlot({
      plot(mtcars$wt, mtcars$mpg, xlab = "wt", ylab = "Millas por galon")
      }
    )
    
    output$grafica_ggplot <- renderPlot({
      diamonds %>% ggplot(aes(x=carat, y=price, color=color))+geom_point()+xlab("Precio")+ylab("Kilates")+ggtitle("Precio de diamantes por kilo")
      }
    )
    
    output$plot_click_option <- renderPlot({
      plot(mtcars$wt, mtcars$mpg, xlab = "wt", ylab = "Millas por galon")
      }
    )

    output$click_data <- renderPrint({
      list(
        click_xy = c(input$clk$x, input$clk$y),
        doble_click_xy = c(input$dclk$x, input$dclk$y),
        hover_xy = c(input$mouse_hover$x, input$mouse_hover$y),
        brush_xy = c(input$mouse_brush$xmin, input$mouse_brush$ymin,
                     input$mouse_brush$xmax, input$mouse_brush$ymax))
    }
    )
    
    output$mtcars_tbl <- renderTable({
      dfc <- nearPoints(mtcars, input$clk, xvar = "wt", yvar = "mpg")
      
      if (nrow(dfc) > 0) {data_temp <- rbind(data_temp, dfc)}
      
      data_temp
      
        
        
        
      #dfb <- brushedPoints(mtcars, input$mouse_brush, xvar = "wt", yvar = "mpg")
      #dfv <- rbind(data_temp, dfc, dfb)
      #dfv
      
      #dfh <- nearPoints(mtcars, input$mouse_hover, xvar = "wt", yvar = "mpg")
      #dfd <- nearPoints(mtcars, input$dclk, xvar = "wt", yvar = "mpg")
      
      #######################################################################
      #df1 <- nearPoints(mtcars, input$clk, xvar = "wt", yvar = "mpg")
      #df2 <- brushedPoints(mtcars, input$mouse_brush, xvar = "wt", yvar = "mpg")
      #dfvv <- rbind(df1, df2)
      #if (nrow(dfvv)==0){mtcars}else{dfvv}
    })
    
    
    
    

})
