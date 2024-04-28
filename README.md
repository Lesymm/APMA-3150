# APMA-3150 Spring 2024 Extra Credit Project

README Description:

  The app we created is an interactive distribution visualizer that enables users to explore different distribution graphs given a distribution type and parameters as inputs. Users can select distribution types and enter their own parameters. This tool is useful for students in statistics classes that want to quickly generate multiple different distribution graphs. To get started, select the desired distribution type from the dropdown menu. Input the necessary parameters for your chosen distribution, such as the mean and standard deviation for a Normal distribution. Once the parameters are set, click "Update Distribution" to view the graph that reflects the distribution with your specified settings. For help users can contact the support team through the provided contact information on the application's web page or check out our application’s GitHub page at: https://github.com/Lesymm/APMA-3150. The distribution visualizer was created by Waseem Benamor and Mouad Elmellouki as part of the APMA 3150 S24 extra credit project. This app is a collaborative effort designed to enhance the learning experience of students by providing a practical tool for understanding statistical distributions.

How to run:
install.packages("shiny")
install.packages("shinythemes") 
install.packages("shinyjs")  
setwd("/path/to/app")  
shiny::runApp()
