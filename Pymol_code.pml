# Load wild-type and mutant models
load 1t6b.pdb, WT
load PA.pdb, PA
load CMG2.pdb, CMG2
load PA_CMG2.pdb, DM

# Rename for clarity
set_name PA, PA_mutant
set_name CMG2, CMG2_mutant
set_name DM, double_mutant

# Define interface selections (adjusted residue numbers)
select wt_interface, WT and ((chain X and resi 327-368) or (chain Y and resi 119-139))
select pa_interface, PA_mutant and ((chain A and resi 356-397) or (chain B and resi 119-139))
select cmg2_interface, CMG2_mutant and ((chain A and resi 373-397) or (chain B and resi 125-145))
select dm_interface, double_mutant and ((chain A and resi 356-397) or (chain B and resi 119-139))

# Show cartoon representation and color
show cartoon, all
color lightblue, wt_interface
color yellow, pa_interface
color salmon, cmg2_interface
color violet, dm_interface

# Highlight mutation residues (based on WT numbering)
select mut_wt, WT and resi 344+122
select mut_pa, PA_mutant and resi 344+122
select mut_cmg2, CMG2_mutant and resi 344+122
select mut_dm, double_mutant and resi 344+122

show sticks, mut_*
color red, mut_*

# Show salt bridges or distances
dist salt_wt, WT and resi 344 and name NH1+NH2, WT and resi 122 and name OE1+OE2, 4
dist salt_pa, PA_mutant and resi 344 and name OE1+OE2, PA_mutant and resi 122 and name OE1+OE2, 6
dist salt_cmg2, CMG2_mutant and resi 344 and name NH1+NH2, CMG2_mutant and resi 122 and name NZ, 4.8
dist salt_dm, double_mutant and resi 373 and name OE1+OE2, double_mutant and resi 125 and name NZ, 2.6

# Calculate and report RMSD between WT and each mutant at the interface
align pa_interface, wt_interface
align cmg2_interface, wt_interface
align dm_interface, wt_interface

# Export session if needed
save all_structures.pse
