#!/bin/bash

# Sequence Clustering Script
# 
# This script uses CD-HIT to cluster protein sequences at a specified identity threshold.
# Purpose: Remove redundant sequences from FASTA files to create non-redundant datasets.
# It processes all FASTA files in the current directory (skipping those with existing outputs)
# and creates new files with "-{THRESHOLD}-clustered" suffix.
#
# Usage: ./cluster_sequences.sh [identity_threshold]
#   identity_threshold: Sequence identity threshold (default: 0.95)
#
# Parameters passed to CD-HIT:
# -c VALUE    : Sequence identity threshold
# -n 5       : Word length for indexing (recommended for high identity thresholds)
# -M 16000   : Memory limit in MB (16GB) - increases performance for large datasets
# -d 0       : Use sequence accession instead of truncating in the output file
# -T 4       : Number of CPU threads to use

# Exit on error, undefined variables, and prevent overwriting files
set -euo pipefail

# Get the identity threshold from command line or use default
IDENTITY=${1:-0.95}

# Iterate through all fa.gz files
for file in *.fa.gz; do
    # Create output filename with identity threshold in the name
    base_name=${file%.fa.gz}
    output="${base_name}-${IDENTITY}-clustered.fa"
    
    # Skip if output file already exists
    if [[ -f "$output" ]]; then
        echo "Output file already exists, skipping: $output"
        continue
    fi
    
    echo "Processing $file -> $output (${IDENTITY} identity threshold)"
    
    # Run CD-HIT with specified similarity threshold using 4 cores
    cd-hit -i "$file" -o "$output" -c "$IDENTITY" -n 5 -M 16000 -d 0 -T 4
    
    echo "Completed clustering: $output"
	echo "#Seqs: $(zgrep -c '^>' $file) -> $(grep -c '^>' $output)"
done

echo "All clustering tasks completed."
