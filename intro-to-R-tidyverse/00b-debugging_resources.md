# An Introductory Guide to Troubleshooting Errors

This guide gives you tips and approaches for fixing errors that will arise. We also go through some of the most common errors that 
you will encounter and what they mean. 

## Other helpful resources: 
https://www.r-project.org/help.html
https://www.propublica.org/nerds/how-to-ask-programming-questions
https://blog.hartleybrody.com/debugging-code-beginner/

## Tips for approaching error

### 1) Identify which line and phrase of code is the source of the error.
If you ran many lines of code, you may not know which part of your code is the 
origin of the error message. Isolating the source of the error and trying to 
better understand your problem, should be your first course of action. 
The best way to determine this, is by running each line, and each phrase by 
itself, one at a time. 

### 2) Be sure that the code you think you have run has all successfully run and in order. 
It could be that the problem with your code, isn't that it doesn't work, it 
could be that you didn't run it or you didn't run it in the right order. This 
should be the first thing you check, while checking that the objects that you 
believe should be in your environment, are in your environment. 

### 3) Look at the documentation for a function to make sure you are using it correctly
Once you've better determined the origin of the problem, you should use whatever
documentation is available to you regarding the problematic code. When using 
a new function from a package you are unfamiliar with, it's worthwhile to read 
the documentation so you know how to properly use the functions. For Base R 
functions, Tidyverse functions, and *some* Bioconductor packages, the documentation
will give you a lot of the information you need. However, you will likely find
documentation isn't always thorough or clear. 

As we discussed in 
[`intro_to_R` module](https://alexslemonade.github.io/training-modules/intro-to-R-tidyverse/01-intro_to_r.nb.html),
objects have *structures* and *types*. 

#### Use the RStudio help bar
![search_bar](screenshots/r_search_bar.png)

#### For Bioconductor package functions, look at their documents

Like other a lot of other packages we may be using for genomics analysis, [DESeq2](https://www.bioconductor.org/packages/release/bioc/html/DESeq2.html) is 
a Bioconductor package. We use DESeq2 in the bulk RNA-seq module. 

The documentation on Bioconductor pages have information that can be valuable 
for troubleshooting.
![bioconductor_docs](screenshots/bioconductor_docs.png)


[PDF reference manuals](https://www.bioconductor.org/packages/release/bioc/manuals/DESeq2/man/DESeq2.pdf)

### 4) Google your error message

The main advantage to Googling your errors, is that you likely not the first 
person to encounter the problem. Certain phrases and terms in the error message
will yield more fruitful search results then others.  

When you do Google, two common sources that will probably come up that we 
recommend looking at are:

#### a) [StackOverflow](https://stackoverflow.com/)
StackOverflow this is a forum where people post

#### b) [GitHub Issues](https://help.github.com/en/articles/about-issues)
People also will post their problems to GitHub issues.

#### c) [R-bloggers](https://www.r-bloggers.com/)
R-bloggers has examples of R code that you can use to figure out how to construct
various analyses. 

### 5) Google it again
Because it's unlikely your first attempt at Googling will lead you straight
to an answer; this is something you should continue try with different wordings. 
Through trial and error, and also Google algorithms learning about what you look
for, your search results can eventually lead you to helpful examples and forums.

### 6) Look at the source code for that function

This should rarely be your first approach to solving a problem, since this
approach is difficult and doesn't always pay off. 
This approach will require a a bit more practice at reading code, so it
may not be the most fruitful approach depending on the readability and 
complexity of the code. 

### 7) Post to an appropriate forum on StackOverflow or a GitHub Issue

After you've tediously mined the internet for solutions to your problem and 
still not resolved your problem, you can post your problem to the internet for
help. 

*Keys for asking for coding help are:* 
- Be *specific* with what the problem is. 
- Show them the code for what you have already tried.
- Give a workable example. See this excellent [StackOverflow post](https://stackoverflow.com/questions/5963269/how-to-make-a-great-r-reproducible-example/5963610#5963610) 
on best practices for doing this.
- Show your set up environment, including your session info. 

The better you are able to follow these advice in posting your question, the 
more likely you are to recieve useful help and guidance in regards to your 
question. 

## A guide to the most common R errors

_Example Error 1:_ "No such file or directory"
```
Error in file(file, "rt") : cannot open the connection
In addition: Warning message:
In file(file, "rt") : cannot open file '<FILENAME>': No such file or directory
```
The most likely reason for this error is that the directory you are referencing
isn't the correct path. You should use `getwd()`, `dir()` to reorient yourself 
to where R is looking for the file that you are referencing, and double check 
that the file you are looking at is where you think it is. 

_Example Error 2:_ "could not find function"
```
Error in ... could not find function <FUNCTION_NAME>
```
Most common reason for this is that the function you are trying to use is from 
a package that hasn't been loaded yet. Remember that for you to use a function, 
that is not in base R, you must load the package that the function comes from 
using `library` or you need to precede the function's name with the package 
it comes from and `::`. 

_Example Error 3:_ "object not found"
```
Error in ... object '<OBJECT_NAME>' not found
```
Most likely reason for this error message is that the object you are referencing
doesn't exist in your global environment. Use `ls()` or check your environment 
panel in RStudio to check that the object you have referenced, is actually 
existing in the current environment.

_Example Error 4:_ "no package"
```
Error in library(<PACKAGE_NAME>) : there is no package called ‘<PACKAGE_NAME>’
```
Most likely reason for this message is that you are trying to use a package that
you have not installed (or the package never installed correctly). To fix this, 
you can try to reinstall the package using `install.packages` function or if 
it's from Bioconductor `BiocManager::install` and then try again. If the package
fails to install, there can be a number of reasons it failed, so you will need
to troubleshoot that on your own, folowing the approaches we laid out in the
first part of this document.

_Example Error 5:_ "no method for ... object of class"
```
Error in ... no applicable method for <OBJECT_NAME> applied to an object of class <CLASS_OF_OBJECT>
```
Most likely reason for this error message is that you are attempting to apply 
a function to an object of the wrong object type. Best approach here is to 
reference the function's documentation by looking for it in the search bar, then
looking for what types of objects the function is built to use. After you 
determine what type of object the function is looking for, you can attempt to 
convert it by using `as.numeric` or the respective `as.<TYPE>` function.
If you are trouble with this error often, we recommend you take another look 
through the [`intro_to_R` module](https://alexslemonade.github.io/training-modules/intro-to-R-tidyverse/01-intro_to_r.nb.html)

_Example Error 6:_ "subscript out of bounds"
```
Error in ... subscript out of bounds
```
This most likely means that you are attempting to subset data from an index that 
is larger than the data object is. For example, if you have a `vector` that is 5 entries long, and you attempt to subset an index that is larger than 5, this error will come back. So for vector like 
`alphabet <- c("a", "b")`
if you try to do a subset with anything larger than 2, this error will 
occur. eg, `alphabet[3]` will come back with this error. 
