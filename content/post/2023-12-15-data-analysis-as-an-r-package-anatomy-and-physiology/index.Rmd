---
title: 'Data Analysis as an R Package: Anatomy and Physiology'
author: ''
date: '2023-12-15'
slug: data-analysis-as-an-r-package-anatomy-and-physiology
draft: true
categories: []
tags: []
---

Human anatomy and physiology classes are split into the anatomy and physiology sections. The anatomy sections describe the physical location of organs and tissues, like that your heart is in the upper left side of your chest, inside the ribcage. The physiology sections describe how those organs work and relate to each other. The heart pumps blood through arteries and veins around your body to deliver oxygen. 


When developing the package, you will be interacting with it in *source* form. We will circle back to how this differs from the packages you have in memory and use in code later. 

## Source Package Anatomy

### `R/`

All source packages have an `R/` directory. 

### `data/`

The `data/` directory within a package contains data that will be accessible to package users. Each file within `data/` should be a `.rda` file that contains a single R object with the same name. 

For example, the file `mydata.rda` in `data/` contains a data frame named `mydata`.

### `data-raw/`

The `data-raw/` directory contains the raw data files that were cleaned and turned into the files that live in the `data/` directory. It also contains the scripts of the cleaning process. I like to have a separate script for each file in `data/` that is named to match the object stored in `data/`. 

### `inst/`

The `inst/` directory, short for 'installed', is the location of miscellaneous files that should be installed with the package. 

### Code

### Testing




#### Package State

If you have never done any package development, please take the time to closely read this section. It may seem unimportant, but you should understand the very basics of package state before beginning.

First, a few definitions that you can refer back to as you read this section.

*Package*
: a collection of files that contain code, tests, documentation, data, and more in an easily shareable format. 

*Library*
: the directory of installed packages on your machine. If you use Windows, you probably have two libraries. One that contains the base `R` packages that are installed with R and R Studio and one that contains other packages you install later. The base packages were installed in a library somewhere like 'C:/Program Files/R/Rversion/Library/' which is available to all users. Other packages are installed somewhere like 'C:/Users/yourprofile/AppData/Local/R/win-library/'. This directory is somewhere out of the way that you do not access regularly and is available to you. 

In other languages, *package* and *library* may mean something slightly different.

There are five package states: Source, bundled, binary, installed, and in-memory. 

*Source* state describes the collection of files you create when writing your package. When you are done writing your package, you *bundle* (compress) it into a single file, a `.tar.gz` file, sometimes called a 'source tarball'. This form is usable on all platforms and easy to transfer. Have you ever tried to send a folder of lots of files over email? Your computer will ask you to compress it and if it is too large, it won't send. Compressing your source code into this state means you won't struggle to share it with others. 

You can decompress the bundled file and get the source code for the package. However, a *source* package looks pretty different from an *installed* package. This is because the development of a package is easier to do the way that *source* packages are structured. If you had to develop your package the way that an *installed* package is structured, it would be more difficult and require more work from you. Instead, you can convert your *bundled* package into *binary* format, and when the *binary* package is decompressed during installation, it is in the structure that a user (and R) expects. 

If you have not developed packages before, you are mostly used to installed and in-memory packages. 

*Installed* packages have been decompressed into the library. There are many different functions for installing packages and the use of each is dependent on the format and state of the package to be installed. So even though the five states are like steps to convert from a  source package to an in-memory package, different functions can skip some of the steps to move directly from one state to another. 

You mostly interact with *in-memory* packages after loading the package by using the `library(packagename)` command. 

The `library()` function looks through your *library(ies)* for the package name you passed to it. It then takes all the 'stuff' from that package and *loads* it into memory. After loading the package 'stuff', it *attaches* the package to your search path so you can use all the 'stuff' in the package without having to use the name of the package over and over again. This is why, when you use a function from a package, i.e. `mutate()` from the `dplyr` package, you can just type `mutate()` and not `dyplr::mutate()`. When you use the double colons (`::`), that tells R to look in the package named to the left of the colons for the function named to the right of the colons . You can use a package that is *loaded* in memory but not *attached* to the search path using `::`. 

The `library()` function does all that for you automatically. However, you cannot use the `library()` function when you are developing packages. Why not?

 Your *source* form package does not exist in the library, because it has not been *installed*. 


[rpackagesch7dataURL]: https://r-pkgs.org/data.html
