# Utilities

## Functions:

### `writes(int fd, const void* msg, size_t len)`
* **Operation:** Η `writes` χρησιμοποιεί ένα loop για να διασφαλίσει ότι **όλα** τα δεδομένα θα γραφτούν στο αρχείο ή στο pipe. Αν η κλήση διακοπεί από σήμα, συνεχίζει αυτόματα την προσπάθεια μέχρι να ολοκληρωθεί η εγγραφή `len` bytes.

### `reads(int fd, void* buf, size_t len)`
* **Operation:** Αντίστοιχα με την `writes`, η `reads` διασφαλίζει ότι θα διαβαστεί ακριβώς ο αριθμός των bytes που ζητήθηκαν, εκτός αν φτάσουμε στο τέλος του αρχείου (EOF).

### `check(ssize_t ret, const char* emsg)`
* **Operation:**  Αν η τιμή `ret` είναι αρνητική (ένδειξη σφάλματος σε system call), τυπώνει το μήνυμα σφάλματος στο `stderr` (file descriptor 2) και τερματίζει αμέσως τη διεργασία με `_exit(1)`.

### `sys_print(const char* msg)`
* **Operation:** Ασφαλής εκτύπωση μηνυμάτων στο `stdout` χωρίς τη χρήση της `printf()`, η οποία είναι "βαριά".