# Bioinformatics notes

## Introduction to Bioinformatics

Goal of molecular biology is to understand the physiology of living cells, in terms of
information encoded in cells. Studying this biological information is coined as Bioinformatics.

Different stages of Bioinformatics:

- Genomics - Study of genome (what can happen)
- Transcriptomics - Study of transcript like m-RNA (what appears to be happening)
- Proteomics - Study of Proteome (what makes it happen)
- Metabolomics - Study of Metabolome (what has happened and what is happening)

Systems biology goes over achieving this goal of understanding the functional behaviour
of cell/tissue as a whole.

## Microbiome

- There are 37.2 trillion human cells, 100 trillion cells of other microorganisms.
- We have 20-30k genes, but out microbiome has 2-20 M genes. Thus we are 0.1-1% human
  in terms of genes
- Microbiome weights around 1.5 kg, same as brain.
- But we share only 10% of microbiome with other organisms.

## DNA and Genes

- The word gene refers to only the coding part, thus there is only 2-3% of genes covering genome.
- C, T, U are pyrimidies and A, U are purines.

### DNA

If we are given a forward 5'-3' sequence, then reverse complement of it will be the reverse strand.

- Replication is DNA to DNA.
- Transcription is DNA to RNA.
- Translation is RNA to protein.

### Transcription

In transcription the forward strand is the one which is above and the template
strand is the one which is below and gets copied by the Polymerase. So the final
m-RNA looks just like the forward strand of the DNA but T replaced with U.

The template strand is transcripted in 5' to 3' direction.

### Other RNAs

Not all RNA's are coding RNAs only 15% of them are. The remaining RNAs perform other
tasks like noncoding RNAs.

- tRNA - used as adapeters between m-RNA and proteins.
- rRNA - makes up the basic structure of the ribosome and catalyses the protein synthesis

In the codon table the AUG is the start codon and the UGA, UAA and the UAG are the stop codons.

### Functions of Proteins

Proteins make up cellular structures:

- Hair, Skin, Fingernails
- Enzymes - catalyze chemical reaction
- Receptors - Proteins on the surface of the cells act as receptors.
- Some proteins bind to nucleic acids and other proteins.

### Genes and Genome

Gene-fraction varies from 70% in prokaryotes to 2-3% in eukaryotes,
this is because in eukaryotes the rest of the genome takes part in other tasks like
providing chromosome structural integrity, help regulate where when and how proteins are
made.

### Mutations

Mutations can be additions, deletions, substituitions and mainly rearrangements.

- Mutations are really important because they change the phenotype by which the humans act.
- Mutation are also the cause for genetic disorders and diseases.

### Gene structure - Transcription

- Prokaryotes - In prokaryotes there is no splicing and the start and end codon can be directly
  found in the genes. The UTR (untranslated regions) stay in the DNA itself.
- Eukaryotes - There are more complex concepts like exon and introns, The first RNA transcript
  contains various redundant structures like exons act as UTRs which need to be removed in a
  procedure called splicing.

The primary RNA transcript is called pre-mRNA because it is not ready
for transcription yet.
There is another step called Post-transcriptional modification which
adds an RNA cap at start
and a poly-A-tail (Adenine) at the end to indicate the end for translation.

#### Does on gene give the same protein everytime

- **Alternative Splicing** - We discussed how one gene can give rise to various DNA, this happens because the exons are relative
and differ from place to place. Depending on the need of the protein a particular segment is considered exon or intron.
This causes protein diversity.

- **Alternative Initiation** -
There can be multiple sites where transcription can start for a given
gene (start codon after TATA).
This could lead to different m-RNAs from the same general gene.

- **Alternative translation** -
Similar to splicing but a step after that. Can lead to mutliple isoforms of the same protein.

## DNA sequencing

For computation to happen successfully, we need to sequence the whole
DNA and represent it in the string format.

Eg: RT-PCR uses a specific primer to detect 3 specific regions of N-gene.

Different procedures include:

