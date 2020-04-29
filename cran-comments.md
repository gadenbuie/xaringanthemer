## Test environments
* local OS X install, R 3.6.2
* local OS X install, R 4.0.0
* local Ubuntu 18.04, R 3.6.3
* local Ubuntu 18.04, R 4.0.0
* win-builder (devel and release)
* Microsoft Windows Server 2019 (on GitHub Actions), R 3.6.3
* MacOS (release and devel, on GitHub Actions)
* Ubuntu 18.04 (on GitHub Action), R 3.6.3

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.

## Changes in this resubmission

> Package names are case sensitive. (in title:) --> 'xaringan' 

The title was changed accordingly.

> Please do not modify the global environment (e.g. by using <<- or  
> assign() without a specified environment) in your functions. 

`assign()` is used but always with an explicit environment to ensure
that the global environment is not modified.

> Please make sure you do not write or download anything without the 
> user's permission.

I've verified that all file outputs are consented, either by setting a function
argument to the path of an outfile or by prompt. In one case where a required
file needs to be downloaded, the user's consent is requested prior to the
download. If the user consents, the file is downloaded into the temp folder.

> Please make sure that you do not change the user's options, par or 
> working directory.

The global options are not modified by any functions in the package. There are
a few places in the tests where options are temporarily modified for the test,
but the options are reverted when exiting the scope of the test.

> Missing Rd-tags: \value, \arguments

I've added the missing Rd tags in all files.
