library(PBD)
library(nLTT)

################################################################
# Look for interesting case in which sampling changes topology #
################################################################
#
# Vector of parameters:
#
# pars[1] corresponds to b_1, the speciation-initiation rate of good species
# pars[2] corresponds to la_1, the speciation-completion rate
# pars[3] corresponds to b_2, the speciation-initiation rate of incipient species
# pars[4] corresponds to mu_1, the extinction rate of good species
# pars[5] corresponds to mu_2, the extinction rate of incipient species
params <- c(0.2,0.01,0.2,0.1,0.1)
age <- 3

# Searching for a simple example
for (i in 1:1000) {
  set.seed(i)
  results <- pbd_sim(params,age)
  if (length(results$stree_youngest$tip.label) == 3 && length(results$tree$tip.label) == 4) {
    print(i)
  }
}


# Trees used in the presentation
set.seed(972) # Interesting, topology changes
results <- pbd_sim(params,age, plotit = TRUE)
names(results)

subspecies_tree <- results$tree
incipient_tree <- results$igtree.extant
youngest <- results$stree_youngest
oldest <- results$stree_oldest
plot(subspecies_tree)
plot(incipient_tree)
plot(youngest)
plot(oldest)

nltt_plot(subspecies_tree, lwd = 2, main = "Subspecies tree versus 'youngest' species tree"); nltt_lines(youngest, col = "red", lwd = 2);
nltt_plot(subspecies_tree, lwd = 2, main = "Subspecies tree versus 'oldest' species tree"); nltt_lines(oldest, col = "blue", lwd = 2)

nltt_plot(subspecies_tree, lwd = 2, main = "Subspecies tree versus 'youngest' (red)\n and 'oldest' (blue) species tree"); nltt_lines(youngest, col = "red", lwd = 2); nltt_lines(oldest, col = "blue", lwd = 2)



########################################################
# Look for friendly example with one incipient species #
########################################################
#
# Vector of parameters:
#
# pars[1] corresponds to b_1, the speciation-initiation rate of good species
# pars[2] corresponds to la_1, the speciation-completion rate
# pars[3] corresponds to b_2, the speciation-initiation rate of incipient species
# pars[4] corresponds to mu_1, the extinction rate of good species
# pars[5] corresponds to mu_2, the extinction rate of incipient species
params <- c(0.2,0.01,0.2,0.1,0.1)
age <- 3

# Searching for a simple example
for (i in 1:100) {
  set.seed(i)
  results <- pbd_sim(params,age)
  if (length(results$stree_youngest$tip.label) == 2 && length(results$tree$tip.label) == 3) {
    print(i)
  }
}


# Trees used in the presentation
set.seed(97)
results <- pbd_sim(params,age, plotit = TRUE)