- Identifying the region of interest.
- **DNA Fragmnetation** - Isolate this region from the organism.
- **Cloning**: Moving it to a more managable species like bacteria and
  allowing them to reproduce.

### Restriction Endonuclease (RE)

They are used for cutting the DNA at particular locations.

Uses:

- Replacing the cut fragments to study how genetic diseases are spread.
- Used for mass production of certain proteins.
- Study the expression is controlled (see which parts are expressed which are just
  there for now reason)
- Study the organization of genetic material.

#### Evolution of ER

ERs were originally found in bacteria as a protective mechanism to prevent the phages
from infecting the DNA. The normal DNA is methylated in such a way that it doesn't
affect normal functionality of Transcription and Replication.

Thus the REs which float around the cytoplasm detect the unmethylated DNA from the
phages and cleave them out, thus called "restriction" of DNA infection.

### DNA Fragmentation

They are named after the bacteria that they are found in,
the recognition sites are where they perform the cut and are
a palindrome (in a sense that first half is complement of second)

Cohesive ends is when the split is not exactly in center and a tail exists. This
end is sticky. If both ends of the DNA is cut using this, then the restricted DNA
will stick to itself to form circular Restricted DNA.

The blunt end is the one that is cut exactly at the center and it not sticky.
To obtain cohesive ends we need to add a linker molecule or adapter molecule.

### Linkers and Adapters

- If RE site gives a blunt end, we can bruteforce a bunch of small linkers which
  will increase ligation in blunt sites and help introduce cohesiveness. Linkers
  are blunt from both ends.
- Linkers and adapters are also used when we don't have the required RE site of
  the given vector.
- Adapters are blunt at one end and not at another. They are usually used when
  a particular site exists in the plasmid itself and we want to prevent self-ligation.
- Adapter usually reduces one extra step that linkers have to go through to add a
  cohesive end.

### REs - Special Notes

- **Isoschizomers** - Different REs with the same sites.
- They are usually palindromes
- Uses:
  - They can be used to make a phyical map of genome
  - They can be used to localize the origin of replication
  - Position early and late genes into this map.
  - Test any of these genes for biological activtiy.
  - We can mutate any one of these to gather information about genes expressed.
  - Variations in DNA; mutations can be studied using restriction sites.
  - Genetic engineering - Used to cut and paste any genome to obtain the desired one.
  - DNA Sequencing - this is the first step to sequence the whole DNA.

## Restriction Mapping

- We can use the restriction maps of two different REs at once called Multiple digests
  to orient the fragments correctly.

## Cloning

We use bacteria or yeast to store foreign DNA called a vector. This vector
is called recombinant vector.

The following features are required for cloning vectors:

- A sequence that permits its propogation
- A cloning site, a versatile one can be used by many REs.
- Selecting Drug resistant markers, so that in a given sample the population of
  unrecombinant bacteria can be eliminated.
- Origin of replication in the vector that is independent of the host chromosome.

Some vectors like plasmids, bacteriophages, Cosmids are used to store smaller insert 
sizes, but the bigger ones like BACs and YACs are the ones used these days.

### Plasmids

They are extra-chromosomal circular DNAs which can be found in bacterial cytoplasm
and they replicate autonomously.

These are very easy to isolate and insert back anytime into the bacteria but they
can only contain small fragments.

### Bacteriophage Vectors

Usually come from bacteriophages which live in bacteria and have linear molecules.

### Artificially constructed vectors

Cosmids - plasmid + cos of phage
BAC - Bacterial Artifical Chromosomes: also a plasmid
Yeast AC- Yeast DNA

### Yeast Artificial Chromosomes

These are different from the rest and required because they are big and
can hold 1000,000s of base pairs at once.

It is a chromosome by itself. Just like any other chromosome it contains:

- Telomere - This is the end of each chromosome and protects degradation from
  nucleases.
- Centromere - It disguises as any other eukaryotic chromosome during cell division
  and spindle fibres will divide this.
- Origin of replication - so that it can autonomously replicate.

