## Use CLANS to cluster representative PhoU and PitR related proteins
2025-04-20

### Goal
Use [CLANS](https://github.com/inbalpaz/CLANS) to perform 2D or 3D clustering of the representative sequences for PhoU and PitR related proteins. See `../analysis/20250407-select-representative-proteins.Rmd` for details on the filtering procedure.

### Steps
I uploaded `../../data/fasta-sequences/20250404-cluster-sequences.sh` to the [CLANS webapp](https://toolkit.tuebingen.mpg.de/tools/clans). There are no options to select. The run finished in about 10 minutes. I downloaded the run file here and also the `clans.jar` as `../../sw/clans.jar`.

Tomorrow I'll continue learning how to visualize the data.

The interactive session is saved as `.clan` file in this folder. To highlight the _S. aureus_ PhoU and PitR, I used `Windows/Selecteds` and searched for `aureus`, then Ctrl+selected both sequences. To select the outliers, I clicked the "Select/Move" button on the main interface and "draw a rectangle" on the graph to select the dots that are not connected to the rest and are clearly outlying. Once I turn on "show names" and "show connections", the results are what I screen-captured and saved. Note that this version of the software doesn't support exporting the graph to a file.

Also, to make all dots fit into the graphing area, I set the zoom level to 95% before taking the screenshot. I manually added the sequence names for the two most outlying dots, since auto-added sequence names would have been out of the screen.
