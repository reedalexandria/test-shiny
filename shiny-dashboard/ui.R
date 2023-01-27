# dashboard header -----------------------
header <- dashboardHeader()

# dashboard sidebar -----------------------
sidebar <- dashboardSidebar()

# dashboard body -----------------------
body <- dashboardBody()

# combine all -----------------------
dashboardPage(header, sidebar, body)