## DNA Sequencing

We can sequence DNA in different contexts:

### Gene sequencing (PCR)

Used to sequence specific gene of interest, we usually use
PCR and require the following ingredients:

- A mixture of 4 deoxy-nucleotides in ample quantities. dNTP
- Taq DNA Polymerase (Taq is a name of some bacteria)
- Primers: Used as starting point of DNA synthesis.
- Genomic DNA of interest which we will sequence

There are 3 steps with different temperatures:

- Denaturation at 94*C - This breaks up the DNA into individual strands and stops
  all enzymatic reactions. (1 minute)
- Annealing at 54*C - At this temperature the primers are added to the mixture and
  are attached to the individual strands. Going too low will make the whole strands 
  attach. Then DNA polymerase also gets attached. (45 seconds)
- Extention at 72*C - At this temperature the primers are extended and still makes
  sure no other enzymatic reactions are occuring. (2 minutes). Here everything is
  removed except dNTPs.

#### PCR Sequencing

Finally we would like to find the actual nucleotides of gene ampilfied in the
previous step.

This is not used from whole Genome but only used for small cloned DNA or existing
PCR fragment. We use flouroscent ddNTP which are color coded. Each ddNTP will
terminate the chain of extension. This method is also called dideoxy,
chain-termination or Sanger's sequencing.

Steps in PCR sequencing:

- Sequecing cycle:
  - Denaturation at 94*C
  - Annealing at 54*C
  - Extension at 60*C (instead of 72\*C)
  The PCR Sequencing only linearly increases becoz other strand is blocked.
  Thus more DNA is required in input thus proceeds amplification.
- Seperation of the fragments: We use gel electrophoresis to load the mixture in
  acrylamide gel. DNA migrates to positive side and smaller starnds migrate faster.
  The resolution must be atleast 1 base pair.
- Detection on an automated sequencer: When you shine lazer and use diffraction
  graing, you can differentiate the flouroscence using CCD camera.
- Assembling the sequenced parts: a computer program

### Whole genome sequencing, modern: High Throughput sequencing

- Clone-by-Clone or Hierachial Shotgun Sequencing
  - Genome cut into 150Mb pieces
  - They are inserted to BAC vectors where they are replicated and stored
  - These BACs then isolated and mapped to determine the order, this path is
    called the Golden Tiling Path.
  - Each of the BACs is the converted to smaller plasmids and Sanger sequenced.
  - These sequences are then aligned to have identical regions overlap.
- Whole genome shotgun sequencing (WGS)
  - Blast apart the entire human genome into 1-10 kb pieces and then use Sanger
    Sequencing to sequence them. The challenge is to assemble them.
  - There are two types of gaps; sequence gaps: we know the order and orientation
    of each contig and clones that span them, physical gaps: no information about
    adjacent contigs nor about DNA spanning the gap.

Here's the time calculation of number of reads required:

$$ Required Reads = Genome Length * Desired Coverage / Read Length $$

Say each read is 1 minute. then multiply and check how many seconds is required.
We need (nlogn) algo atleast.

### cDNA sequencing

Here we can use the mRNA itself to sequence the DNA, but we need a faster way
to amplify the mRNA in the cytoplasm. This done by the Reverse Transcription
Polymerase Chain Reaction.

We will create a cDNA back from mRNA, this process is reverse transcription.

EST - Make a database of partial sequences of expressed genes. Basically just a
segment of the real gene. We do a database lookup to get the actual.

### HTS sequencing

Using modern methods, we can sequence 100s of Gbs per week.
Workflow of these:

- Template Generation
  - Convert starting DNA into library of sequencing templates
  - Fragmentation
  - Size selection
  - Adapter ligation
  - Immobilization

Applications of HTS:

- Resequencing: But instead of one individual's genome we sequence multiple's and
  find differences. Try to analyse cancer cell mutations, population sampling.
- Transcriptomics: We can now study mRNA sequences and try to identify the
  RNA expression, helps in better quantification.
