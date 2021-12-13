//This flow navigates to Students Learning Space -SLS and login with given given username & password
// and proceed to My Drive and take a snap shot of the my homework and save it as a png file.

//visit students learning space website
https://vle.learning.moe.edu.sg/login


// and type the search text for username and password
type username as MKAAV8373G
type password as 2021Ccps1

// Click login button using Xpath
click //*[@id="loginform"]/div[3]/dl/dd/button

// Wait 3 seconds so the page can load
wait 3

// Click To Do using XPath
click //*[@id="main-content"]/div/div/section/div/div/div/div[1]/div[3]/div/ul/li[2]

// Wait 5 seconds so the page can load
wait 5

// Save a screenshot of the web page to top_result.png
snap page to homework.png

//Creating a csv file with daily homework details
dump homework to daily_hw.csv
rows = count('//div[@class="meta cv-form bx--form"]')


for row from 1 to rows
    //read (//div[@class="card-content"])['row']/div[@class="form_group"]/form[@class="meta cv-form bx--form"]/d1[@class="field-set type-text title"]/dd to homework
    read (//div[@class="form_group"]['row']/form[@class="meta cv-form bx--form"]/d1[@class="field-set type-text title"]/dd to homework
    hwrow = [homework]
    write 'csv_row(hwrow)' to daily_hw.csv

