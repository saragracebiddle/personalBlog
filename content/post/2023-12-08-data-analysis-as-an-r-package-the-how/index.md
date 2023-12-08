---
title: 'Data Analysis as an R Package: The How'
author: 'Sara Biddle'
date: '2023-12-08'
slug: dat-anls-as-pkg-how
categories: []
tags: []
---

### Before You Begin

#### Project Goals

This post is geared specifically towards creating a package that demonstrates your data analysis process and communicates the results of said data analysis. The package will include data that goes along with the analysis. The package is not intended to create robust data analysis tools for others to use.

If you are interested in creating a package that helps others conduct similar analyses to yours, this may not be the post for you.

#### Preparation

You will need R, RStudio, Git, GitHub, and Markdown.

If you have not set up your R ecosystem to integrate Git, R, and Markdown, read my post [Setting Up Your R Ecosystem][post-r-eco]. This will help you set up your tools to be ready for everything described in this post.

### Starting a Project

You will want to start a clean project. If you've already started work on the data analysis in another project, that's okay. You can bring files over to the new project if needed. I recommend using a new, clean project just to be sure that GitHub and the package development tools get off to a good start, because it can be messy to convert an existing, non-package project to a package on GitHub. 

I have found the easiest way to be:

#### 1. Create a New GitHub Repo

When naming the repo, remember that you will be making it as a package in R. So you need to follow both Git and R's naming conventions. Git allows you to name repos with special characters such as '-', but R will not allow you to name your package that way. You could, technically, name the R package and Git repo differently, but I definitely prefer matching names just to prevent any unnecessary confusion. So, choose a name that is all characters, no '-' or other special characters, and preferably no numeric characters. For further information about package naming conventions, read [R Packages 2e Chapter 4.1.2: Name Your Package][rpackages4.1.2url]. Note that the purpose of your package is different than the kind of packages that the author is discussing in [R Packages 2e][rpackagesurl]. The package we are creating is for data analysis of a specific study or project, not to develop tools in R for others to use. You will not likely submit this package to CRAN or BioConductor, as this package will have limited usefulness for others besides you and the team working on this data analysis. So you can be a little more lax with the naming rules than would be required for you to submit to CRAN or BioConductor. 
    
#### 2. Create a New R Project

In RStudio, click 'File' in the upper left corner and then 'New Project...'  This will open a pop up with three options: 'New Directory', 'Existing Directory', and 'Version Control'. Select 'Version Control'. In the next pop up, choose Git, and in the next pop up put in the URL to your GitHub repo. This should automatically name your new project directory whatever the repo is named. Choose where you want to directory to live on your computer and make sure the check box in the bottom left for 'Open in new session' is selected. Click 'Create Project'. These steps are covered in more depth in [Happy Git and GitHub for the UseR Chapter 15: New Project, GitHub First][HappyGitWithRChapter15URL]. 
    
#### 3. Create the Package

Run the following line in the console:

```
devtools::create_package("path/to/project")
```
    
You will get some warnings when this command is run. 

\\TODO what the warnings are and what to do about them

Check that your current RStudio project, active usethis project, and working directory are the same using `usethis::proj_sitrep()` and checking the output.

```
usethis::proj_sitrep()
#> *      working_directory: 'Users/SaraBiddle/path/to/project'
#> * active_usethis_project: 'Users/SaraBiddle/path/to/project'
#> * active_rstudio_project: 'Users/SaraBiddle/path/to/project' 
```

If your projects and directories do not match, try running `usethis::proj_activate('path/to/project')` and re-checking with `usethis::proj_sitrep()`. 

**Do not mess with your working directory.** Leave it as the top-level of your package. This is per the recommendation of [R Packages 2e Chapter 4.3: Working directory and file path discipline][rpackagesch4.3url] and the reasoning behind it can be found there. 






The R script files that contain the code you write can follow a few different different naming conventions. Just be consistent!

You can put each individual function in its own `.R` file that is named `nameofthefunction.R`. Each file will be named by the individual function contained within it.

You can group several related functions together. For example, if you write an S3 method, you can put the method and its helpers in the same file and name it `nameoftheS3method.r`. Or, if you have several functions that do similar things, such as several custom written plotting or graphing functions, you can put them in the same file and name it something like `plot.R`. 

Each `.R` file under the `R` subdirectory should have a parallel file under the `testthat` subdirectory that contains tests for the code you wrote. 



The `roxygen2` package helps greatly reduce the burden of documentation and keeps your documentation clear and consistent. 

`roxygen2` helps you create these pages without extra work on your end. You don't have to write the Markdown by hand, you just have to put the appropriate `roxygen2` tags by your function.

`roxygen2` can also document your data sets! A documentation block for a dataset looks something like the following:

```
#' Title of my Dataset
#'
#' Longer description of my dataset, including details such as how
#' it was collected and what types of data it includes...
#'
#' @format ##`nameofdataset`
#' A data frame with n rows and m columns.
#' \describe{
#'     \item{columnname}{Column Description}
#'     \item{columnname}{Column Description}
#'     ...
#' }
#' @source <url or other source information>
"nameofdataset"
```


[HappyGitWithRChapter15URL]:https://happygitwithr.com/new-github-first
[rpackages4.1.2url]:https://r-pkgs.org/workflow101.html#name-your-package
[rpackagesch4.3url]:https://r-pkgs.org/workflow101.html#working-directory-and-filepath-discipline
[rpackagesurl]:https://r-pkgs.org/
[post-r-eco]: https://saragracebiddle-blog.netlify.app/2023-12-08-r-eco