- Epigenomic Analysis - DNA methylation patterns, post-translational modifications
  of histones, transcription factors, nucleosomes etc.
- Metagenome Analysis - To sequence different species of bacteria etc. for taxonomy
  and phylogeny.

## Sequence comparision

After sequencing a lot of genomes we have to be able to use this knowledge to
find significance in similarity between pairs of these sequences.
Another fundamental problem in cDNA sequencing it to find the function of a
given new protein. There are other uses for sequence comparision

- Identifying species of any given living cell
- Phylogenic analysis of any given species
- Genome comparision between different species to find matchin traits
- Genome comparision between different individuals of same species to study
  phenotypes.
- Genome comparision between different diseases or cancers cells to understand
  mutations.
- Structure prediction for RNA.
- Identifying overlapping regions of DNA which is widely used in sequencing
- Identifying repeats; copies of the same domain

### Methods of sequence comparision

- Graphical - Dot plots
- Sequence alignment - pairwise alignment, comparing two different residues to
  find the amount of distance between them.

### Dot plots

- Comparing different sequences - Regions of similarity and finding overlap
  regions.
- Self-Comparision - Finding rearragements, internal repeats, finding
  self-complementary sequences so RNA folding can be predicted.

It has the advantage that it just shows every matching combination leaving the
identifier to pick the useful.

To avoid random matches we often use a sliding window and compare for matches.
This sliding window maybe shifting by 1 length or k length. We try to find the
apt window size for this task, and even if the windows differ, we can introduce
**stringency** which is the amount of difference to call it ovGerlapping in plot.

Uses:

- If there are larger diagonal matches, that means more "conserved" regions.
- Can be used to find domain homologies.
- Find overlapping sequences
- Internal repeats and dupilcations
- Can be used to find insertions and deletions for shifted diagonals
- To identify self complementary regions in RNA

## Pairwise alignment

### Memory Usage

Memory usage is a common challenge that we face when using DP (mn) algos for comparing against
big bases (nucleotide and genomes of billion residues long).

- One common approach useful only when finding score of the alignment instead of the alignment
is to just forget the rows which are not i-1, and j-1.
- Another common approach is divide and conquer Hirschberg's algorithm: This ensures full alignment.
The steps are:
  
  - First divide the grid using the middle column m/2. Then use the linear space algorithm above to
    find the scores on each point on the column, the one with highest score will definitely lie on
    the alignment.
  - Now the main point which gives memeory advantage is to ignore the the bottom-left and top-right
    parts of the middle alignment. This is because the only allowed moves are bottom and right, so
    it is not possible to include calculated middle point and also be a part of alignment.
  
Some popular EMBOSS programs which use this are:

- Emboss matcher - local alignment, linear version of water
tcher - global alignment 

### Heuristic Algorithms

These algorithms, locate short stretches using preprocessed databases, and then
extend the match for alignment. Usually fast but may sometimes not match the ideal ones.

#### FASTA - Fast Alignment

Here are the steps:

- Use a lookup table to get all k-tuple matches and put them on a dotmatrix.
- Look for adjacent hotspots in the same diagonal and join them to form larger segments
- Find the highest scoring diagonals out of these
- Use another PAM Matrix as a scoring matrix to assign scores to these segments, and
  consider only the initial segments (greater than the initn threshold)
- Now join the closer diagonal segments using gap penalties
- Compute the alternative local alignments after the diagonal sequence is formed.
- Use DP to actually align the best randing sequences from above local alignments.

#### BLAST - Basic local alignment search tool

- Use the lookup table to find shorter k-tuple matches. Each k-tuple has a HSP score,
  only the ones that pass this score are used for searching.
- These matches are called hits, overlapping segments form longer segments.
- Pick one of the segment and try to extended it in either direction until the
  score drops below the threshold.
- Now join the closer segments similar to one in fasta and compute alternative local
  alignments for the resulting sequence.

Blast is so widely used that there are many alternatives to it depending on the usecase:

