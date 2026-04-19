# Χειρισμός Αρχείων και Καταμέτρηση Χαρακτήρα - charcnt

## Usage:
`./charcnt <input_file> <output_file> <target_char>`

### Parameters:
* **input_file**: Το αρχείο από το οποίο θα γίνει η ανάγνωση των δεδομένων.
* **output_file**: Το αρχείο στο οποίο θα γραφτεί το τελικό αποτέλεσμα (αν υπάρχει, τα περιεχόμενά του διαγράφονται).
* **target_char**: Ο μοναδικός χαρακτήρας προς καταμέτρηση.

## Assumptions - Choices:
* **Block Reading**: Η ανάγνωση του αρχείου γίνεται σε pages των 1024 bytes (`buff_size`).
* **Syscalls**: Χρησιμοποιούνται οι συναρτήσεις `open()`, `read()`, και `write()` αντί των συναρτήσεων της `stdio.h` (`fopen`, κλπ).
* **Error Handling**: Γίνεται έλεγχος για κάθε κλήση συστήματος μέσω της βοηθητικής συνάρτησης `check()`που βρίσκεται στη utils.{c,h}.
* **Output Format**: Το τελικό αποτέλεσμα μετατρέπεται σε string μέσω της `snprintf()`.

## Execution example:
`./charcnt input.txt results.txt 'a'`
*Το πρόγραμμα θα μετρήσει πόσες φορές εμφανίζεται το 'a' στο αρχείο `input.txt` και θα αποθηκεύσει τον αριθμό στο `results.txt`.*