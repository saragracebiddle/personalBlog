---
title: "Data Analysis as an R Package: The Why"
author: 'Sara Biddle'
date: "2023-12-08"
slug: "dat-anls-as-pkg"
categories: R
tags: []
---

Large data analysis projects can quickly reach a "cliff of complexity", where you have multiple long R script files that are hard to read or comprehend what work you have done.

For a large project, I like to take advantage of the `devtools` and `usethis` packages when possible, which lead me to the development of a workflow using package development tools for data analysis. 

But you like working with R script files, and package development sounds scary and for software engineers, not a data analyst like yourself. So why would you want to change things up?

#### Organization Conventions

When creating files for your data analysis flow, I'm sure you have come across recommendations such as putting the script to load data in one file, another file for data cleaning, a data analysis file, and a file for any functions you write for the project. There are many different recommendations for exactly how to name these files and where to put them within the overall directory of the project. Packages already have conventions about file locations and names. 

Raw data files go in the `data-raw` subdirectory.  
Cleaned data goes in the `data` subdirectory.  
Functions and other R code go in the `R` subdirectory.  
Tests for the code and functions go in the `testthat` subdirectory.  
The `man` subdirectory contains documentation of the functions and datasets in your package.

Conventions like this allow you to look at anyone's package and be able to find components you are interested in inspecting. Without consistent conventions, reading through someone else's project can be frustrating since you have no idea where to find anything. 

So, now you're going to follow the conventions of package organization and file naming. This helps others (and future you) find *where* you put everything. What about *how to use it?*


#### Documented Code

I am definitely guilty of writing code without enough comments for myself, and when I look back at it later I can't understand what exactly the code was doing or how it worked and I have to spend even more time re-learning what I already did. Put in the work to document your code early on in the project and prevent this from happening, because it is super frustrating and time consuming.

You are already familiar with function documentation. You look at that every time you read a help page about a function you are trying to use. It looks something like this:

\\TODO insert image of a help page

Good function documentation describes what the function does, the arguments you use in the function, how to correctly format the arguments, gives examples of using the function correctly and what kind of output you get, and more in-depth or complicated functions will have further details about how the function works that the user would want to know, such as what algorithm is used when computing a regression. 

That much information may seem like overkill for a function you wrote for a specific data analysis project. You may not need to be as in depth as, say, the `tidyverse` package is about their documentation, but you absolutely will not remember how to use this code you wrote in a few weeks or months when you look back at it.

How many times have you pulled up the help page for a function you use all the time? I look up various `tidyverse` functions several times a week. I've used these functions almost daily for years at this point, but I still use them in incorrect or wacky new ways that give me weird messages or errors that I then pour over the documentation to figure out what I did wrong. 

Good, clear documentation keeps your sanity intact and your blood pressure low. If you've ever gotten an error that you can't figure out from a function that doesn't have good documentation, you understand the frustration I am talking about. 

There are many tools to use for documentation, but let's assume you have chosen one and used it.

Now others and future you can see the details of your code and how to use it. Great! You don't have to dig through your comments to figure out how it works. But now you're using this code and you're not getting the right output. Did you test it the first time around?

#### Tested Code

You probably already test your code, but you may not realize it since you aren't putting your tests together in one place. Have you written a function and then used it a few times to make sure it works right but not saved those few uses in your script because it's not really part of what the script is trying to accomplish? Say, you write a quick function to split some strings and get a piece out. You use it a few times in the console with strings that definitely should work to make sure it does what you intend. Then you continue with your work. That's testing your code, just not formally.

Let's walk through an example of what can happen when you do not formally test your code. 

You have some data from a study where participants had to fill out a survey. You need to score this survey for all the participants.  
You've written a function, let's call it `score_survey`, that scores the answers for you. You used it a few times in the console to make sure it outputs the right scores. You save the function as it is. 

A few months later, you remember that you wrote this function and now you want to tweak it to score a similar survey, but you still want it to work with the original survey. So you change the function and you think it will work with both surveys. Now where are those files of original survey data that you used for the first go around? Hopefully in a `data` subdirectory of the original project, but what if you weren't using that convention yet? Could you find it?

