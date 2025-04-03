## 2025-04-03
Used `CD-HIT` to deduplicate the three files downloaded below. See `../../script/20250402-cluster-seq.md` for details.

Files are named as the parent file with the `-dedup` at the end.

## 2025-03-28
I downloaded sequences from InterPro and UniProt. The goal is to collect sequences for proteins related to _S. aureus_ PhoU, PitR and NptA. Each downloaded fasta sequence file has a matching table that gives the sequence meta information. Downstream analyses will focus on PhoU and PitR first.

- `Pfam-2x-PF01895-36k`: from InterPro page for Pfam PF01895, filtered by domain architecture (2xPhoU)
    I also checked the InterPro landing page for SpPhoU. its "similar proteins" link showed a similar number of entries (36k). The top sequences are the same. I suspect the results are the same between these two approaches.
- `InterPro-protein-similar-to-A0A0H3K7D8-PitR-2.1k`: from InterPro landing page for SpPitR.
- `InterPro-protein-similar-to-A0A0H3K9X3-NptA-4k`: from InterPro landing page for SpNptA.
