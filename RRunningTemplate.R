Sys.setenv(PATH = paste('//anaconda/bin', ':', Sys.getenv('PATH'), sep=''))
source("scUnif_wrapper.R")

arguments <- PyGEM(
  
  py_script="scUnif.py", ## change this to the path to scUnif.py on your machine 
  data_dir = "demo/demo_data/",  ## a temporary directory to hold intermediate data
  out_dir = "out/", ## the output directory where the results will be stored 
  log_dir = "log/", ## the directory where the logging file will be stored 
  output_prefix = "out_", ## the prefix that will be added to the output files
  
  BKexpr=NULL, ## a matrix of bulk RNA-seq counts; 
  ## rows are samples and columns are genes; 
  ## NULL if no bulk data is available
  SCexpr=NULL, ## a matrix of single cell RNA-seq counts; 
  ## rows are samples and columns are genes; 
  ## NULL if no single cell data is available
  K=2, ## number of cell types 
  G=NULL, ## a vector of cell types, 1-indexed (note: different from the python script). 
  ## e.g., c(1,1,2,2,2) for 5 cells from 2 types.
  ## NULL if no single cell data is available
  
  burnin=50, ## number of burnin period to use
  sample=50, ## number of Gibbs samples to use in each EM iteration
  EM_maxiter=50 ## number of maximal EM iterations
)

## The returned “arguments” is a list containing all parameters used by the algorithm, 
## including the following two:
print(paste("Logging has been saved to", arguments$log))
print(paste("Results have been saved under directory", arguments$outdir))
