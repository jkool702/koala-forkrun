source "$(git rev-parse --show-toplevel)/frun.bash"
# **Create the bowtie2 alignment database for the Arabidopsis genome**
# https://bioinformaticsworkbook.org/Appendix/GNUparallel/GNU_parallel_examples.html#gsc.tab=0
cd $PASH_TOP/evaluation/bio/input/bio3
bowtie2-build TAIR10_chr_all.fas tair
#ours                                                                            
paste <(printf '%s\n' fastqfiles/*_1.fastq.gz) <(printf '%s\n' fastqfiles/*_2.fastq.gz) | \
frun -j2 '
    read -r f1 f2 <<< "$1"
    base="$(basename "$f1" _1.fastq.gz)"
    bowtie2 --threads 4 -x tair -k1 -q -1 "$f1" -2 "$f2" -S "$base".sam >& "$base".log
'

