#
# Contact: miquel [dot] anglada [at] crg [dot] eu
# Date: 2021-02-10
#
# Script purpose
# --------------
# Prepare multi-omic dataset with:
#   - sample metadata
#   - gene expression
#   - exon expression
#   - copy number variation
#   - methylation
#
# Outline
# -------
# 1. Load data for every omic and sample types
# 2. Transform to long format and refactor
# 3. Merge based on sample id
# 4. Save

# libraries
require(readr)
require(reshape2)
require(dplyr)
require(tidyr)

# variables
ROOT = here::here()
DATA_DIR = file.path(ROOT,'data')
RAWDATA_DIR = file.path(DATA_DIR,'raw')
PREPDATA_DIR = file.path(DATA_DIR,'prep')

# inputs
data_cnv_file = file.path(RAWDATA_DIR,'TCGA-cnv-TP53.tsv')
data_meth_file = file.path(RAWDATA_DIR,'TCGA-dna_methylation-TP53.tsv')
data_genexpr_file = file.path(RAWDATA_DIR,'TCGA-gene_expression-TP53.tsv')
data_exexpr_file = file.path(RAWDATA_DIR,'TCGA-exon_expression-TP53.tsv')
metadata_file = file.path(RAWDATA_DIR,'TCGA-sample_metadata.tsv')

# outputs
output_file = file.path(PREPDATA_DIR,'multiomic_data.tsv')

##### FUNCTIONS #####
get_omic_types = function(dat){
    omic_name = dat$omic_name
    omic_type = vector(length = nrow(dat))
    omic_type[grepl('cg',omic_name)] = 'methylation'
    omic_type[grepl('chr',omic_name)] = 'exon_expression'
    omic_type[grepl('ENS',omic_name)] = 'gene_expression'
    omic_type[grepl('(average)',omic_name)] = 'copy_number_variation'
    return(omic_type)
}


prepare_multiomic_dataset = function(data_cnv_file, data_meth_file, data_genexpr_file, 
                                     data_exexpr_file, metadata_file){
    # load omic data
    dat = list(
      data_cnv = read_tsv(data_cnv_file),
      data_meth = read_tsv(data_meth_file),
      data_genexpr = read_tsv(data_genexpr_file),
      data_exexpr = read_tsv(data_exexpr_file)
    )
    metadata = read_tsv(metadata_file)
    
    # remove 'samples' column (it is a duplicate of 'sample')
    dat = lapply(dat, function(x) x[colnames(x) != 'samples'])
    metadata = metadata[colnames(metadata) != 'samples']
    
    # merge on sample
    dat = Reduce(function(x, y) merge(x, y, by='sample'), dat)
    
    # reshape
    dat = melt(dat)
    colnames(dat) = c('sample','omic_name','value')
    
    # identify omic types based on omic names
    dat$omic_type = get_omic_types(dat)
    
    # add sample (phenotypic) metadata
    dat = merge(dat, metadata, by='sample')
    
    # create 'cancer_type' column
    cols_oi = c('_primary_disease','cancer type abbreviation')
    cancer_types = dat[!duplicated(dat[,cols_oi]),cols_oi] %>% drop_na()
    colnames(cancer_types) = c('_primary_disease','cancer_type')
    dat = merge(dat, cancer_types, by='_primary_disease')
    
    # remove misleading columns
    cols_to_drop = c('samples','cancer type abbreviation')
    dat = dat[,!colnames(dat) %in% cols_to_drop]
    
    return(dat)
}

main = function(){
  dat = prepare_multiomic_dataset(data_cnv_file, 
                                  data_meth_file, 
                                  data_genexpr_file, 
                                  data_exexpr_file, 
                                  metadata_file)
  # save
  write_tsv(dat, output_file)
}

##### SCRIPT #####
if (sys.nframe() == 0L) {
  main()
  print("Done!")
}