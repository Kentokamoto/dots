# addrs.awk --- simple mailing list program

# Records are separated by blank lines.
# Each line is one field.
BEGIN { RS = "" ; FS = ":" }

{
    for ( i = 1; i <= NF; i++){
      print i ":\t" $i
    }

}
