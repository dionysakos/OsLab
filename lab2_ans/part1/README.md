# PART 1 - Simple Synchronization

## Methods:

### 1. POSIX Mutexes (`SYNC_MUTEX`)
Χρήση αμοιβαίου αποκλεισμού  μέσω της βιβλιοθήκης `pthread`.
* **How:** Πριν την πρόσβαση στην κρίσιμη περιοχή, το νήμα καλεί την `pthread_mutex_lock()`. Αν το mutex είναι κατειλημμένο, το νήμα τίθεται σε κατάσταση αναμονής από το Λειτουργικό Σύστημα.

### 2. GCC Atomic Operations (`SYNC_ATOMIC`)
Χρήση "ατομικών" εντολών που υποστηρίζονται απευθείας από το υλικό (Hardware-level synchronization).
* **How:** Χρήση των ενσωματωμένων συναρτήσεων του GCC `__sync_add_and_fetch()` και `__sync_sub_and_fetch()`, oι οποίες υποστηρίζονται για απλές πράξεις όπως η ενημέρωση ενός μετρητή.

## Execution:

Use `make` for producing the two exec files: `simplesync-mutex` & `simplesync-atomic`.

## Usage:

`./simplesync-{mutex,atomic}`

## Cleaning:

Use `make clean` to clean the dir from assembly, obj & exec files.

