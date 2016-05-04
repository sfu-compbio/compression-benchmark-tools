# LFQC - Fastq compressor

This project contains the source code for the publication:

Marius Nicolae, Sudipta Pathak and Sanguthevar Rajasekaran, "LFQC: A lossless compression algorithm for FASTQ files"

http://bioinformatics.oxfordjournals.org/content/early/2015/06/19/bioinformatics.btv384.abstract


The latest version can be found at:

https://github.com/mariusmni/lfqc

## Prerequisites:
- Unix system with at least 4gb of RAM (preferably 8)
- Ruby


Change directory to lfqc/

## To compress:

```
ruby lfqc.rb file.fastq  
```

Creates archive file.fastq.lfqc

```
ruby lfqc.rb -ls454 file.fastq
ruby lfqc.rb -solid file.fastq
ruby lfqc.rb -solexa file.fastq
``` 
Same as above but specifies type of dataset

## To uncompress:

```
ruby lfqcd.rb file.fastq.lfqc
```

Uncompresses to file.fastq (dataset type does not matter)

```
ruby lfqcd.rb file.fastq.lfqc output.fastq 
```

Uncompresses to output.fastq 


## Compiling zpaq and lpaq (if errors occur)

Lfqc depends on two compression algorithms: zpaq702 and lpaq8. Their binaries are included in the project but they may not work on your system. Fortunately, their source code is also included so you can build them on your machine.

Please try to run the zpaq binary with no arguments. It should print usage. If it doesn't print usage, you have to delete the binary and run make in the zpaq folder. This should regenerate zpaq for your machine.

Similarly, try to run the lpaq binary. It should print usage options. If it doesn't, you have to delete the binary and run make. Lpaq is a bit old so it requires some 32 bit libraries. If your machine is 64 bit you may have to first install some 32 bit libraries. The following guide should help:

http://www.cyberciti.biz/tips/compile-32bit-application-using-gcc-64-bit-linux.html

## Contact

For questions, suggestions, bugs please contact:

```
Marius Nicolae 
marius.nicolae (at) engr.uconn.edu 
```

