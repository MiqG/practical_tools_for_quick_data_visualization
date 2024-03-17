<img src="images/hex-tidyverse.png" width="25%">
<img src="images/palmerpenguins.png" width="25%">

# What is the Tidyverse?

The tidyverse is an opinionated collection of R packages designed for
data science. All packages share an underlying design philosophy,
grammar, and data structures.

To start playing around with the functions from these packages we will
use the
[`palmerpenguins`](https://allisonhorst.github.io/palmerpenguins/articles/intro.html)
data set. This simple data set has both continuous and categorical
variables that make it perfect for showcasing how different functions
work.

    require(tidyverse)

    penguins_url = "https://raw.githubusercontent.com/allisonhorst/palmerpenguins/master/inst/extdata/penguins.csv"
    dat = read_csv(url(penguins_url))
    dat = dat %>% drop_na()
    head(dat)

    ## # A tibble: 6 × 8
    ##   species island    bill_length_mm bill_depth_mm flipper_length_mm body_mass_g
    ##   <chr>   <chr>              <dbl>         <dbl>             <dbl>       <dbl>
    ## 1 Adelie  Torgersen           39.1          18.7               181        3750
    ## 2 Adelie  Torgersen           39.5          17.4               186        3800
    ## 3 Adelie  Torgersen           40.3          18                 195        3250
    ## 4 Adelie  Torgersen           36.7          19.3               193        3450
    ## 5 Adelie  Torgersen           39.3          20.6               190        3650
    ## 6 Adelie  Torgersen           38.9          17.8               181        3625
    ## # ℹ 2 more variables: sex <chr>, year <dbl>

This dataset follows `tidy` concept, which requires the data to be in
the following format:

-   rows = observations
-   columns = parameters / variables

In a real life scenario a large part of your time (80%) will be spent
bringing non-tidy data into a tidy format in a process called
data-wrangling so that you can use the `tidyverse` efficiently. For this
practice our data is already in the required format!

# Data-Wranlging in the tidyverse

Here we will introduce the basic functions `filter`, `select` and
`arrange` as well as the `%>%` operator:

-   `filter` will subset the rows of your table
-   `select` allows you to pick columns of interest
-   `arrange` lets you order your table to look at extreme values

Finally, the `%>%` operator is a key concept of tidyverse and helps with
the readability of your code. It takes input from the previous function
and pipes it into the next one. Let’s have a look!

    # Let us select only penguins of the species Adelie

    adelie = dat %>% 
      filter(species == "Adelie")

    # Display the first few rows

    head(adelie)

    ## # A tibble: 6 × 8
    ##   species island    bill_length_mm bill_depth_mm flipper_length_mm body_mass_g
    ##   <chr>   <chr>              <dbl>         <dbl>             <dbl>       <dbl>
    ## 1 Adelie  Torgersen           39.1          18.7               181        3750
    ## 2 Adelie  Torgersen           39.5          17.4               186        3800
    ## 3 Adelie  Torgersen           40.3          18                 195        3250
    ## 4 Adelie  Torgersen           36.7          19.3               193        3450
    ## 5 Adelie  Torgersen           39.3          20.6               190        3650
    ## 6 Adelie  Torgersen           38.9          17.8               181        3625
    ## # ℹ 2 more variables: sex <chr>, year <dbl>

    # Now let us pick only those penguins that are of species Adelie AND on the island of Torgersen

    adelie_torgesen = dat %>% 
      filter(species == "Adelie", island == "Torgersen")

    # Display the first few rows

    head(adelie_torgesen)

    ## # A tibble: 6 × 8
    ##   species island    bill_length_mm bill_depth_mm flipper_length_mm body_mass_g
    ##   <chr>   <chr>              <dbl>         <dbl>             <dbl>       <dbl>
    ## 1 Adelie  Torgersen           39.1          18.7               181        3750
    ## 2 Adelie  Torgersen           39.5          17.4               186        3800
    ## 3 Adelie  Torgersen           40.3          18                 195        3250
    ## 4 Adelie  Torgersen           36.7          19.3               193        3450
    ## 5 Adelie  Torgersen           39.3          20.6               190        3650
    ## 6 Adelie  Torgersen           38.9          17.8               181        3625
    ## # ℹ 2 more variables: sex <chr>, year <dbl>

    # Imagine we only care about three variables: species, island and bill_length_mm. Let's subset our dataframe

    adelie_torgesen = adelie_torgesen %>% 
      select(species, island, bill_length_mm)

    # Display the first few rows

    head(adelie_torgesen)

    ## # A tibble: 6 × 3
    ##   species island    bill_length_mm
    ##   <chr>   <chr>              <dbl>
    ## 1 Adelie  Torgersen           39.1
    ## 2 Adelie  Torgersen           39.5
    ## 3 Adelie  Torgersen           40.3
    ## 4 Adelie  Torgersen           36.7
    ## 5 Adelie  Torgersen           39.3
    ## 6 Adelie  Torgersen           38.9

    # Let us check for the Adelie penguin from Trogersen with the longest bill using arrange

    adelie_torgesen %>% 
      arrange(-bill_length_mm)

    ## # A tibble: 47 × 3
    ##    species island    bill_length_mm
    ##    <chr>   <chr>              <dbl>
    ##  1 Adelie  Torgersen           46  
    ##  2 Adelie  Torgersen           45.8
    ##  3 Adelie  Torgersen           44.1
    ##  4 Adelie  Torgersen           43.1
    ##  5 Adelie  Torgersen           42.9
    ##  6 Adelie  Torgersen           42.8
    ##  7 Adelie  Torgersen           42.5
    ##  8 Adelie  Torgersen           42.1
    ##  9 Adelie  Torgersen           41.8
    ## 10 Adelie  Torgersen           41.5
    ## # ℹ 37 more rows

    # Let us do all of the above operations in one go

    adelie_torgesen <- dat %>% 
      
      # select for Adelie + Torgersen penguins
      filter(species == "Adelie", island == "Torgersen") %>% 
      
      # only extract the columns we care about
      select(species, island, bill_length_mm) %>% 
      
      # arrange our table in descending order 
      arrange(-bill_length_mm)

    # Display the first few rows

    head(adelie_torgesen)

    ## # A tibble: 6 × 3
    ##   species island    bill_length_mm
    ##   <chr>   <chr>              <dbl>
    ## 1 Adelie  Torgersen           46  
    ## 2 Adelie  Torgersen           45.8
    ## 3 Adelie  Torgersen           44.1
    ## 4 Adelie  Torgersen           43.1
    ## 5 Adelie  Torgersen           42.9
    ## 6 Adelie  Torgersen           42.8

    # Doing the same thing in base R works but is harder for humans to read

    # Select for Adelie + Torgersen penguins and only extract the columns we care about
    adelie_torgesen_base <- subset(dat, species == "Adelie" & island == "Torgersen", c("species", "island", "bill_length_mm"))

    # Arrange our table in descending order 
    adelie_torgesen_base <- adelie_torgesen_base[order(-adelie_torgesen_base$bill_length_mm), ]

    # Display the first few rows
    head(adelie_torgesen_base)

    ## # A tibble: 6 × 3
    ##   species island    bill_length_mm
    ##   <chr>   <chr>              <dbl>
    ## 1 Adelie  Torgersen           46  
    ## 2 Adelie  Torgersen           45.8
    ## 3 Adelie  Torgersen           44.1
    ## 4 Adelie  Torgersen           43.1
    ## 5 Adelie  Torgersen           42.9
    ## 6 Adelie  Torgersen           42.8

## Time to practice fitlering, selecting and arranging your data

One Task will ask you to select all of the columns starting with
`bill_`. Type the following `?tidyselect::starts_with` in your console
and try to incorporate it into your select function.

    # Task 1.1: Select all penguins that are not of the species Adelie and have a bill length greater than 30mm. (Have a look at the != and > operators)

    not_adelie = dat %>% 
      # Filter for penguins that ARE NOT (!=) Adelie
      filter(species != "Adelie", bill_length_mm > 30)

    head(not_adelie)

    ## # A tibble: 6 × 8
    ##   species island bill_length_mm bill_depth_mm flipper_length_mm body_mass_g
    ##   <chr>   <chr>           <dbl>         <dbl>             <dbl>       <dbl>
    ## 1 Gentoo  Biscoe           46.1          13.2               211        4500
    ## 2 Gentoo  Biscoe           50            16.3               230        5700
    ## 3 Gentoo  Biscoe           48.7          14.1               210        4450
    ## 4 Gentoo  Biscoe           50            15.2               218        5700
    ## 5 Gentoo  Biscoe           47.6          14.5               215        5400
    ## 6 Gentoo  Biscoe           46.5          13.5               210        4550
    ## # ℹ 2 more variables: sex <chr>, year <dbl>

    # Task 1.2: Now check which penguin species exist in your new dataframe using distinct().

    not_adelie %>% distinct(species)

    ## # A tibble: 2 × 1
    ##   species  
    ##   <chr>    
    ## 1 Gentoo   
    ## 2 Chinstrap

    # Task 2.1: Starting from the original dataframe (dat), select only species, island and all columns starting with bill_. Take a look at starts_with().

    dat_subset = dat %>% 
      select(species, island, starts_with("bill_"))

    head(dat_subset)

    ## # A tibble: 6 × 4
    ##   species island    bill_length_mm bill_depth_mm
    ##   <chr>   <chr>              <dbl>         <dbl>
    ## 1 Adelie  Torgersen           39.1          18.7
    ## 2 Adelie  Torgersen           39.5          17.4
    ## 3 Adelie  Torgersen           40.3          18  
    ## 4 Adelie  Torgersen           36.7          19.3
    ## 5 Adelie  Torgersen           39.3          20.6
    ## 6 Adelie  Torgersen           38.9          17.8

    # Task 2.2: Now check for the penguin with the shortest bill depth.

    dat_subset %>% arrange(bill_depth_mm)

    ## # A tibble: 333 × 4
    ##    species island bill_length_mm bill_depth_mm
    ##    <chr>   <chr>           <dbl>         <dbl>
    ##  1 Gentoo  Biscoe           42.9          13.1
    ##  2 Gentoo  Biscoe           46.1          13.2
    ##  3 Gentoo  Biscoe           44.9          13.3
    ##  4 Gentoo  Biscoe           43.3          13.4
    ##  5 Gentoo  Biscoe           46.5          13.5
    ##  6 Gentoo  Biscoe           42            13.5
    ##  7 Gentoo  Biscoe           44            13.6
    ##  8 Gentoo  Biscoe           40.9          13.7
    ##  9 Gentoo  Biscoe           45.5          13.7
    ## 10 Gentoo  Biscoe           42.6          13.7
    ## # ℹ 323 more rows

This practice introduces two operators:

-   `!=` which stands for NOT EQUAL to and in our case selected
    everything but the species `Adelie`
-   `>` GREATER sign which we used on `bill_length` to select for those
    rows in which bill\_length is greater than 30mm.

Next we used `distinct` which will only keep unique/distinct rows of
your dataframe and is great for having a quick glimpse at your data.
Finally, we automated the selection by using `starts_with` which as the
name suggests allows you to pick any column which starts with a pattern
you specified.

# More Data-Wranlging in the tidyverse

Next we will introduce `count`, `group_by`, `mutate` and `summarize`:

-   `count` lets you quickly count the unique values of one or more
    variables
-   `group_by` lets you group your data on a defined variable
-   `mutate` creates new columns that are functions of existing
    variables
-   `summarize` creates a new data frame. It returns one row for each
    combination of grouping variables

These functions let you calculate summary statistics and perform other
data manipulations that are useful.

    # Let us quickly count the number of each species present in our dataset

    dat %>% count(species)

    ## # A tibble: 3 × 2
    ##   species       n
    ##   <chr>     <int>
    ## 1 Adelie      146
    ## 2 Chinstrap    68
    ## 3 Gentoo      119

    # Now let us create a new column that contains the mean bill_length for each species

    dat_processed = dat %>% 
      
      # First group by species so that every following operation is done per group
      group_by(species) %>% 
      
      # Now create a new column called mean_bill_length_mm
      mutate(mean_bill_length_mm = mean(bill_length_mm))

    dat_processed

    ## # A tibble: 333 × 9
    ## # Groups:   species [3]
    ##    species island    bill_length_mm bill_depth_mm flipper_length_mm body_mass_g
    ##    <chr>   <chr>              <dbl>         <dbl>             <dbl>       <dbl>
    ##  1 Adelie  Torgersen           39.1          18.7               181        3750
    ##  2 Adelie  Torgersen           39.5          17.4               186        3800
    ##  3 Adelie  Torgersen           40.3          18                 195        3250
    ##  4 Adelie  Torgersen           36.7          19.3               193        3450
    ##  5 Adelie  Torgersen           39.3          20.6               190        3650
    ##  6 Adelie  Torgersen           38.9          17.8               181        3625
    ##  7 Adelie  Torgersen           39.2          19.6               195        4675
    ##  8 Adelie  Torgersen           41.1          17.6               182        3200
    ##  9 Adelie  Torgersen           38.6          21.2               191        3800
    ## 10 Adelie  Torgersen           34.6          21.1               198        4400
    ## # ℹ 323 more rows
    ## # ℹ 3 more variables: sex <chr>, year <dbl>, mean_bill_length_mm <dbl>

    # Now let us create a more condensed dataframe containing summary statistics of intereset (mean, sd, median, iqr) for all species, island combinations.

    dat_summary = dat %>% 
      
      # First group by species so that every following operation is done per group
      group_by(species, island) %>%
      
      # Now summarize the data
      summarize(mean_bill_length_mm = mean(bill_length_mm),
                sd_bill_length_mm = sd(bill_length_mm),
                median_bill_length_mm = median(bill_length_mm),
                iqr_bill_length_mm = IQR(bill_length_mm))
      
    dat_summary

    ## # A tibble: 5 × 6
    ## # Groups:   species [3]
    ##   species   island   mean_bill_length_mm sd_bill_length_mm median_bill_length_mm
    ##   <chr>     <chr>                  <dbl>             <dbl>                 <dbl>
    ## 1 Adelie    Biscoe                  39.0              2.48                  38.7
    ## 2 Adelie    Dream                   38.5              2.48                  38.8
    ## 3 Adelie    Torgers…                39.0              3.03                  39  
    ## 4 Chinstrap Dream                   48.8              3.34                  49.6
    ## 5 Gentoo    Biscoe                  47.6              3.11                  47.4
    ## # ℹ 1 more variable: iqr_bill_length_mm <dbl>

Here we introduced ways to quickly assess the abundance of individual
observations using `count`. Next, we grouped our data using `group_by`
to calculate the mean bill length for each species and storing the
values in a new column using `mutate`. Finally, we caculated several
summary statistics in one go and saved the results in a more condensed
dataframe using `summarize`.

## Time to practice grouping, counting, mutating and summarizing your data

    # Task 3.1: Filter for penguins with a bill depth <= 30mm and count the number of animals per species

    dat %>% filter(bill_depth_mm <= 30) %>% 
      group_by(species) %>% 
      count(species)

    ## # A tibble: 3 × 2
    ## # Groups:   species [3]
    ##   species       n
    ##   <chr>     <int>
    ## 1 Adelie      146
    ## 2 Chinstrap    68
    ## 3 Gentoo      119

    # Task 4.1: Select columns 1:4 and the sex column, group_by species and sex and summarize the values to get mean_bill_length and mean_bill_depth 

    dat_matched = dat %>% 
      
      # You can use select using positional indicators
      select(1:4, sex) %>% 
      
      # group_by species
      group_by(species, sex) %>% 
      
      # summarize
      summarize(mean_bill_length_mm = mean(bill_length_mm),
                mean_bill_depth_mm = mean(bill_depth_mm))

    dat_matched

    ## # A tibble: 6 × 4
    ## # Groups:   species [3]
    ##   species   sex    mean_bill_length_mm mean_bill_depth_mm
    ##   <chr>     <chr>                <dbl>              <dbl>
    ## 1 Adelie    female                37.3               17.6
    ## 2 Adelie    male                  40.4               19.1
    ## 3 Chinstrap female                46.6               17.6
    ## 4 Chinstrap male                  51.1               19.3
    ## 5 Gentoo    female                45.6               14.2
    ## 6 Gentoo    male                  49.5               15.7

    # Task 4.2: Now convert millimeters into meters and name the new columns with the suffix "_m" instead of "_mm"

    dat_matched = dat_matched %>% 
      
      # use across to perform the same 
      mutate(across(starts_with("mean_"), ~ .x / 1000, .names = "{sub('_mm$', '_m', .col)}"))

    dat_matched

    ## # A tibble: 6 × 6
    ## # Groups:   species [3]
    ##   species   sex    mean_bill_length_mm mean_bill_depth_mm mean_bill_length_m
    ##   <chr>     <chr>                <dbl>              <dbl>              <dbl>
    ## 1 Adelie    female                37.3               17.6             0.0373
    ## 2 Adelie    male                  40.4               19.1             0.0404
    ## 3 Chinstrap female                46.6               17.6             0.0466
    ## 4 Chinstrap male                  51.1               19.3             0.0511
    ## 5 Gentoo    female                45.6               14.2             0.0456
    ## 6 Gentoo    male                  49.5               15.7             0.0495
    ## # ℹ 1 more variable: mean_bill_depth_m <dbl>

# Conclusion

Here we introduced the most basic functions used for data-wrangling in
`tidyverse` that can be concatenated, at will, using the pipe operator
`%>%`. The results are easily interpretable lines of code that will help
you understand what you produced even months after generating the code.
At many points during this practice it would have been intuitive to
visualize our results, which is what we are going to explore next using
the packages `ggplot2` and `ggpubr`.

# References

-   [`tidyverse`](https://www.tidyverse.org/)
-   [`data-wrangling cheatsheet`](https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf)

# Session Info

    sessionInfo()

    ## R version 4.3.1 (2023-06-16)
    ## Platform: x86_64-pc-linux-gnu (64-bit)
    ## Running under: Ubuntu 18.04.6 LTS
    ## 
    ## Matrix products: default
    ## BLAS:   /usr/lib/x86_64-linux-gnu/openblas/libblas.so.3 
    ## LAPACK: /usr/lib/x86_64-linux-gnu/libopenblasp-r0.2.20.so;  LAPACK version 3.7.1
    ## 
    ## locale:
    ##  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
    ##  [3] LC_TIME=es_ES.UTF-8        LC_COLLATE=en_US.UTF-8    
    ##  [5] LC_MONETARY=es_ES.UTF-8    LC_MESSAGES=en_US.UTF-8   
    ##  [7] LC_PAPER=es_ES.UTF-8       LC_NAME=C                 
    ##  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
    ## [11] LC_MEASUREMENT=es_ES.UTF-8 LC_IDENTIFICATION=C       
    ## 
    ## time zone: Europe/Madrid
    ## tzcode source: system (glibc)
    ## 
    ## attached base packages:
    ## [1] stats     graphics  grDevices utils     datasets  methods   base     
    ## 
    ## other attached packages:
    ##  [1] lubridate_1.9.2 forcats_1.0.0   stringr_1.5.1   dplyr_1.1.1    
    ##  [5] purrr_0.3.4     readr_2.1.5     tidyr_1.2.1     tibble_3.2.1   
    ##  [9] ggplot2_3.5.0   tidyverse_2.0.0
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] bit_4.0.5        gtable_0.3.4     crayon_1.5.2     compiler_4.3.1  
    ##  [5] tidyselect_1.2.1 parallel_4.3.1   scales_1.3.0     yaml_2.3.8      
    ##  [9] fastmap_1.1.1    R6_2.5.1         generics_0.1.3   knitr_1.45      
    ## [13] munsell_0.5.0    pillar_1.9.0     tzdb_0.3.0       rlang_1.1.0     
    ## [17] utf8_1.2.4       stringi_1.7.8    xfun_0.42        bit64_4.0.5     
    ## [21] timechange_0.3.0 cli_3.4.0        withr_3.0.0      magrittr_2.0.3  
    ## [25] digest_0.6.29    grid_4.3.1       vroom_1.6.5      hms_1.1.3       
    ## [29] lifecycle_1.0.4  vctrs_0.6.1      evaluate_0.23    glue_1.6.2      
    ## [33] fansi_1.0.3      colorspace_2.0-3 rmarkdown_2.26   ellipsis_0.3.2  
    ## [37] tools_4.3.1      pkgconfig_2.0.3  htmltools_0.5.7
