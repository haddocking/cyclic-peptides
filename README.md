#Cyclic-peptide-docking-benchmark

This is the docking benchmark described in the manuscript:
'A Cyclisation and Docking Protocol for Cyclic Peptide Modeling using HADDOCK2.4'
To be published. 

Content:
Dataset directory composed of sub-directories corresponding to each peptide and complex of the cyclic peptide benchmark. This directory also contains the required scripts for the analysis.
	
	a. Each complex sub-directory contains: 

		HADDOCK-ready files:
		∙ 'XXX_r_b.pdb': Bound receptor PDB with renumbered atoms and renamed chain ID
		∙ 'XXX_r_u.pdb': Unbound receptor PDB with renumbered atoms and renamed chain ID
		∙ 'XXX_peptide_XXXw.pdb': Bound ligand PDB with renumbered atoms and renamed chain ID
		∙ 'ensemble_pdb.list': List of all ligand PDBs that are included in the ensemble

		Analysis directory named 'ana_script' that contains:
		∙ 'target.pdb': Reference complex structure with renumbered atoms and renamed chainID that matches HADDOCK output
		∙ all required scripts for the analysis: 'cluster-fnat.csh', 'fraction-native.csh', 'i-rmsd_to_xray.csh', 'l-rmsd_to_xray.csh', 'run_all-no-it0.csh', 'make-target-files.csh', 'run_all.csh', 'run_all-dockQ.csh', 'run_dockQ.csh' 
		∙ all required files for the analysis: 'target.contacts10', 'target.izoneA', 'target.contacts5', 'target.izoneB', 'target.izone', 'target.lzone'
		
		Distance restraints file:
		∙ 'ambig.tbl': Ambiguous interaction restraints
		∙ 'hbonds.tbl': Unambiguous restraints

	b. Each peptide sub-directory contains:

		HADDOCK-ready files:
		∙ 'peptide_beta.pdb': Pymol generated PDB with ligand in a beta-sheet conformation
		∙ 'peptide_polypro.pdb': Pymol generated PDB with ligand in a polyproline conformation
		∙ 'pdb.list': List of ligand PDBs for step2 of cyclisation
		∙ 'XXX_peptide_XXXw.pdb': Unbound ligand PDB (HADDOCK output from step2 of cyclisation)
		∙ 'step3_pdb.list': List of ligand PDBs for step3 of cyclisation

		Distance restraints file:
		∙ 'unambig.tbl': unambiguous cyclisation restrains

	c. 'setup-analysis_example.csh': script to run the Fnat (and i-RMSD) analysis