And if you can find it, can you remember where you stored the results of scoring the original surveys? Even when you find the original surveys and use the updated function, you will have to check the results against what you got the first time around. 

This seems like a lot of work, and it definitely is if you have a messy file storage system. This is where a formal testing system saves you time and effort. With formal testing, you have already written tests for the code that include test data and expected results. No rooting around your files, and you can run all your tests using a single command from the console. 

This prevents you getting in a whole heap of trouble when you accidentally screw up the new version of the function. You run the tests before you actually use it to score new surveys and you can see if it is giving you the expected results. And yes, I said when you screw up, because you inevitably will. 

You ran your tests, and your new function works with both the original and newly added survey. Awesome! Now you need to save the new version of your function. But how should you do this? You can overwrite the original file, but what if you need to look back at the original function? You can save the new function with a slightly different name but you don't want a bunch of files like `score_survey_1` and `score_survey_2`. This is where version control comes in.

#### Version Control

You are familiar with version control systems. Microsoft Word and Excel do this, where you can roll back to older versions of the same file. Box, Dropbox, and Google Drive also do this. You can see how many versions of a file there have been, when they were updated, and what has changed between versions.

Git and GitHub are the most popular version control systems for use with R. They are both free services and work well with R and RStudio. It's like a Dropbox for code!

Similar to Dropbox, other people can look at and download your files. You can share what you have been working on. If you are on a team, you can all collaborate on the same set of files without emailing new versions back and forth.

If you are traveling or working from a different location than normal, as long as you have internet service you can use GitHub. 

This all sounds great! 

You can organize, document, test, and have version control without using `devtools` or other package development tools. So why convert to a package development workflow?

#### Smaller Environment

R is well known for eating up your RAM. When you use a package development workflow, you can access your data and functions without loading them into your global environment. This can greatly reduce the amount of 'stuff' in your environment and keep your workflow cleaner. In fact, I rarely load anything into my environment these days. 

#### Filepath Clarity

In a script based workflow, you most likely use explicit file paths to tell R where to find your raw data files or other files you need for data analysis. This isn't an issue on your local machine because you probably don't move your files around frequently. 

But what about when you send it to someone else? You send them the `.R` file and the raw data file, which they save onto their computer, and then open up the `.R` file and edit the file path to match where they saved it on their machine. 

That's not too much extra work, but it certainly compounds itself if you have a lot of files. 

You can use development tools to manage this! When you put a file in `data-raw`, it will be in `data-raw` on anyone's machine who downloads and installs your package. You can use specific functions to tell R to look in the `data-raw` subdirectory of the package, no matter what machine the package is installed on, eliminating the need to edit the explicit file path in your script. 

#### Namespace and Dependency Management

Someone else uses a function you wrote, that relies on a function from a package someone else wrote. For example, you wrote a function that cleans your data using `dplyr::mutate` to create new columns from existing columns. You use this function to clean all of your data files that are formatted in the same way. But when you send it to your coworker who wants to use it with their data that is formatted the same way, they get an error! What gives?

One reason could be that they have a different version of `dplyr` installed. The differences between versions may not be much, but in this instance it was enough to cause an error. Is it your version or their version that's causing problems? Who knows! 

What if you've sent them several functions that use a whole bunch of different packages within themselves? How can you figure out which package(s) aren't the same version as what you used when you wrote the functions? What if they don't have some of the necessary packages installed?

This problem leads to dependencies and namespaces. When creating a package, you have a file called 'DESCRIPTION' and a file called 'NAMESPACE'. Between these two files, the packages and functions that your package *depends on* are recorded, along with the version. When your package is installed on someone else's machine, it checks to make sure that those dependencies are installed and updated to the correct version to work with your package. You're familiar with this process, because when you install a package and you don't have the correct dependencies or you have an out of date version, a prompt will appear in the console asking if you want to install and update those packages. 
    


[HappyGitWithRChapter15URL]:https://happygitwithr.com/new-github-first
[rpackages4.1.2url]:https://r-pkgs.org/workflow101.html#name-your-package
[rpackagesch4.3url]:https://r-pkgs.org/workflow101.html#working-directory-and-filepath-discipline
[rpackagesurl]:https://r-pkgs.org/
