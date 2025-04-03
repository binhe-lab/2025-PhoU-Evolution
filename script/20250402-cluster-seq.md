---
title: generate all-against-all blast results
author: Bin HE
date: 2025-04-02
---


# Goal
Cluster sequences based on similarity to remove redundancies

# Notes
## 2025-04-03, CD-HIT
Turns out blast all against all is very inefficient. It took my macbook running the script overnight and it is still not done. Not to mention I would have to parse the resulting data to actually filter the sequence file.

I remember reading about a different approach used by NCBI to create their nr database used for BLAST. After consulting Claude, I found out the tool to use, `CD-HIT`. I installed it using conda on my laptop. The command to cluster the sequence file is

`cd-hit -i input.fasta -o output.fasta -c 0.99 -n 5 -T 4`

> -c 0.99 sets the similarity threshold to 99%
> -n 5 sets the word length to 5
> -T 4 tells the program to use four threads

I also renamed the files to make them easeier to track. The program is indeed super fast, taking less than a second per file...

## 2025-04-02, BLAST
Try using BLAST all against all to calculate pairwise sequence similarity. Got the code working with help from Claude Code

```bash
# Create combined fasta file
cat ../data/fasta-sequences/*.fa.gz > all_sequences.fasta.gz
gunzip all_sequences.fasta.gz

# Make BLAST database
makeblastdb -in all_sequences.fasta -dbtype prot -out ../data/blastdb/all_seq_db

# Run all-against-all BLAST
blastp \
	-query all_sequences.fasta \
	-db ../data/blastdb/all_seq_db \
	-outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore" \
	-out ../input/fasta-sequences/20250402-all-vs-all-blast.tsv

# Remove the all_sequences.fasta file
rm all_sequences.fasta
```
