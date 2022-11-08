
# rule all:
#     input:
#         "plot/output.png"

rule download_data:
    input:
    output:
        "data/input.zip"
    conda:
        "envs/download_data.yml"
    log:
        "logs/download_data.log"
    shell:
        """
        wget --output-document data/input.zip \
              https://github.com/c-scale-community/c-scale-tutorial-snakemake/raw/main/data/f610d7aa9b4c715ad9ddacf0b057b95e6f4a1cdc.zip
        """

rule unzip_data:
    input:
        "data/input.zip"
    output:
        "data/u2000_clc1990_v2020_20u1_raster100m/DATA/U2000_CLC1990_V2020_20u1.tif"
    conda:
        "envs/unzip_data.yml"
    log:
        "logs/unzip_data.log"
    shell:
        """
        cd data
        unzip input.zip
        unzip u2000_clc1990_v2020_20u1_raster100m.zip
        """

rule plot_data:
    input:
        "data/u2000_clc1990_v2020_20u1_raster100m/DATA/U2000_CLC1990_V2020_20u1.tif"
    output:
        "plot/output.png"
    conda:
        "envs/plot_data.yml"
    log:
        "logs/plot_data.log"
    shell:
        """
        cd plot
        python clc_plot.py
        """

# 
# rule cleanup:
#     shell:
#         "rm -rf data/input.zip data/u2000_clc1990_v2020_20u1_raster100m* plot/output.png"
