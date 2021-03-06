/*REXX pgm displays the sequence (or lengths) for the look & say series.*/
parse arg N ! .;  if N=='' then N=20   /*No nums given? Then use default*/
if !==''  then !=1                     /*Null?   Then assume 1st number.*/

      do j=1  for abs(N)               /*repeat a # times to show  NUMS.*/
      if j\==1  then !=$lookAndSay(!)  /*invoke sub to calculate next #.*/
      if N<0    then say  'length['j"]:"  length(!)   /*show its length.*/
                else say  '['j"]:" !   /*show the number to the screen. */
      end   /*j*/
exit                                   /*stick a fork in it, we're done.*/
/*──────────────────────────────────$LOOKANDSAY subroutine──────────────*/
$lookAndSay: procedure; parse arg x,,$ !   /*define argument passed {X}.*/
chunkSize=1000                         /*define a sensible chunk size.  */
fin = '0'x                             /*use unique char to end scanning*/
x=x || fin                             /*append FIN character to string.*/
               do k=1  by 0            /*now, process the given sequence*/
               y=substr(x,k,1)         /*pick off one char to examine.  */
               if y==fin  then leave   /*if we're at the end, then done.*/
               _=verify(x,y,,k) - k    /*see how many chars we have of Y*/
               $=$ || _ || y           /*build the "say" thingy list.   */
               k=k  + _                /*now, point to the next char.   */
               if length($)<chunkSize  then iterate    /*OK, keep going.*/
               !=! || $                /*append   $   to the  !  string.*/
               chunkSize=chunkSize+100 /*chunkSize is an increasing  #. */
               $=                      /*now,  start   $   from scratch.*/
               end   /*k*/
return ! || $                          /*return the  !  string plus  $. */
