## ======================== Micro Editor ===================================

## https://www.tecmint.com/micro-linuxtext-editor-with-syntax-highlighting/
## Micro – A Modern Terminal Based Text Editor with Syntax Highlighting

## ============================= PATH ======================================
#system('sudo chmod +rwx /usr/lib/R')

pth <- .libPaths(c('/usr/lib/R/library', '/usr/lib/R/site-library'))
.libPaths(pth)

#dir(paste0(R.home(component = "home"), '/etc'))
## https://www.jumpingrivers.com/blog/customising-your-rprofile/

## -------------------------------------------------------------------------

## https://stackoverflow.com/a/13736073/3806250
# candidates <- c( Sys.getenv("R_PROFILE"),
# file.path(Sys.getenv("R_HOME"), "etc", "Rprofile.site"),
# Sys.getenv("R_PROFILE_USER"),
file.path(getwd(), ".Rprofile") )
# 
# Filter(file.exists, candidates)

## https://github.com/rstudio/reticulate/issues/496#issuecomment-601446838
#Sys.setenv(RETICULATE_PYTHON = '/usr/bin/python3')
#Sys.setenv(RETICULATE_PYTHON = '~/anaconda3/bin/python')
Sys.setenv(RETICULATE_PYTHON = '~/anaconda3/bin/python3')
## -------------------------------------------------------------------------

## We set the cloud mirror, which is 'network-close' to everybody, as default
local({
  r <- getOption('repos')
  r['CRAN'] <- 'https://cloud.r-project.org'
  options(repos = r)
})

## ======================== Load Packages ==================================

if(!suppressPackageStartupMessages(require('BBmisc'))) {
  install.packages('BBmisc', dependencies = TRUE, 
                   INSTALL_opts = '--no-lock')
}
suppressPackageStartupMessages(require('BBmisc'))

if(!suppressAll(require('devtools'))) {
  install.packages('devtools', dependencies = TRUE, 
                   INSTALL_opts = '--no-lock')       
  devtools::install_github('r-lib/devtools')
}

if(!suppressAll(require('startup'))) {
  ## https://github.com/HenrikBengtsson/startup
  remotes::install_github('HenrikBengtsson/startup', ref = 'develop')
}

if(!suppressAll(require('Rdym'))) {
  devtools::install_github('wrathematics/Rdym')
}

## https://www.jumpingrivers.com/blog/customising-your-rprofile/
if(!suppressAll(require('rprofile'))) {
  remotes::install_github('csgillespie/rprofile')
}

if(!suppressAll(require('prompt'))) {
  # Used for nice prompts
  remotes::install_github('gaborcsardi/prompt')
}

if(!suppressAll(require('colorout'))) {
  # Used for nice colours in the terminal; not for Windows
  remotes::install_github('jalvesaq/colorout')
}

if(!suppressAll(require('tidyverse'))) {
  devtools::install_github('tidyverse/tidyverse')
}

if(!suppressAll(require('lubridate'))) {
  devtools::install_github('tidyverse/lubridate')
}

pkgs <- c('MASS', 'devtools', 'lubridate', 'tidyverse', 'rprofile', 'prompt', 
          'colorout', 'Rdym', 'startup')
suppressAll(lib(pkgs))

## -------------------------------------------------------------------------

## https://stackoverflow.com/a/17486231/3806250
#.First()
.First <- function() {
  Rdym::RdymEnable()
  BBmisc::suppressAll(startup::install())
  BBmisc::suppressAll(startup::startup())
}

## ======================== Start Up =====================================

## https://www.jumpingrivers.com/blog/customising-your-rprofile/
if (interactive() && suppressAll(requireNamespace('rprofile'))) {
  
  # Only useful if you use Makefiles
  rprofile::create_make_functions()
  
  # Startup options
  rprofile::set_startup_options()
  
  # Not RStudio console
  if (rprofile::is_terminal()) {
    rprofile::set_terminal()
  } else {
    rprofile::set_rstudio()
  }
  
  .env = rprofile::set_functions()
  suppressAll(attach(.env))
  # Display wifi and no of R sessions
  # Linux only
  rprofile::set_startup_info()
}

## -------------------------------------------------------------------------

# Prints RStudio project on start-up
setHook('rstudio.sessionInit', function(newSession) {
  active_rproj = rprofile::get_active_rproj()
  if (!is.null(active_rproj)) {
    message(glue::glue("{crayon::yellow('R-project:')} {active_rproj}"))
  }
}, action = 'append')

#BBmisc::suppressAll(.First())
tryCatch(suppressWarnings(startup::startup(all = TRUE)), error=function(ex) 
  message('.Rprofile error: ', conditionMessage(ex)))
