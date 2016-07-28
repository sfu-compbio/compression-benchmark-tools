# Compression Benchmarking: Tools

Here is the list of included tools. Unless otherwise specified, all executables are exactly those ones we used in the paper. Because of library dependencies, some tools had to be re-compiled for AWS. All manually compiled tools were compiled with gcc 4.8 or 5.2.

Please refer to [Benchmarking Quickstart](https://github.com/sfu-compbio/compression-benchmark/blob/master/aws.md) for more information how to set up benchmarking environment.

## Tools

| Name | Release | Note |
|------|-----|----|
| pigz | [2.3.3](http://zlib.net/pigz/pigz-2.3.3.tar.gz) | |
| pbzip2 |  [1.1.12](https://launchpad.net/pbzip2/1.1/1.1.12/+download/pbzip2-1.1.12.tar.gz) | Uses [bzip2 1.0.6](http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz) <br> *Recompiled for Ubuntu* |
| Cramtools | [0c89dd8](https://github.com/enasequence/cramtools/tree/0c89dd8) | Needs Java |
| Scramble | [1.14.6](http://sourceforge.net/projects/staden/files/io_lib/1.14.6/io_lib-1.14.6.tar.gz/download) | Uses [bzip2 1.0.6](http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz) <br> *Recompiled for Ubuntu* |
| Sambamba | [0.6.0](https://github.com/lomereiter/sambamba/releases/download/v0.6.0/sambamba_v0.6.0_linux.tar.bz2) | |
| Samtools | [e2bb18f](https://github.com/samtools/samtools/tree/e2bb18f) | Uses [htslib 897a34f](https://github.com/samtools/htslib/tree/897a34f) |
| sam_comp | [0.10](http://sourceforge.net/projects/samcomp/files/latest/download) | |
| CBC | [d18afbb](https://github.com/mikelhernaez/cbc/tree/d18afbb) | |
| Picard | [1.138](https://github.com/broadinstitute/picard/releases/download/1.138/picard-tools-1.138.zip) | Needs Java |
| Quip | [629f6fc](https://github.com/dcjones/quip/tree/629f6fc) | |
| DeeZ | [abc6dc8 (v1.9 beta 1)](https://github.com/sfu-compbio/deez/tree/abc6dc8) | *Recompiled for Ubuntu* |
| Fqzcomp | [4.6](http://sourceforge.net/projects/fqzcomp/files/latest/download) | |
| DSRC2 | [5eda82c](https://github.com/lrog/dsrc/tree/5eda82c) | *Recompiled for Ubuntu* |
| Fastqz | [15 (39b2bbc)](https://github.com/fwip/fastqz/tree/39b2bbc) | *Recompiled for Ubuntu* |
| Slimfastq	| [f55ae88](https://github.com/Infinidat/slimfastq/tree/f55ae88) | *Recompiled for Ubuntu* |
| BEETL | [6c240ea](https://github.com/BEETL/BEETL/tree/6c240ea) | |
|ORCOM|	[6280813](https://github.com/lrog/orcom/tree/6280813) | *Recompiled for Ubuntu* |
|LFQC|	[? 1.1 (b6bc1b8)](https://github.com/mariusmni/lfqc/b6bc1b8) | |
|kPath|	[0.6.3](http://www.cs.cmu.edu/~ckingsf/software/pathenc/kpath-0.6.3.tar.gz) | |
|Mince|	[3ddc3a1](https://github.com/Kingsford-Group/mince) | Compiled from scratch |
|LW-FQZip|[1.02](http://csse.szu.edu.cn/staff/zhuzx/LWFQZip/LWFQZip-v1.02.zip) | Source edited to use system `tar` |
|FQC|[3.0c](http://metagenomics.atc.tcs.com/Compression_archive/FQC/FQC_LINUX_64bit.tar.gz) | |
|Leon|[1.0.0](http://gatb-tools.gforge.inria.fr/versions/src/leon-1.0.0-Source.tar.gz) | |
|SCALCE| [v2.8 (ef1bc4c)](https://github.com/sfu-compbio/scalce/tree/ef1bc4c) | Uses  [ zlib 1.2.8](http://zlib.net/zlib-1.2.8.tar.gz) and [pigz 2.3.3](http://zlib.net/pigz/pigz-2.3.3.tar.gz) |
