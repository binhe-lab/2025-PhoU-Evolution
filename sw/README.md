external software used in this analysis.

## CLANS
I used the [CLANS webapp](https://toolkit.tuebingen.mpg.de/tools/clans). After the run is over, I followed the instructions to download the `clans.jar` program for visualizing the result.

Note that the downloaded java app is the original CLANS program. The [GitHub repo](https://github.com/inbalpaz/CLANS/tree/master) contains a newer Python implementation to be used at the command line. For visualization purposes, the java app should be fine.

To launch the java app and load the output file, use the following command:

```unix
va -Xmx4G -jar clans.jar -load <clans file>
```

- load \<path of clans file\>: Opens the CLANS GUI and loads the sequences information into it using a ‘CLANS’ formatted file. When -load is omitted, the CLANS GUI is started empty and a CLANS input-file can then be loaded using the ‘Load Run’ menu item.
- Xmx\<number\>m / -Xmx\<number\>G: An optional Java parameter, which specifies the maximum memory allocation pool (in Mb or in Gb) for the Java virtual machine (JVM) and can be omitted or increased if needed. This parameter may be useful when loading very large files (>50Mb). It can then be set to -Xmx8G and even more (depending on the memory capabilities of the computer).