- Psi Blast - Position Specific Iterated Blast: This constructs a scoring matrix with mulitple
  sequence of hits. Also uses the scoring matrix from the previous matches and iterates multiple
  times until convergence is reached. This is useful to find homologs among sequences with 10-25%
  match.
- Phi Blast - Pattern hit Iterated Blast: Uses regular expressions and local alignment to find
  sequence motifs in proteins.

#### Statists in BLAST

Statistics of dsitribution of local alignment is well known but little is known about the distribution
of global alignment.

By calculating the distribution of scores of optimal alignment for 10,000 random proteins, it was
estimated that K = 0.035, $\lambda = 0.252$.

- The E-value or the expectation value of having HSP above score S is:
  $$ E = K(mn)e^{-\lambda S} $$
  Here m and n are the length of the query sequcence and n is the database size.

- The raw scores in blast have no meaning, they need to be normalized (to be made into
a normal curve). For this we use the k and $\lambda$. For score S we define bit score (S')

  $$ S' = \frac{\lambda S - ln K }{ln2} $$

Thus E-value can be written in terms of bit scores as $E = mn2^{-S'}$

#### Inferring homology

- For proteins, if we have 45%+, that means there is high similarity in both structure and function.
- 25%+ means they are sparsely related and have similar folding pattern
- 18-25% - means they might or might not be similar but cannot
rule out homology.

Since low complexity regions might be similar even though they
are not homologous, we usually can't imply homology from similarity.
Even the other way around is mot possible, homologous sequences might not be similar

Good rough estimate in BLAST is to have

- 75% match in nucleotide, with E-value less than $10^{-6}$
- 25% match in protein, with E-value less than $10^{-3}$

### PAM Matrix

Percentage accepted mutation is the measure of how much of a sequence gets
mutated. One common method to score the matrices based on the probability of 
mutation is log-odds;
$$ S(a|b, t) =  \frac{P(a|b, t)}{q\_a q\_b} $$
where qa and qb are the frequences of amino acids.

PAM matrices are originally derived from global alignment of closely related
sequences, then normalize the matrix such that there is 1% chance for change.

$$ M\_n = (M\_1)^n $$

Here n is called the PAM distance, which is a measure of evolutionary distance.

There are some problems with this model:

- We just assume that all the AA mutations are uncorrelated, but there are many
  factors like some parts being conserved and less mutating,
- idea of extrapolating single mutations to distantly related proteins

### BLOSUM Matrix (Block Substituition Matrix)

Maintains a BLOCK database of conserved protein sequences, and directly maps
transition probabilities of distantly related AAs

These are used to find some remote homologies but no evolutionary model can be
based on this. The BLOSUM-K means this matrix is useful to find K% of similarity

Steps to get a blosum matrix:

- Derived from local ungapped alignment of distantly related sequences. We
  construct a basic frequency map of each substituition.
- If % identity of these entries is more than k, then we just cluster those
  entries.
- The we find the Expectation value of the pair freq and calculate the log-odds
  and then scale it to have integers

$$ log\frac{P\_f(observed)}{P\_f(expected)} $$

### Reward/Penalty ratio

The reward(n) and penalty(m) ratio calculation, this value changes based on the
identity of sequences we are looking at. 99% conserved shud have m=-3, 95% m=-2,
and 75% etcc m=-1. The reward penalty ratio shud be increase with divergence of
sequences.


### MSA

There are conserved regions even in distantly related organisms, thus we need to
align multiple homologue sequences together in columns.

MSA is used to find the conserved and non-conserved regions instead of just
blind pair-wise alignment.

Uses of MSA in genes:

- Genome sequencing - shotgun sequencing
- Inferring evolutionary relationship and constructign phylogentic trees
- DNA barcoding
- Discovering new regulatory elements and finding primers, and probes for DNA
  microarrrays

In protein we can use it to:

- Finding homology in proteins and building phylogentic trees
- constructing scoring matrices
- finding motifs and predicting the structure or folding.

Best MSA happens when we use non-conserved regions of closely related species
and conserved regions of distant species.

#### Pairwise alignment

Doing dp is very long because it requires O($L^N$) complexity. But there are
methods to make it easier:

- MSA Algorithm or Carrilo Lipman - If strings are similar, then the alignment
will be close to the diagonal, so calculate pairwise alignment on projection of
main diagonal to 2-D and disregard other regions so no need to waste time
calculating regions.

- There is another method called consensus where we align two sequences and
  calculate the consensus of the two sequences and use it to get the next
  sequence. To avoid problems with having order, use the P-W pairs to build
  scores.

A better formalization of above is profiling/clustering based alignment, where
we construct hierarchial phylogenic trees based on the scores of the pairwise
alignment and use that in the next iterations.

- When we align two sequences and they are very similar, we call it an
  alignment.
- We then align those alignments, we take weighted average based on the
  scores we have calculated.

#### Localized MSA

To uses:

- Identify motifs in proteins which have functional importance. If we want to
  know what function a protein performs, we try to find motifs.
- Helps in Global MSA for distant species

Glossary:

- Motifs/Patterns - A syntax of word / regular expression which describes a
  well-conserved region which charecterizes a protein family
- Profile - A probabilistic syntax representing a well-conserved region. This
  can be represented in terms of PSSM (Position specific scoring matrix) or HMM
  (Hidden Markov Matrix).

Profile/Motif based searches use family information in their searches, to
improve prediction between distant family members.

#### Profiles

It is a matrix which stores log-odds. To build a profile:

- Align the sequences in the family using MSA
- Extract the most conserved regions and create a profile
- Compute the log odds ratio for each alphabet.

Better than patterns because there is no relative probability of occurence of
characters in pattern.

#### Blocks

They are patterns but without gaps, usually found when doing MSA highly
conserved regions with no gaps.

## Modelling Molecular Evolution

We use the concept of conditional probability, and turns out the base
substituition is the only popular way, all other ways are rare.

If we only compare the number of mutations from S0 to Sn, we might miss the
hidden mutations, thus we have to consider a markov matrix.

Challenges with markov matrix:

- The history is lost, but in reality one substituition might lead to another
  until a stable is reached which is not portrayed.
- The 3rd nucleotide in codon might change the AA doesn't change, hence the
  probability of mutation increases there.

### Jukes-Cantor Model

The probability of all substituitions is $\frac{\alpha}{3}$.

We can define $\alpha$ as mutation rates, this allows us to have
the formula

$$ \alpha = (substituitions per site)/(time step) $$

The eigen-vectors of Jukes-Cantor matrix are even number of -1s (0,2)
The eigenvalue is $1 - \frac{4\alpha}{3}$

We also have a result for general value of $\alpha$ when time is t

$$ \alpha\_t = \frac{3}{4}(1 - \left( 1 - \frac{4\alpha}[3] \right)^t) $$

Usually we have the value of $\alpha\_t$, not  $\alpha$ and t. But we cannot
even calculate that. So we use a rough estimate.

$$ \alpha t = d = -3/4 ln ( 1 - \frac{4}{3}p ) $$

But this is called Jukes-Cantor distance.

### Distance Methods

Uses the Jukes-Cantor or other distances

- UPMA - assumes molecular clock is active
- Frich-Maro - unrooted
- NJ distance, uses some wierd M(i,j) thing - unrooted with neighbors considered

### Character Based Methods

- Maximum parsimony distance: uses minimum number of substituitions required to
  go from one dna to other

- Maximum likelyhood calculates the likelihood of a certain alphabet appearing
  in the aligned column.

### Bootstrapping

This just randomly misaligns the original sequences, which may cause changes in
the trees produced. Useful when we analyse how often a cluster or branch is
found to calculate the confidence of the method.

## Phylogenic Trees

Number of rooted trees is given by:
$$ \frac{(2n-3)!}{2(n-2)[n-2]!} $$

Number of unrooted trees is given by:
$$ \frac{(2n-5)!}{2(n-3)[n-3]!} $$

