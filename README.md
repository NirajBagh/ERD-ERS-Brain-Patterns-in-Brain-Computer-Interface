# ERD-ERS-Brain-Patterns-in-Brain-Computer-Interfac
The aim of the projects to determine ERD/ERS patterns while a paralyzed subject imagining left and right hand motor imagery movements.
The code is written in MATLAB and this code will hepls neuroscientists/engineers/researchers to understand brain patterns.
# Motor Imagery Dataset
The data is provided by Department of Medical Informatics, Institute for Biomedical Engineering, University of Technology Graz. 
# Experiment protocol
The experiment consists of 7 runs with 40 trials each. All runs were conducted on the same day with several minutes break in between. Given are 280 trials of 9s length. The first 2s was quite, at t=2s an acoustic stimulus indicates the beginning of the trial, the trigger channel (#4) went from low to high, and a cross “+” was displayed for 1s; then at t=3s, an arrow (left or right) was displayed as cue. At the same time the subject was asked to move a bar into the direction of a the cue. The feedback was based on AAR parameters of channel #1 (C3) and #3 (C4), the AAR parameters were combined with a discriminant analysis into one output parameter. (similar to [1,2]). The recording was made using a G.tec amplifier and a Ag/AgCl electrodes. Three bipolar EEG channels (anterior ‘+’, posterior ‘-‘) were measured over C3, Cz and C4. The EEG was sampled with 128Hz, it was filtered between 0.5 and 30Hz. The data is not published yet, similar experiments are described in.
The trials for training and testing were randomly selected. This should prevent any systematic effect due to the feedback.

