---
title: notes on how I used Galaxy to reconstruct the gene tree
author: Bin He
date: 2025-11-30
---

The analysis history can be accessed here:

https://usegalaxy.org/u/binhe-lab/h/phou-gene-tree

## First analysis, 2025-04-26
Didn't do bootstrapping. Sample command (copied from Galaxy):

```bash
raxmlHPC-PTHREADS -T 16 -s /jetstream2/scratch/main/jobs/67166365/inputs/dataset_3e205436-d90a-4eae-b7a1-e201dcf68d8c.dat -n galaxy -m PROTGAMMALG -p 1234567890 -N 1 -B 0.03 -c 25 -f D -K GTR -W 100
```

Compare this with the command I used for the [adhesin evolution paper](https://github.com/binhe-lab/C037-Cand-auris-adhesin/blob/master/02-case-studies/03-gene-tree/20210301-raxml-hb/script/raxml-clustalo.sh)

```bash
mpirun /Users/bhe2/bin/raxmlHPC-MPI-AVX -f a -x 12345 -p 12345 -# 500 -m PROTGAMMAAUTO -s $align -w $outdir -n $base_${JOB_ID}
```

Note a couple of differences:

1. Used `-f D` instead of `-f a`. The former "execute one or more rapid hillclimbing searches that will also generateRELL bootstraps" while the latter is the "standard algorithm" (see [RAxML manual](https://cme.h-its.org/exelixis/resource/download/NewManual.pdf))
1. Because I didn't change the Galaxy default of `-N 1`, which is an alternative way of writing `-# 1`, bootstrapping is effectively turned off.
1. Some of the parameters only in the Galaxy command are actually defaults in RAxML, such as `-B 0.03 -c 25 -f D -K GTR -W 100`

## Second analysis, 2025-11-20
Added bootstrapping at the reviewer's request.

Sample command:

```bash
raxmlHPC-PTHREADS -T 16 -s /jetstream2/scratch/main/jobs/72980314/inputs/dataset_8c8cb86e-5e9e-4579-aeb1-285e82431c26.dat -n galaxy -m PROTGAMMALG -p 12345 -N 200 -B 0.03 -c 25 -f a -K GTR -W 100 -x 12345
```

- `-N 500 -x 12345` plus `-f a` will instruct the program to perform rapid bootstrapping with 500 replicates
