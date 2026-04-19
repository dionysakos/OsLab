# Part 2 - Parallel Mandelbrot Set


## Load Balancing

### Διαμοιρασμός Εργασίας (Data Decomposition)
* **Cyclic Partitioning:**. Κάθε νήμα $i$ αναλαμβάνει τις γραμμές $i, i+N, i+2N, \dots$. 
* **Leverage:** Καλύτερο Load Balancing, καθώς οι γραμμές του Mandelbrot έχουν διαφορετικό υπολογιστικό κόστος.

## Need for Synchronization:

Το πρόγραμμα υποστηρίζει δύο μεθόδους για να διασφαλίσει ότι το νήμα $i+1$ θα τυπώσει μόνο αφού τελειώσει το νήμα $i$.

### 1. Semaphores - `SYNC_SEM`
Χρησιμοποιείται ένας πίνακας από $N$ POSIX Semaphores, όπου κάθε ένας λειτουργεί ως "άδεια εκτύπωσης" για το αντίστοιχο νήμα.
* **Operation:** Το νήμα $i$ περιμένει στον σηματοφόρο `local_lock[i]`. Αφού τυπώσει τη γραμμή του, κάνει `post` στον `local_lock[(i+1)%N]`, δίνοντας τη σκυτάλη στον επόμενο.
* **Init:** Μόνο ο σηματοφόρος του νήματος 0 αρχικοποιείται με τιμή 1, ενώ οι υπόλοιποι με 0.



### 2.Condition Variables - `SYNC_CV`
Χρήση ενός Mutex και ενός πίνακα από Condition Variables.
* **Operation:** Χρησιμοποιείται μια κοινή μεταβλητή `turn` που δείχνει ποιο νήμα έχει σειρά. Το νήμα $i$ "κοιμάται" στην CV `out[i]` όσο δεν είναι η σειρά του. 
* **No Thundering Herd Problem:** Χρησιμοποιείται πίνακας από CVs (αντί για μία κοινή `pthread_cond_broadcast`), ώστε να ξυπνάει **μόνο** το συγκεκριμένο νήμα που έχει σειρά, μειώνοντας το contention για το mutex, και άρα τη σπατάλη μη ωφέλιμου χρόνου λόγω των Context Switches.

## Extra:

* **Signal Handling:** Υλοποιήθηκε handler (Question 5) για το σήμα `SIGINT` (Ctrl-C), ώστε σε περίπτωση διακοπής να επαναφέρονται τα χρώματα του τερματικού (`reset_xterm_color`) πριν την έξοδο.
* **Signal and Continue:** Στην έκδοση με CVs, ακολουθείται το μοντέλο "Signal and Continue". Το νήμα στέλνει το σήμα στον επόμενο και απελευθερώνει το lock αμέσως μετά, ώστε ο επόμενος να μπορέσει να το αποκτήσει.

## Execution:

Use `make` for producing the two exec files: `mandel-sem` & `mandel-cv`.

## Usage:

`./mandel-{sem,cv} <number_of_threads>`

## Cleaning:

Use `make clean` to clean the dir from assembly, obj & exec files.
