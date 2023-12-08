---
title: "Setting Up the R Ecosystem"
author: ''
date: "2023-12-08"
slug: "r-eco"
categories: []
tags: []
---

There are several programs to set up in what I like to call your 'R Ecosystem', or the system of the integrated programs you use in your data analysis or programming process. 

When getting started with data analysis in R, many classes and tutorials only go through setting up and using R and RStudio. This is great for beginners because it limits the amount of overhead required to get started and there are fewer places for a beginner to screw up. Unfortunately, this can keep students from understanding the big picture.  

Learning the language of R is important, but the goal is to leverage R to analyze, understand, and communicate about data.  

Your R ecosystem requires several other programs to maximize your efficiency and productivity. R and your IDE of choice (for most R users this is RStudio) give you the basic ability to write and run R code. Markdown gives you the ability to write reports and create other ways to communicate about your code. Git and GitHub work like Box or DropBox for your code, keeping track of different versions, allowing you to work from anywhere that has an internet connection, and giving you the ability to share your work with others without sending cumbersome emails filled with attachments. 

### R and RStudio

Of course you need R and RStudio! If you are brand new to R and RStudio, follow the steps [here][rstudiourl] and use all the default settings. As you become more familiar with R, you may want to change some things, but that can always be done later.

Open up RStudio and take a look around. Under 'Tools - Global Options' you can make changes such as switching to dark mode, increasing the font size, changing the default font, and much more. Click 'Apply' to actually make the changes. For some settings, you may need to close and re-open RStudio to see them take effect. 

Install the following packages: `devtools`, `knitr`, `tidyverse`.

Those are the only packages you need to get started with R. You can always install more packages later!

I like the workflow of package development and if you decide that is for you too, you can take the step of editing your .Rprofile to load `devtools` at the start of every session. This is discussed in [R Packages 2e Chapter 2.2.1: Personal Startup Configuration][RPackages2.2.1URL]. I prefer having the .Rprofile load the package for me because I grew tired of manually calling it in the console at the start of every session and I tend to forget to call it and then get confused when my tools aren't working right. Much easier to just have it loaded automatically for me. See my post [Data  Analysis as an R Package][postdatanlsaspkg] for more information about using a package development style workflow for your day to day R use.  

### RMarkdown

You need RMarkdown or Markdown to write reports. Reports allow you to show others the insane amount of work you have put in on whatever project you are currently working on. You can demonstrate the use of code you have written, show off data analysis you have conducted, and create reproducible research that allows others to double check your work and re-do your analysis for learning or teaching purposes. 

Markdown helps you integrate supported code languages with the document you are writing. There are many examples and entire books about using Markdown with Python and R and SQL. Seek those out for information about the best practices when writing Markdown documents. It is far beyond the scope of this little post.

If you are conducting data analysis or other things that would make you want to create PDF documents, you will need some sort of LaTeX to do this. If you don't want to make PDFs, you don't need to follow the steps below, but if you even think you might want to make PDFs of your documents instead of Word or HTML, you should go ahead and set it up. It's a hassle to set it up later so I recommend you go ahead and do it, assuming you have enough space on your machine for the programs required.

For most people using a personal machine or a machine you have admin privileges on, you can install the `tinytex` R package and follow instructions in the [R Markdown Cookbook][RMarkdown Cookbook URL] to complete set up. 

If you are on a work computer or other machine that you do not have admin privileges on, you will not be able to use `tinytex` to install TinyTeX and it will give you a great big headache to try. Instead, download [MixTeX][mixtexURL]. Many R users prefer to use `tinytex` since it does not require as much space on your computer and the `tinytex` package does most of the LaTeX maintenence for you, however those lovely firewalls at work will be difficult to get around and if you have an IT team that is slow or busy with more important things, MixTeX will work just fine. 

Check that you can knit something by making a new R Markdown file and pressing the knit button at the top of the panel. As knitting to PDF tends to cause the most issues, I like to try to knit to PDF first to check that everything is working smoothly. For further information about what it means to knit or render a document, read [R Markdown Cookbook Chapter 2: Conceptual Overview][rmarkdowncookbookch2url]

If you are using MixTeX and you get an error about not having `tabu` installed, open up the MixTeX console and go to the 'packages' panel. Find the 'tabu' package, press the plus button, and install it. After it's installed, you can close the console and try to knit again. 

If you're using MikTeX and getting other weird errors like RStudio not being able to find your LaTeX installation, then you will need to do the very fun thing of uninstalling MixTeX, R, and RStudio and reinstalling them in the following order: MixTeX, R, then RStudio.

If you're still having problems, you will need to consult another source. Good luck!

### Git and GitHub

For a full course on using RStudio with Git and GitHub, I recommend reading [Happy Git and Github for the UseR][HappyGitWithRURL]. I highly recommend getting started with Git and GitHub sooner rather than later because moving all your old files into a Git repo takes FOREVER. You will need to have Git installed on your machine for this. Instead of using the native RStudio Git client, I use GitKraken as of right now. Either one or whatever Git client you prefer will work just fine.

[Happy Git and GitHub for the UseR][HappyGitWithRURL] has very detailed instructions about how to install Git, connect Git and GitHub with RStudio, and create repos. I highly recommend reading the whole text before you try doing too much, as I've had to delete and restart entire repositories after screwing them up by not following those instructions. That takes way more time and effort than reading. Or you can do as I do and not as I say and learn through trial and error. 

You should now have your R ecosystem set up and ready for a project. 


[RMarkdown Cookbook URL]:https://bookdown.org/yihui/rmarkdown-cookbook/
[HappyGitWithRURL]:https://happygitwithr.com/
[RPackages2.2.1URL]:https://r-pkgs.org/setup.html#personal-startup-configuration
[mixtexURL]:https://miktex.org/
[rmarkdowncookbookch2url]:https://bookdown.org/yihui/rmarkdown-cookbook/conceptual-overview.html
[rstudiourl]:https://posit.co/download/rstudio-desktop/
[postdatanlsaspkg]: https://saragracebiddle-blog.netlify.app/2023-12-08-dat-anls-as-pkg
