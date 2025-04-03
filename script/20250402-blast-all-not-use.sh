# ---
# title: generate all-against-all blast results
# author: Bin HE
# date: 2025-04-02
# goal:
#   - calculate blast similarities
#   - use stats to remove redundant ones
# ---


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
